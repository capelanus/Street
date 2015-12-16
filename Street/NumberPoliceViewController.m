//
//  NumberPoliceViewController.m
//  Street
//
//  Created by Daniel López on 04/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "NumberPoliceViewController.h"
#import "PoliceNumberCell.h"

@interface NumberPoliceViewController ()

@end

@implementation NumberPoliceViewController{

    NSMutableArray *centrales;

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
    centrales=[[NSMutableArray alloc]init];
    
    NSDictionary *dirandro =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRANDRO",@"Dirección antidrogas",@"221-2421", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dirove =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIROVE",@"Dirección de robo de vehículos",@"328-0351", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dircote =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRCOTE",@"Dirección contra el terrorismo",@"431-5865", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dircocor =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRCOCOR",@"Dirección contra la corrupción",@"330-5258", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dircri =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRCRI",@"Dirección de criminalística",@"441-1193", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dirincri =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRINCRI",@"Dirección de investigación criminal",@"433-4461", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dirprcar =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRPRCAR",@"Dirección de protección de carreteras",@"276-0361", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dirture =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRTURE",@"Dirección de policía de turismo y ecología",@"460-1060", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *diprove =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIPROVE",@"Dirección de prevención de robo de vehículos",@"328-0353", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *dirpoltran =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIRPOLTRAN",@"Dirección de policía de tránsito",@"324-8381", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *diroes =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"DIROES",@"Dirección de operaciones especiales",@"351-3625", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    NSDictionary *suat =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"SUAT",@"División de emergencias",@"431-3040", nil] forKeys:[NSArray arrayWithObjects:@"siglas",@"nombre",@"telefono", nil]];
    
    [centrales addObject:dirandro];
    [centrales addObject:dirove];
    [centrales addObject:dircote];
    [centrales addObject:dircocor];
    [centrales addObject:dircri];
    [centrales addObject:dirincri];
    [centrales addObject:dirprcar];
    [centrales addObject:dirture];
    [centrales addObject:diprove];
    [centrales addObject:dirpoltran];
    [centrales addObject:diroes];
    [centrales addObject:suat];


    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [centrales count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    PoliceNumberCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[PoliceNumberCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[centrales objectAtIndex:indexPath.row];
    
    cell.firstLabel.text= [datosCentral objectForKey:@"siglas"];
    cell.secondLabel.text=[datosCentral objectForKey:@"nombre"];
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
