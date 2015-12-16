//
//  ComunidadViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ComunidadViewController.h"
#import "ComunidadCell.h"
@interface ComunidadViewController ()

@end

@implementation ComunidadViewController{

    NSMutableArray *comunidades;

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
    
    comunidades = [[NSMutableArray alloc]init];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Alcohólicos Anónimos",@"265-1847", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Asociación de Diabéticos Juveniles",@"222-4747", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Asoc. de Espina Bífida e Hidrocefalia",@"381-3527", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Asociación de Olimpiadas Especiales",@"242-8175", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Asoc. Peruana de enfermos de Alzheimer",@"442-0366", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ayuda en Acción",@"422-6292", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ayuda para Familiares de Alcohólicos",@"422-1665", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"CEDRO (Lugar de Escucha) ",@"446-6682", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Centro Antirrábico",@"425-6313", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Centro Caminando a la Vida",@"225-3556", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ba =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cmud. Terapeútica Fuente de Agua Viva ",@"278-1250", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cmud. Terapéutica Prof. Casa Nueva Vida",@"224-0662", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cmud. Terapéutica Proyecto Mujer",@"273-6981", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Centro de Salud Raúl Patrucco Puig",@"328-9053", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *be =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Centro de Vacunación y Certificación Intl.",@"264-6889", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Centro Victoria ",@"225-1215", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cmud. Terapéutica Profesional Maxwell J.",@"475-8010", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Consejería en Planificación Familiar ",@"422-7599", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Infosalud",@"0-800-108-28", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Inst. Peruano de Paternidad Responsable",@"261-2595     (INPPARES)", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ca =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Voz Amiga ",@"436-1212", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Libertad (Lucha Contra Las Drogas)",@"273-0383", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Movimiento Homosexual de Lima",@"332-2945", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Soporte para Personas con VIH/SIDA ",@"266-0746", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    [comunidades addObject:aa];
    [comunidades addObject:ab];
    [comunidades addObject:ac];
    [comunidades addObject:ad];
    [comunidades addObject:ae];
    [comunidades addObject:af];
    [comunidades addObject:ag];
    [comunidades addObject:ah];
    [comunidades addObject:ai];
    [comunidades addObject:aj];
    
    [comunidades addObject:ba];
    [comunidades addObject:bb];
    [comunidades addObject:bc];
    [comunidades addObject:bd];
    [comunidades addObject:be];
    [comunidades addObject:bf];
    [comunidades addObject:bg];
    [comunidades addObject:bh];
    [comunidades addObject:bi];
    [comunidades addObject:bj];
    
    [comunidades addObject:ca];
    [comunidades addObject:cb];
    [comunidades addObject:cc];
    [comunidades addObject:cd];


   

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [comunidades count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    ComunidadCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[ComunidadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[comunidades objectAtIndex:indexPath.row];
    
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
