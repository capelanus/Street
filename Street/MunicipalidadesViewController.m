//
//  MunicipalidadesViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "MunicipalidadesViewController.h"
#import "MunicipalidadCell.h"

@interface MunicipalidadesViewController ()

@end

@implementation MunicipalidadesViewController{

    NSMutableArray *municipalidades;

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
    
    municipalidades=[[NSMutableArray alloc]init];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ancón",@"552-2046", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ate-Vitarte",@"494-1424", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Barranco",@"719-2040", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Bellavista",@"429-3085", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Breña",@"424-1789", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Callao",@"429-6477", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Carabayllo",@"543-4214", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Carmen de la Legua Reynoso",@"452-3897", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Comas",@"542-7607", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chaclacayo",@"497-1033", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ba =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chorrillos",@"251-6129", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cieneguilla",@"479-8212", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"El Agustino",@"327-0036", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Independencia",@"715-3357", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *be =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Jesús María",@"614-1212", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Molina",@"313-4444", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Perla",@"420-6159", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Punta",@"429-0501", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Victoria",@"330-3737", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lima (cercado)",@"315-1300", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ca =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lince",@"619-1818", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Los Olivos",@"485-7347", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lurín",@"430-0538", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Magdalena del Mar",@"460-6020", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ce =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Miraflores",@"617-7272", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pachacámac",@"231-1644", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pucusana",@"430-9353", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ch =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pueblo Libre",@"261-8080", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ci =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Puente Piedra",@"219-6200", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Punta Hermosa",@"230-7696", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *da =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Punta Negra",@"231-5278", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *db =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Rímac",@"482-0020", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Bartolo",@"430-7038", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Borja",@"612-5555", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *de =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Isidro",@"513-9000", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *df =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Juan de Lurigancho",@"458-5051", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Juan de Miraflores",@"276-6716", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Luis",@"436-0210", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *di =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Martín de Porres",@"790-0100", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Miguel",@"460-7480", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ea =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Pedro de Mala",@"530-8214", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *eb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Anita",@"362-9439", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ec =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Eulalia",@"361-2858", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ed =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa María del Mar",@"430-7905", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ee =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa María de Huachipa",@"371-0615", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ef =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Rosa",@"552-1868", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *eg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santiago de Surco",@"411-5560", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *eh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Surquillo",@"241-0413", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ei =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ventanilla",@"553-1398", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ej =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa el Salvador",@"319-2530", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *fa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa María del Triunfo",@"450-5448", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lurigancho-Chosica",@"360-3078", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];

    [municipalidades addObject:aa];
    [municipalidades addObject:ab];
    [municipalidades addObject:ac];
    [municipalidades addObject:ad];
    [municipalidades addObject:ae];
    [municipalidades addObject:af];
    [municipalidades addObject:ag];
    [municipalidades addObject:ah];
    [municipalidades addObject:ai];
    [municipalidades addObject:aj];
    
    [municipalidades addObject:ba];
    [municipalidades addObject:bb];
    [municipalidades addObject:bc];
    [municipalidades addObject:bd];
    [municipalidades addObject:be];
    [municipalidades addObject:bf];
    [municipalidades addObject:bg];
    [municipalidades addObject:bh];
    [municipalidades addObject:bi];
    [municipalidades addObject:bj];
    
    [municipalidades addObject:ca];
    [municipalidades addObject:cb];
    [municipalidades addObject:cc];
    [municipalidades addObject:cd];
    [municipalidades addObject:ce];
    [municipalidades addObject:cf];
    [municipalidades addObject:cg];
    [municipalidades addObject:ch];
    [municipalidades addObject:ci];
    [municipalidades addObject:cj];
    
    [municipalidades addObject:da];
    [municipalidades addObject:db];
    [municipalidades addObject:dc];
    [municipalidades addObject:dd];
    [municipalidades addObject:de];
    [municipalidades addObject:df];
    [municipalidades addObject:dg];
    [municipalidades addObject:dh];
    [municipalidades addObject:di];
    [municipalidades addObject:dj];
    
    [municipalidades addObject:ea];
    [municipalidades addObject:eb];
    [municipalidades addObject:ec];
    [municipalidades addObject:ed];
    [municipalidades addObject:ee];
    [municipalidades addObject:ef];
    [municipalidades addObject:eg];
    [municipalidades addObject:eh];
    [municipalidades addObject:ei];
    [municipalidades addObject:ej];
    
    [municipalidades addObject:fa];
    [municipalidades addObject:fb];
   

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [municipalidades count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    MunicipalidadCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[MunicipalidadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[municipalidades objectAtIndex:indexPath.row];
    
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
