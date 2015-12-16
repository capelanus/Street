//
//  DataViewController.m
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "AppDelegate.h"
#import "DataViewController.h"
#import "Taxista.h"
#import "Store.h"
#import "usuario.h"

#import <sqlite3.h>

#import <QuartzCore/QuartzCore.h>

@interface DataViewController ()


@end

@implementation DataViewController{


    NSString *placavolatil;
    
    NSMutableArray *arrayuser;

    

}
@synthesize fotoImage,nombreTaxistaLabel,apellidoTaxistaLabel,dniLabel,nacionLabel,placaLabel;

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
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    PFQuery *buscar = [PFQuery queryWithClassName:@"conductores"];
    [buscar whereKey:@"placa" equalTo:placa];
    [buscar findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        int i = 0;
        
        PFUser *dato= [objects objectAtIndex:i];
        NSString *nombre = [dato valueForKey:@"nombre"];
        NSString *apellido = [dato valueForKey:@"apellido"];
        NSString *dni = [dato valueForKey:@"dni"];
        NSString *nacionalidad = [dato valueForKey:@"nacionalidad"];
        NSString *placa = [dato valueForKey:@"placa"];
        
        PFFile *imageFile = [dato objectForKey:@"fotoperfil"];
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                
         
                
                fotoImage.layer.masksToBounds=YES;
                fotoImage.layer.cornerRadius=60;
                
                UIImage *image = [UIImage imageWithData:data];
            
                fotoImage.image=image;
            }
        }];
        

        nombreTaxistaLabel.text=nombre;
        apellidoTaxistaLabel.text=apellido;
        dniLabel.text=dni;
        nacionLabel.text=nacionalidad;
        placaLabel.text=placa;

        
        
            }];
    

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nuevaBusquedaButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)loadUsersFromDB{
    
   
    appDelegate= (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
    sqlite3 *database;
    
    
    sqlite3_stmt *compiledStatement;
    
    
    
    // Abrimos la base de datos de la ruta indicada en el delegate
    if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
        
        
        // Podríamos seleccionar solo algunos, o todos en el orden deseado así:
        // NSString *sqlStatement = [NSString stringWithFormat:@"seletc peso, largos, minutos from Gimnasio"];
        
        NSString *miusername = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"nombre"];
        
        NSString *sqlStatement = [NSString stringWithFormat:@"select * from misusuarios"];
        
        
        
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            
            // Recorremos los resultados.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Leemos las columnas necesarias. Aunque algunos valores son numéricos, prefiero recuperarlos en string y convertirlos luego, porque da menos problemas.
                NSString *nombre1 = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *nombre2 = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
                usuario *user = [[usuario alloc]init];
                
                user.usuario1 = nombre1;
                user.usuario2 = nombre2;
                
                if ([nombre1 isEqualToString:miusername]) {
                    
                    [arrayuser addObject:user];
                    
                }
            }
            
            
            
        } else {
            NSLog(@"error1");
        }
        
        // Libero la consulta
        sqlite3_finalize(compiledStatement);
        
    }
    // Cierro la base de datos
    sqlite3_close(database);
    
    NSLog(@"esto es lo que hay en el array = %@",arrayuser);
    
    
}


- (IBAction)saveDataButton:(id)sender {
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uno = [UserDefaults objectForKey:@"placa"];
    
    if ([placavolatil isEqualToString:uno]) {
        nil;
        
        UIAlertView *placaigual = [[UIAlertView alloc]  initWithTitle:@"Guardado" message:@"Ya se han almacenado estos datos correctamente." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [placaigual show];    }
    
    else{
    
        placavolatil = uno;
        
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSString *dateString = [dateFormat stringFromDate:today];
        // NSLog(@"date: %@", dateString);
        
        NSDate *currentTime = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSString *resultString = [dateFormatter stringFromDate: currentTime];


        arrayuser = [[NSMutableArray alloc]init];
        
        [self loadUsersFromDB];
        
        NSString *placa = [UserDefaults objectForKey:@"nombre"];
        NSString *direccion = [UserDefaults objectForKey:@"direccion"];
        NSString *lon = [UserDefaults objectForKey:@"long"];
        NSString *lat = [UserDefaults objectForKey:@"lat"];

    
        PFObject *viajes = [PFObject objectWithClassName:@"viajes"];
        viajes[@"Hora"] = resultString;
        viajes[@"Fecha"] = dateString;
        viajes[@"usuario"] = placa;
        viajes[@"placa"] = uno;
        viajes[@"direccion"] = direccion;
        viajes[@"longitud"] = lon;
        viajes[@"latitud"] = lat;
        
        [viajes saveInBackground];
        
        
        if ([arrayuser count]==0) {
            
            NSLog(@"%@",arrayuser);
            NSLog(@"no hay unusarios en el array");
            
            
        }else{
            
            for (int i=0; i<[arrayuser count]; i++) {
                
                NSLog(@"ha entrado en el bucle for");
                
                usuario *auxusuario=  [arrayuser objectAtIndex:i];
                
                NSString *otroid= auxusuario.usuario2;
                
                ///////////FALTA INSERTAR LA DIRECCION///////////////
                
                //  GUARDAR EN UPDATEREG
                
                
                PFObject *registro = [PFObject objectWithClassName:@"updatereg"];
                registro[@"Hora"] = resultString;
                registro[@"Fecha"] = dateString;
                registro[@"miusuario"] = placa;
                registro[@"otrousuario"] = otroid;
                registro[@"placa"] = uno;
                registro[@"direccion"] = direccion;
                [registro saveInBackground];
                
                
            }
            
        }

        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Guardado" message:@"Los datos del conductor y/o vehículo han sido almacenados correctamente. Buen Viaje!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    
    
    
    }
    

    
    
}
@end
