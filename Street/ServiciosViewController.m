//
//  ServiciosViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ServiciosViewController.h"
#import "ServiciosCell.h"

@interface ServiciosViewController ()

@end

@implementation ServiciosViewController{

    NSMutableArray *servicios;

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
    servicios = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Edelnor (Fono Cliente)",@"517-1717", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Luz del Sur (Fonoluz)",@"617-5000", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Sedapal (Aquafono)",@"317-8000", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
     NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Calidda (Gas Natural)",@"614 9000", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Claro",@"0800-00-123", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Movistar",@"104", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
   
    
    [servicios addObject:aa];

 [servicios addObject:ab];
     [servicios addObject:ac];
    [servicios addObject:af];

     [servicios addObject:ad];
     [servicios addObject:ae];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [servicios count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    ServiciosCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[ServiciosCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[servicios objectAtIndex:indexPath.row];
    
    cell.firstLabel.text= [datosCentral objectForKey:@"nombre"];
    cell.numberLabel.text=[datosCentral objectForKey:@"telefono"];
    
    
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
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
