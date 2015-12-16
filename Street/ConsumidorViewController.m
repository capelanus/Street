//
//  ConsumidorViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ConsumidorViewController.h"
#import "ConsumidorCell.h"

@interface ConsumidorViewController ()

@end

@implementation ConsumidorViewController{

   NSMutableArray *consumidores;

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
    
    consumidores=[[NSMutableArray alloc]init];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Asociación de Consumidores y Usuarios",@"222-5000",@"ASPEC", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
     NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Defensa de la Competencia y la Propiedad Intelectual",@"224-7800",@"INDECOPI", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ac=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Sistema de Apoyo al Consumidor",@"0-800-440-40",@"", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Org. Supervisor de la inversión Privada en Telecomunicaciones",@"225-1313",@"OSIPTEL", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Org. Supervisor de la Inversión en Infraestructura de Transporte de Uso Público",@"440-5115",@"OSITRAN", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Asoc. de Autores y Compositores ",@"243-6732",@"APDAYC", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Defensoría del pueblo",@"426-7800",@"", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Promperú",@"222-1222",@"", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Superintendencia Nac. de Adm. Tributaria",@"315-0730",@"SUNAT", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Superintendencia Nac. de Reg. Públicos",@"0800-27164",@"SUNARP", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    NSDictionary *ak =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Reg. Nac. de Identificación y Estado Civil",@"0800-11040",@"RENIEC", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"siglas", nil]];
    
    [consumidores addObject:aa];
    [consumidores addObject:ab];
    [consumidores addObject:ac];
    [consumidores addObject:ad];
    [consumidores addObject:ae];
    [consumidores addObject:af];
    [consumidores addObject:ag];
    [consumidores addObject:ah];
    [consumidores addObject:ai];
    [consumidores addObject:aj];
    [consumidores addObject:ak];


    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [consumidores count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    ConsumidorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[ConsumidorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[consumidores objectAtIndex:indexPath.row];
    
    cell.firstLabel.text= [datosCentral objectForKey:@"nombre"];
    cell.secondLabel.text=[datosCentral objectForKey:@"siglas"];
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
