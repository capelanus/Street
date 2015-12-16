//
//  SerenazgoViewController.m
//  Street
//
//  Created by Daniel López on 04/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "SerenazgoViewController.h"
#import "SerenazgoCell.h"

@interface SerenazgoViewController ()

@end

@implementation SerenazgoViewController{
    
    NSMutableArray *serenazgos;
    
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
    
   
    serenazgos=[[NSMutableArray alloc]init];
    
    
        NSDictionary *uno =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ancón",@"524-5061", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *dos =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ate-vitarte",@"494-2222", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *tres =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Barranco",@"719-2055", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *cuatro =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Bellavista",@"420-2040", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *cinco =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Breña",@"423-2111", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *seis =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Callao (Cercado)",@"429-9520", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *siete =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Carmen de la Legua Reynoso",@"464-3747", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *ocho =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chaclacayo",@"358-2415", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *nueve =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chorrillos",@"251-7001", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
        NSDictionary *diez =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Jesús María",@"461-1070", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    
    NSDictionary *once =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Molina",@"313-3766", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *doce =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Perla",@"420-5604", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *trece =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Punta",@"453-4979", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *catorce =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Victoria",@"423-9134", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *quince =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lima (Cercado)",@"318-5055", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dieciseis =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lince",@"621-0900", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *diecisiete =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Los Olivos",@"613-8210", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dieciocho =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Magdalena del Mar",@"418-0710", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *diecinueve =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Miraflores",@"313-3773", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veinte =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pueblo Libre",@"319-3160", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    
    NSDictionary *veintiuno =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Punta Negra",@"686-3043", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veintidos =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Rímac",@"382-4753", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veintitres =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Borja",@"790-1000", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veinticuatro =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Isidro",@"264-5900", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veinticinco =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Luis",@"796-1615", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veintiseis =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Miguel",@"313-3003", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veintisiete =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Anita",@"363-0396", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veintiocho =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santiago de Surco",@"411-5555", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *veintinueve =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Surquillo",@"271-5259", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *treinta =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ventanilla",@"553-1093", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    
    NSDictionary *treintiuno =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa el Salvador",@"287-0808", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *treintidos =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa María del Triunfo",@"496-2000", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    [serenazgos addObject:uno];
    [serenazgos addObject:dos];
    [serenazgos addObject:tres];
    [serenazgos addObject:cuatro];
    [serenazgos addObject:cinco];
    [serenazgos addObject:seis];
    [serenazgos addObject:siete];
    [serenazgos addObject:ocho];
    [serenazgos addObject:nueve];
    [serenazgos addObject:diez];
    
    [serenazgos addObject:once];
    [serenazgos addObject:doce];
    [serenazgos addObject:trece];
    [serenazgos addObject:catorce];
    [serenazgos addObject:quince];
    [serenazgos addObject:dieciseis];
    [serenazgos addObject:diecisiete];
    [serenazgos addObject:dieciocho];
    [serenazgos addObject:diecinueve];
    [serenazgos addObject:veinte];
    
    [serenazgos addObject:veintiuno];
    [serenazgos addObject:veintidos];
    [serenazgos addObject:veintitres];
    [serenazgos addObject:veinticuatro];
    [serenazgos addObject:veinticinco];
    [serenazgos addObject:veintiseis];
    [serenazgos addObject:veintisiete];
    [serenazgos addObject:veintiocho];
    [serenazgos addObject:veintinueve];
    [serenazgos addObject:treinta];
    
    [serenazgos addObject:treintiuno];
    [serenazgos addObject:treintidos];
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [serenazgos count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    SerenazgoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[SerenazgoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[serenazgos objectAtIndex:indexPath.row];
    
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
