//
//  ComisariasViewController.m
//  Street
//
//  Created by Daniel López on 05/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ComisariasViewController.h"
#import "ComisariasCell.h"

@interface ComisariasViewController ()

@end

@implementation ComisariasViewController{
    
    NSMutableArray *comisarias;
    
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
    
    comisarias = [[NSMutableArray alloc]init];
    
    NSDictionary *aa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Aeropuerto",@"575-1382", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ab =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Alfonso Ugarte",@"332-0048", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ac =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ancón",@"552-0087", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ad =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Apolo",@"324-8362", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ae =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Barranca",@"235-2136", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *af =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Barranco",@"247-7536", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ag =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Bayóvar",@"392-5740", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ah =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Bellavista",@"469-1909", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ai =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Breña",@"332-4678", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *aj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Caja de agua",@"375-1308", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ak =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Calango",@"284-5010", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ba =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Callao",@"453-5667", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Canta",@"244-7010", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Canto Rey",@"387-0310", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Carabayllo (Santa isabel)",@"543-0686", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *be =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Carmen de la legua Reynoso",@"562-1044", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Casapalca",@"244-6101", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cerro Azul",@"284-6060", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cieneguilla",@"479-8626", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ciudad y Campo",@"481-0183", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Collique",@"558-2652", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *bk =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Conde de la Vega",@"424-6009", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ca =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Cotabambas",@"428-2106", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chacarilla del Estanque",@"372-6614", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chaclacayo",@"358-1151", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chancay",@"377-1222", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ce =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chilca",@"530-5196", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chorrillos",@"467-0184", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Chosica",@"360-3127", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ch =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Churín",@"237-3040", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ci =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"El Agustino",@"327-0017", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *cj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"El Progreso",@"547-2427", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ck =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Huachipa",@"371-1960", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *da =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Huacho",@"232-1192", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *db =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Huaral",@"246-1024", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Huaycán",@"371-5232", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Imperial Cañete",@"284-7897", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *de =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Independencia",@"521-6162", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *df =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Jesús María",@"431-9786", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"José Carlos Mariátegui",@"283-4045", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"José Gálvez",@"293-4557", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *di =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Laderas de Villa",@"292-6515", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Huayrona",@"387-7396", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *dk =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Legua",@"562-1062", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ea =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Molina",@"368-1871", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *eb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Pascana",@"541-4891", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ec =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Perla",@"453-7446", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ed =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Punta",@"429-0512", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ee =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"La Victoria",@"423-3407", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ef =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lince",@"265-0198", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *eg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lunahuaná",@"284-1044", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *eh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Lurín",@"430-2026", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ei =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Magdalena",@"263-1111", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ej =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Manchay",@"345-5663", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ek =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Maranga",@"451-1331", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *fa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mateo Pumacahua",@"258-2410", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Matucana",@"244-3004", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mercado Mayorista Nº1",@"323-7060", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Miraflores",@"446-2811", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fe =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mirones Alto",@"337-0029", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ff =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mirones Bajo",@"562-1040", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Mi Perú",@"553-9114", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Monserrate",@"424-1864", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Monterrico",@"435-0688", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Nueva Esperanza",@"291-1464", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *fk =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Orrantia del Mar",@"264-1932", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ga =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pachacámac (Dist.)",@"231-1850", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pachacámac (Urb.)",@"293-2043", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Palomino",@"564-1290", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pamplona 1",@"285-4012", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ge =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pamplona 2",@"285-6498", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Petit Thouars",@"332-4363", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Playa Rímac",@"572-1301", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pro",@"540-1190", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pucusana",@"430-9009", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Pueblo Libre",@"261-8744", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *gk =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Puente Piedra",@"548-4216", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ha =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Punta Hermosa",@"230-7066", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Punta Negra",@"231-5530", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ramón Castilla",@"453-4801", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ricardo Palma",@"361-8227", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *he =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Rímac",@"481-0046", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Salamanca",@"436-0348", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Antonio",@"445-0056", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Andrés",@"428-1962", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hi =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Borja",@"225-5184", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Cayetano",@"327-0107", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *hk =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Cosme",@"323-7037", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ia =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Genaro",@"254-7572", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ib =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Isidro",@"441-0728", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ic =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Juan de Miraflores",@"276-3079", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ida =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Luis",@"323-8885", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ie =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Martín de Porres",@"482-2650", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ifa =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Mateo",@"244-5117", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ig =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Miguel",@"566-1190", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ih =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"San Pedro",@"324-6009", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ii =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Anita",@"478-2232", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ij =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Clara",@"356-0084", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ik =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Elizabeth",@"388-6088", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    
    NSDictionary *ja =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Eulalia",@"361-0293", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Felicia",@"348-7213", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Luzmila",@"536-2547", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santa Rosa",@"552-1532", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *je =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Santoyo",@"327-5716", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Sarita Colonia",@"429-9945", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Surco",@"247-1512", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Surquillo",@"445-9083", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ji =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tablada de Lurín",@"295-2313", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tahuantinsuyo",@"526-5837", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *jk =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Túpac Amaru",@"536-7074", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
   
    NSDictionary *ka =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Unidad Vecinal Nº3",@"562-1114", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kb =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Universitaria",@"536-8422", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kc =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Ventanilla",@"553-4410", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kd =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa Chorrillos",@"254-5486", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ke =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa el Salvador",@"287-3804", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kf =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa Hermosa",@"362-4907", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kg =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Villa María del Triunfo",@"496-1935", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kh =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Vitarte",@"351-4200", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *ki =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Yerbateros",@"323-8819", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
    NSDictionary *kj =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Zárate",@"459-5378", nil] forKeys:[NSArray arrayWithObjects:@"nombre",@"telefono", nil]];
   

    [comisarias addObject:aa];
    [comisarias addObject:ab];
    [comisarias addObject:ac];
    [comisarias addObject:ad];
    [comisarias addObject:ae];
    [comisarias addObject:af];
    [comisarias addObject:ag];
    [comisarias addObject:ah];
    [comisarias addObject:ai];
    [comisarias addObject:aj];
    [comisarias addObject:ak];

    
    [comisarias addObject:ba];
    [comisarias addObject:bb];
    [comisarias addObject:bc];
    [comisarias addObject:bd];
    [comisarias addObject:be];
    [comisarias addObject:bf];
    [comisarias addObject:bg];
    [comisarias addObject:bh];
    [comisarias addObject:bi];
    [comisarias addObject:bj];
    [comisarias addObject:bk];
    
    [comisarias addObject:ca];
    [comisarias addObject:cb];
    [comisarias addObject:cc];
    [comisarias addObject:cd];
    [comisarias addObject:ce];
    [comisarias addObject:cf];
    [comisarias addObject:cg];
    [comisarias addObject:ch];
    [comisarias addObject:ci];
    [comisarias addObject:cj];
    [comisarias addObject:ck];
    
    [comisarias addObject:da];
    [comisarias addObject:db];
    [comisarias addObject:dc];
    [comisarias addObject:dd];
    [comisarias addObject:de];
    [comisarias addObject:df];
    [comisarias addObject:dg];
    [comisarias addObject:dh];
    [comisarias addObject:di];
    [comisarias addObject:dj];
    [comisarias addObject:dk];
    
    [comisarias addObject:ea];
    [comisarias addObject:eb];
    [comisarias addObject:ec];
    [comisarias addObject:ed];
    [comisarias addObject:ee];
    [comisarias addObject:ef];
    [comisarias addObject:eg];
    [comisarias addObject:eh];
    [comisarias addObject:ei];
    [comisarias addObject:ej];
    [comisarias addObject:ek];
    
    [comisarias addObject:fa];
    [comisarias addObject:fb];
    [comisarias addObject:fc];
    [comisarias addObject:fd];
    [comisarias addObject:fe];
    [comisarias addObject:ff];
    [comisarias addObject:fg];
    [comisarias addObject:fh];
    [comisarias addObject:fi];
    [comisarias addObject:fj];
    [comisarias addObject:fk];
    
    [comisarias addObject:ga];
    [comisarias addObject:gb];
    [comisarias addObject:gc];
    [comisarias addObject:gd];
    [comisarias addObject:ge];
    [comisarias addObject:gf];
    [comisarias addObject:gg];
    [comisarias addObject:gh];
    [comisarias addObject:gi];
    [comisarias addObject:gj];
    [comisarias addObject:gk];
    
    [comisarias addObject:ha];
    [comisarias addObject:hb];
    [comisarias addObject:hc];
    [comisarias addObject:hd];
    [comisarias addObject:he];
    [comisarias addObject:hf];
    [comisarias addObject:hg];
    [comisarias addObject:hh];
    [comisarias addObject:hi];
    [comisarias addObject:hj];
    [comisarias addObject:hk];
    
    [comisarias addObject:ia];
    [comisarias addObject:ib];
    [comisarias addObject:ic];
    [comisarias addObject:ida];
    [comisarias addObject:ie];
    [comisarias addObject:ifa];
    [comisarias addObject:ig];
    [comisarias addObject:ih];
    [comisarias addObject:ii];
    [comisarias addObject:ij];
    [comisarias addObject:ik];
    
    [comisarias addObject:ja];
    [comisarias addObject:jb];
    [comisarias addObject:jc];
    [comisarias addObject:jd];
    [comisarias addObject:je];
    [comisarias addObject:jf];
    [comisarias addObject:jg];
    [comisarias addObject:jh];
    [comisarias addObject:ji];
    [comisarias addObject:jj];
    [comisarias addObject:jk];
    
    [comisarias addObject:ka];
    [comisarias addObject:kb];
    [comisarias addObject:kc];
    [comisarias addObject:kd];
    [comisarias addObject:ke];
    [comisarias addObject:kf];
    [comisarias addObject:kg];
    [comisarias addObject:kh];
    [comisarias addObject:ki];
    [comisarias addObject:kj];

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [comisarias count];
    
}

- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    ComisariasCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[ComisariasCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *datosCentral =[comisarias objectAtIndex:indexPath.row];
    
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
