//
//  OrganismosViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "OrganismosViewController.h"
#import "OrganismosCell.h"

@interface OrganismosViewController ()

@end

@implementation OrganismosViewController{

    NSMutableArray *organismos;

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
    
    organismos=[[NSMutableArray alloc]init];
    
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Consejo de Ministros",@"219-7000",@"Jirón Carabaya, s/n, Lima 15001", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Congreso de la República",@"311-7777",@"Plaza Bolívar, Av. Abancay s/n", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Agricultura",@"711-3700",@"Pj. Zela 150, Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Min. de Comercio Ext. y Tur.",@"513-6100",@"Cl. Uno Oeste 50-60, Urb. Córpac, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Defensa",@"619-0600",@"Av. Arequipa 291, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Economía",@"311-5930",@"Jr. Junín 319, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Educación",@"615-5800",@"Cl. Van de Velde 160, San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Energía y Minas",@"618-8700",@"Av. Las Artes Sur 260, San Borja", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Justicia",@"440-4310",@"Cl. Scipión Llona 350, Miraflores" ,nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de la Mujer",@"626-1600",@"Jr. Camaná 616, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];

    
    NSDictionary *ba =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de la Producción",@"616-2222",@"Cl. Uno Oeste 60, Urb. Córpac, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de RR. Exteriores",@"204-2400",@"Jr. Ucayali 318, Lima" ,nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Salud",@"315-6600",@"Av. Salaverry 801, Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Trabajo",@"315-7100",@"Av. Salaverry 655, Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *be =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Transportes y C.",@"315-7800",@"Jr. Zorritos 1203, Lima" ,nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio de Vivienda",@"211-7930",@"Av. Paseo de República 3361, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio del Interior",@"518-0000",@"Plaza 30 de Agosto, San Isidro", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ministerio Público - Fiscalía",@"625-5555",@"Av. Abancay cdra. 5 s/n, Lima" ,nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    [organismos addObject:aa];
    [organismos addObject:ab];
    [organismos addObject:ac];
    [organismos addObject:ad];
    [organismos addObject:ae];
    [organismos addObject:af];
    [organismos addObject:ag];
    [organismos addObject:ah];
    [organismos addObject:ai];
    [organismos addObject:aj];
    
    [organismos addObject:ba];
    [organismos addObject:bb];
    [organismos addObject:bc];
    [organismos addObject:bd];
    [organismos addObject:be];
    [organismos addObject:bf];
    [organismos addObject:bg];
    [organismos addObject:bh];



    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [organismos count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    OrganismosCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[OrganismosCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[organismos objectAtIndex:indexPath.row];
    
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
