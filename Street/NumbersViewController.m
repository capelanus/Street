//
//  NumbersViewController.m
//  Street
//
//  Created by Daniel López on 04/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "NumbersViewController.h"
#import "NumbersCell.h"

@interface NumbersViewController ()

@end

@implementation NumbersViewController{

    NSMutableArray *titulos;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    titulos=[[NSMutableArray alloc]init];
    
    
    [titulos addObject:@"POLICIA"];
    [titulos addObject:@"COMISARIAS"];
    [titulos addObject:@"SERENAZGO"];
    [titulos addObject:@"HOSPITALES"];
    [titulos addObject:@"CLINICAS"];

    [titulos addObject:@"AMBULANCIAS"];
    [titulos addObject:@"ORGANISMOS GUBERNAMENTALES"];
    [titulos addObject:@"MUNICIPALIDADES"];
    [titulos addObject:@"SERVICIOS"];
    [titulos addObject:@"SERVICIOS A LA COMUNIDAD"];
    [titulos addObject:@"PROTECCION AL CONSUMIDOR"];
    
    NSLog(@"%@",titulos);

    
                             
                              
    
  

    

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [titulos count];
    
}


- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    NumbersCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[NumbersCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.mainLabel.text=[titulos objectAtIndex:indexPath.row];
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row==0) {
        
        [self performSegueWithIdentifier:@"policesegue" sender:self];
    }
    
    if (indexPath.row==1) {
        
        [self performSegueWithIdentifier:@"comisariasegue" sender:self];
    }
    
    if (indexPath.row==2) {
        
        [self performSegueWithIdentifier:@"serenazgosegue" sender:self];
    }
    
    if (indexPath.row==3) {
        
        [self performSegueWithIdentifier:@"hospitalsegue" sender:self];
    }
    
    if (indexPath.row==4) {
        
        [self performSegueWithIdentifier:@"clinicasegue" sender:self];
    }
    
    if (indexPath.row==5) {
        
        [self performSegueWithIdentifier:@"ambulanciasegue" sender:self];
    }

    
    if (indexPath.row==6) {
        
        [self performSegueWithIdentifier:@"organismosegue" sender:self];
    }
    
    
    if (indexPath.row==7) {
        
        [self performSegueWithIdentifier:@"municipalidadsegue" sender:self];
    }
    
    if (indexPath.row==8) {
        
        [self performSegueWithIdentifier:@"serviciosegue" sender:self];
    }
    
    if (indexPath.row==9) {
        
        [self performSegueWithIdentifier:@"comunidadsegue" sender:self];
    }
    
    if (indexPath.row==10) {
        
        [self performSegueWithIdentifier:@"consumidorsegue" sender:self];
    }
    
  
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
