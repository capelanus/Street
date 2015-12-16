//
//  AmbulanciaViewController.m
//  Street
//
//  Created by Daniel López on 06/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "AmbulanciaViewController.h"
#import "AmbulanciaCell.h"

@interface AmbulanciaViewController ()

@end

@implementation AmbulanciaViewController{

    NSMutableArray *ambulancias;
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
    [super viewDidLoad];
    
    ambulancias=[[NSMutableArray alloc]init];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Alerta Médica",@"225-4040/416-6767",@"La Victoria", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Alfa Medic",@"362-9519",@"Bellavista, Callao", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Clave 5",@"467-5171/467-4861",@"Breña", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Clave Médica",@"313-4333/313-4334",@"San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Contra Infartos",@"446-4620/610-6666",@"Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cruz Roja",@"268-8109",@"Santiago de Surco", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Delta Heart",@"333-2121/222-0228",@"Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mision Médica",@"435-7777",@"San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Paolsa",@"424-0046",@"Breña", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Plan Vital",@"241-1911/242-6869",@"San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    
    NSDictionary *ak =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Red Médica",@"435-1333/436-2626",@"Ate", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *al =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Servimedic",@"719-9966/332-6720",@"Lince", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *am =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"STAE EsSalud",@"265-6000",@"Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    NSDictionary *an =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TransMedic",@"224-5477/224-5467",@"San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"distrito", nil]];
    
        [ambulancias addObject:aa];
        [ambulancias addObject:ab];
        [ambulancias addObject:ac];
        [ambulancias addObject:ad];
        [ambulancias addObject:ae];
        [ambulancias addObject:af];
        [ambulancias addObject:ag];
        [ambulancias addObject:ah];
        [ambulancias addObject:ai];
        [ambulancias addObject:aj];
        [ambulancias addObject:ak];
        [ambulancias addObject:al];
        [ambulancias addObject:am];
        [ambulancias addObject:an];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [ambulancias count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    AmbulanciaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[AmbulanciaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[ambulancias objectAtIndex:indexPath.row];
    
    cell.firstLabel.text= [datosCentral objectForKey:@"nombre"];
    cell.numberLabel.text=[datosCentral objectForKey:@"telefono"];
    cell.secondLabel.text=[datosCentral objectForKey:@"distrito"];

    
    
    
    
    
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
