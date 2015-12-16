//
//  ClinicasViewController.m
//  Street
//
//  Created by Daniel López on 06/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ClinicasViewController.h"
#import "ClinicasCell.h"

@interface ClinicasViewController ()

@end

@implementation ClinicasViewController{

    NSMutableArray *clinicas;

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
    
    clinicas = [[NSMutableArray alloc]init];
    
    
    
     NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Anglo Americana",@"616-8900",@"Alfredo Salazar 350, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
     NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Internacional",@"433-4306",@"Jr. Washington 1475, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
     NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Clínica Internacional",@"618-3900",@"Av. Guardia Civil 385", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"El Golf",@"264-3300",@"Av. Aurelio Miró Quesada 1030", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
                                                           
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Good Hope",@"610-7300",@"Bajada Balta 956, Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
                                                           
     NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Javier Prado",@"440-2000",@"Av. Javier Prado Este 499, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Limatambo",@"441-8681",@"Av. República de Panamá 3606, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Los Andes",@"221-0468",@"Calle Asunción 177, Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *az =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Maison de Santé",@"619-6000",@"[Lima][Chorrillos][Surco][San Isidro]", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Montefiori",@"437-5151",@"Av. Separadora Industrial 380, La Molina", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *ba =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Montesur",@"317-4000",@"Av. El Polo 570 Monterrico, Surco", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
        NSDictionary *bd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ricardo Palma",@"224-2224",@"Av. Javier Prado Este 1066, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Gabriel",@"614-2222",@"Av. La Marina 2955, San Miguel", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    
    NSDictionary *bb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Isabel",@"475-7777",@"Av. Guardia Civil 135, San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Felipe",@"219-0000",@"Av, Gregorio Escobedo 650, Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];

    NSDictionary *be =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San José",@"452-9747",@"Las Gaviotas 207", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Borja",@"475-4000",@"Av. Guardia Civil 333, San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Stella Maris",@"463-6666",@"Paso de los Andes 825, Pueblo Libre", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Judas Tadeo",@"219-1100",@"Calle Manuel Raygada 170, San Miguel ", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Teresa",@"441-1745",@"Los Halcones 410 Urb. Limatambo", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ca =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Pablo (Norte)",@"613-4444",@"Av. C. Eyzaguirre 153, Independencia", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Pablo (Sur)",@"450-0827",@"Belisario Suárez 998 Zona C, S.J.de Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tezza",@"610-5050",@"Av. El Polo 570, Monterrico", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *cd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Vesalio",@"618-9999",@"Calle Uno 140, San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
     NSDictionary *da =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cayetano Heredia",@"207-6200",@"Av. Honorio Delgado 370, San M. de Porres", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    
    [clinicas addObject:aa];
    [clinicas addObject:da];

    [clinicas addObject:ab];
    

    [clinicas addObject:ac];
    [clinicas addObject:ad];
    [clinicas addObject:ae];
    [clinicas addObject:af];
    [clinicas addObject:ag];
    [clinicas addObject:ah];
    [clinicas addObject:az];

    [clinicas addObject:ai];
    [clinicas addObject:aj];
    
    [clinicas addObject:ba];
    [clinicas addObject:bb];
    [clinicas addObject:bc];
    [clinicas addObject:bd];
    [clinicas addObject:be];
    [clinicas addObject:bf];
    [clinicas addObject:bg];
    [clinicas addObject:bh];
    [clinicas addObject:bi];
    
    [clinicas addObject:ca];
    [clinicas addObject:cb];
    [clinicas addObject:cc];
    [clinicas addObject:cd];




}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [clinicas count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    ClinicasCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[ClinicasCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[clinicas objectAtIndex:indexPath.row];
    
    cell.firstLabel.text= [datosCentral objectForKey:@"nombre"];
    cell.secondLabel.text=[datosCentral objectForKey:@"direccion"];
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
