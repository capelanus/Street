//
//  HospitalesViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "HospitalesViewController.h"
#import "HospitalesCell.h"

@interface HospitalesViewController ()

@end

@implementation HospitalesViewController{

    NSMutableArray *hospitales;

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
    
    hospitales = [[NSMutableArray alloc]init];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Alberto Sabogal",@"429-0728",@"Jr. Colina 1081, Bellavista, Callao", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Arzobispo Loayza",@"431-3799",@"Av. Alfonso Ugarte 848, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cayetano Heredia",@"482-0402",@"Av. Honorio Delgado 262, S.M de Porres", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Central FAP",@"513-5300",@"Av. Aramburú Cdra. 2, Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Daniel Alcides Carrión",@"429-6068",@"Av. Guardia Chalaca 2176, Callao", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"De Apoyo San José",@"319-7830",@"Jr. Las Magnolias 475, Carmen de la Legua", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"De Emergencias Pediátricas",@"474-9790",@"Av. Grau 800, La Victoria", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"De Huaycán",@"371-6049",@"Av. José Carlos Mariátegui, Ate Vitarte", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"De Puente Piedra",@"548-1799",@"Av. Sáenz Peña Cdra. 6", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"De Vitarte",@"351-4484",@"Carretera Central, km.7", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *ba =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Dos de Mayo",@"328-1340",@"Av. Grau Cdra.13, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Edgardo Rebagliati",@"265-4901",@"Av. Rebagliati 490, Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
     NSDictionary *zz =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"EsSalud (Aló EsSalud)",@"411-8000",@"", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *bc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Guillermo Almenara Irigoyen",@"324-2983",@"Av. Grau 800, La Victoria", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Hermilio Valdizán",@"494-2516",@"Carretera Central km 3.5, Santa Anita", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *be =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Hipólito Unanue",@"362-7777",@"Av. César Vallejo 1390, El Agustino", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Hospital S.J. de Lurigancho",@"387-2300",@"Av. Canto Grande,Urb. Huáscar", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Inst. Esp. Materno Perinatal",@"328-0988",@"Jr. Miró Quesada 941, Lima ", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Inst. Esp. de Salud del Niño",@"330-0066",@"Av. Brasil 600, Breña", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Inst. Nac. de CC. Neurológicas",@"411-7700",@"Jr. Ancash 1271, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *bj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Inst. Nac. de Neoplásicas",@"201-6500",@"Av. Angamos Este 2520, Surquillo", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    

    NSDictionary *cb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Inst. Nac. de Oftalmología",@"202-9060",@"Av. Tingo María 398, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"José Casimiro Ulloa",@"445-5096",@"Av. Roosevelt Nº 6355, Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
        NSDictionary *ca =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Madre Niño San Bartolomé",@"330-3521",@"Av. Alfonso Ugarte 825, Lima", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"María Auxiliadora",@"217-1818",@"Av. Miguel Iglesias 968, S.J. de Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ce =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Materno Infantil César L. Silva",@"293-0274",@"Mz. B-1, Sector 4,1° Etapa,Urb, Pachacámac", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Materno Infantil Juan Pablo II",@"287-4252",@"Av. César Vallejo, sec 6, Gr 6A, Lote 1, Villa el Salvador", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Materno Infantil V.M. del Triunfo",@"450-4124",@"Av. Pedro Valle, Cdra.18", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ch =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Materno Infantil de Lurín",@"430-1000",@"Cl. Grau 370, Lurín", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *ci =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Militar Central",@"219-3500",@"Av. Sánchez Carrión, alt. cdra. 27 Av. Brasil", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *cj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Naval (Centro Médico Naval)",@"613-7800",@"Av. Venezuela, cdra. 29, Bellavista, Callao", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    NSDictionary *da =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Policía (Luis N. Sáenz PNP)",@"261-8455",@"Av. Brasil Cdra. 26, Jesús María", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *db =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Rosalía Lavalle de Morales",@"440-2800",@"Cl. Gervasio Santillana 260, Miraflores", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *dc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San José del Callao",@"319-7830",@"Jr. Las Magnolias 475, Carmen de la Legua", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *dd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Juan de Matucana",@"244-3008",@"Av. La Florida 144, Matucana", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *de =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Sergio Bernales",@"558-0187",@"Av. Túpac Amaru Km.14.5, Comas", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *df =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Hogar Clínica S.J. de Dios",@"326-0945",@"Av. Nicolás Arriola 3250, San Luis", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *dg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Rosa",@"615-8200",@"Av. Bolívar Cdra. 8, Pueblo Libre", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    NSDictionary *dh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Víctor Larco Herrera",@"261-5516",@"Av. del Ejército 600, Magdalena", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono",@"direccion", nil]];
    
    [hospitales addObject:aa];
    [hospitales addObject:ab];
    [hospitales addObject:ac];
    [hospitales addObject:ad];
    [hospitales addObject:ae];
    [hospitales addObject:af];
    [hospitales addObject:ag];
    [hospitales addObject:ah];
    [hospitales addObject:ai];
    [hospitales addObject:aj];
    
    [hospitales addObject:ba];
    [hospitales addObject:bb];
    [hospitales addObject:bc];
    [hospitales addObject:bd];
    [hospitales addObject:be];
    [hospitales addObject:bf];
    [hospitales addObject:bg];
    [hospitales addObject:bh];
    [hospitales addObject:bi];
    [hospitales addObject:bj];
    
    [hospitales addObject:ca];
    [hospitales addObject:cb];
    [hospitales addObject:cc];
    [hospitales addObject:cd];
    [hospitales addObject:ce];
    [hospitales addObject:cf];
    [hospitales addObject:cg];
    [hospitales addObject:ch];
    [hospitales addObject:ci];
    [hospitales addObject:cj];
    
    [hospitales addObject:da];
    [hospitales addObject:db];
    [hospitales addObject:dc];
    [hospitales addObject:dd];
    [hospitales addObject:de];
    [hospitales addObject:df];
    [hospitales addObject:dg];
    [hospitales addObject:dh];
    
    [hospitales addObject:zz];




    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [hospitales count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    HospitalesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[HospitalesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[hospitales objectAtIndex:indexPath.row];
    
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
