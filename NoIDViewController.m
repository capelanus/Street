//
//  NoIDViewController.m
//  Street
//
//  Created by iDaniel on 14/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "NoIDViewController.h"
#import "AppDelegate.h"
#import "usuario.h"
#import <sqlite3.h>
#import <Social/Social.h>


@interface NoIDViewController ()

@end

@implementation NoIDViewController{
    
    NSString *placavolatil;
    NSString *tres;
    NSMutableArray *arrayuser;
    NSMutableArray *arrayuser2;
    NSNumber *neg ;
    NSNumber *pos ;
    
    
}

@synthesize text1Label,numeroFotosLabel,placaLabel,positiveLabel,negativeLabel;

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
    
    placaLabel.text=placa;
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    [query whereKey:@"photouser" equalTo:placa];
    [query whereKey:@"aprobed" equalTo:@"yes"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        
        if(!error){
            
            imageFilesArray= [[NSArray alloc]initWithArray:objects];
            //NSLog(@"numero de fotos de esta placa  %lu",(unsigned long)[imageFilesArray count]) ;
            
            NSString *strFromInt = [NSString stringWithFormat:@"%lu",(unsigned long)[imageFilesArray count]];
            
            numeroFotosLabel.text = strFromInt;
            
        }
        
        
        
    }];
    
    
    PFQuery *query2 = [PFQuery queryWithClassName:@"Peligrosos"];
    [query2 whereKey:@"placa" equalTo:placa];
    [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
           
            NSLog(@"%lu",(unsigned long)[objects count]);
            if ([objects count]!=0) {
                
                UIAlertView *alertaX= [[UIAlertView alloc]initWithTitle:@"Peligro" message:@"Este vehículo ha sido reportado como pelligroso por un usuario. Rogamos extreme precauciones" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                
                [alertaX show];
                }
            else{
                nil;
            
            }
            
            
            
        } else {

            NSLog(@"Error");
        }
    }];
    
    
    
    
    [self updateValorationValues];

   
    
    
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

-(void)updateValuesPos{

    
    
    int valuepos = [pos intValue];
    NSNumber *numberpos = [NSNumber numberWithInt:valuepos + 1];
    
    NSString *myString2 = [numberpos stringValue];
    
    positiveLabel.text= myString2;



}

-(void)updateValuesNeg{
    
    int valueneg = [neg intValue];
    NSNumber *numberneg = [NSNumber numberWithInt:valueneg + 1];
    
    
    NSString *myString = [numberneg stringValue];
    
    negativeLabel.text=myString;
    
    
    
}


-(void)updateValorationValues{


    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Valoraciones"];
    [query whereKey:@"placa" equalTo:placa];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        //Colmpruebo si existe el taxi en la clase valoraciones
        if (objects.count !=0) {
            
            
            NSArray *valuesArray =[objects objectAtIndex:0];
            
          neg = [valuesArray valueForKey:@"negativo"];
          pos = [valuesArray valueForKey:@"positivo"];
            
           
            
            NSString *myString = [neg stringValue];
            NSString *myString2 = [pos stringValue];
            
            positiveLabel.text= myString2;
            negativeLabel.text=myString;
            
            
        } else {
            
            //Si no existe creo el campo
            
            PFObject *valoracion = [PFObject objectWithClassName:@"Valoraciones" ];
            
            valoracion[@"placa"]=placa;
            valoracion[@"positivo"]=@0;
            valoracion[@"negativo"]=@0;


            [valoracion saveInBackground];
            


        }
    }];

}

-(void)getObjectIdFromParse{
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    

    PFQuery *query = [PFQuery queryWithClassName:@"Valoraciones"];
    [query whereKey:@"placa" equalTo:placa];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
       
                
                PFObject *uno = [objects objectAtIndex:0];
                objectId=uno.objectId;
            
            tres = uno.objectId;
            NSLog(@"valor de tres %@",tres);
            

        
            
            
           } else {

               // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    


}



-(void)guardarPlacaEnSqLite{
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa1 = [UserDefaults objectForKey:@"placa"];
    NSString *miusuario1 = [UserDefaults objectForKey:@"nombre"];
    
    
    /////////////////////SE INSERTA NOMBRE DE USUARIO Y PLACA EN MI SQLITE//////////////////////
    /////////////////////SE INSERTA NOMBRE DE USUARIO Y PLACA EN MI SQLITE//////////////////////
    /////////////////////SE INSERTA NOMBRE DE USUARIO Y PLACA EN MI SQLITE//////////////////////
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    sqlite3 *database;
    
    sqlite3_stmt *compiledStatement;
    
    if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
        
        NSString *sqlStatement = [NSString stringWithFormat:@"Insert into likes (\"miusuario\",\"placa\") VALUES (\"%@\",\"%@\")",miusuario1,placa1];
        
        
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                NSLog(@"INSERTADO");
            }
           
            
        } else {
            
            NSLog(@"error en la creacion del insert");
        }
        
        sqlite3_finalize(compiledStatement);
        
    }else{
        NSLog(@"error al abrir la base de datos");
    
    }
    sqlite3_close(database);
    
    
    
    
}

-(BOOL)verificarPlacaSqlite{
    
    NSString *test=@"NO";
    
    
   // Aqui se debe verificar las placas en sqlite a las que ya he valorado
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
    sqlite3 *database;
    
    
    sqlite3_stmt *compiledStatement;
    
    
    
    // Abrimos la base de datos de la ruta indicada en el delegate
    if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
        
        
        // Podríamos seleccionar solo algunos, o todos en el orden deseado así:
        // NSString *sqlStatement = [NSString stringWithFormat:@"seletc peso, largos, minutos from Gimnasio"];
      
       NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
        NSString *uno = [UserDefaults objectForKey:@"placa"];
        
        NSString *miusername = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"nombre"];
        
        NSString *sqlStatement = [NSString stringWithFormat:@"SELECT * FROM likes"];
        
        
        
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            
            // Recorremos los resultados.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Leemos las columnas necesarias. Aunque algunos valores son numéricos, prefiero recuperarlos en string y convertirlos luego, porque da menos problemas.
                
                NSString *nombre1 = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *nombre2 = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                
            
                
            /*    usuario *user = [[usuario alloc]init];
                
                user.usuario1 = nombre2;
                user.usuario2 = nombre1;*/
                
                if ([nombre1 isEqualToString:miusername]&&[nombre2 isEqualToString:uno]) {
                    

                    test = @"YES";
                
                }
                
                
                
                //    if ([nombre1 isEqualToString:miusername]) {[arrayuser addObject:user];}
                
            }
            
            
            
        } else {
            NSLog(@"error1");
        }
        
        // Libero la consulta
        sqlite3_finalize(compiledStatement);
        
    }
    // Cierro la base de datos
    sqlite3_close(database);
    
    
    if ([test isEqualToString:@"YES"]) {
        
        return YES;
    }
    else{
    
        
        return NO;
    }
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)twitterButton:(id)sender {
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uno = [UserDefaults objectForKey:@"placa"];
    
    NSString *textoutput = [NSString stringWithFormat:@"Se ha registrado la placa del taxi %@ a través de @Street_app para iOS", uno];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:textoutput];
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]  initWithTitle:@"Aviso" message:@"No se ha encontrado una cuenta de Twitter configurada en su equipo. Puede agregar una en Ajustes > Twitter > Agregar cuenta" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alert show];
    
    
    }
}

- (IBAction)facebookButton:(id)sender {
    
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uno = [UserDefaults objectForKey:@"placa"];
    
    NSString *textoutput = [NSString stringWithFormat:@"Se ha registrado la placa del taxi %@ a través de #Street_app para iOS", uno];

    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:textoutput];
        [self presentViewController:controller animated:YES completion:Nil];
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]  initWithTitle:@"Aviso" message:@"No se ha encontrado una cuenta de Facebook configurada en su equipo. Puede agregar una en Ajustes > Facebook > Agregar cuenta" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alert show];
    
    
    
    }
}

- (IBAction)saveButton:(id)sender {
    
    
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


   // NSString *direccion = [UserDefaults objectForKey:@"direccion"]; TENGO QUE ADAPTAR LA TABLA EN EL SERVIDOR
    
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
    
 


    UIAlertView *alert = [[UIAlertView alloc]  initWithTitle:@"Guardado" message:@"Los datos del vehículo se han guardado correctamente en su cuenta y en la de sus contactos." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
        
    }
}

- (IBAction)fotoButton:(id)sender {
    
    
    //Cojo los datos de mi ID y la placa para buscarlos
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [UserDefaults objectForKey:@"nombre"];
    NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    NSLog(@"%@",user);
    NSLog(@"%@",placa);

    
    PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    [query whereKey:@"userid" equalTo:user];
    [query whereKey:@"photouser" equalTo:placa];

    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        if (!object) {
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:NULL];
            
          
        } else {
            
            // The find succeeded.
        
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Encontrado" message:@"Ya ha guardado una foto de este vehículo. Gracias por ayudar a hacer de nuestras calles un lugar más seguro." delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil,   nil];
            [alert show];
            
        }
    }];

}


- (void)uploadImage:(NSData *)imageData
{
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [UserDefaults objectForKey:@"nombre"];
    NSString *placa = [UserDefaults objectForKey:@"placa"];

    //en el nombre de la foto pongo la placa
    PFFile *imageFile = [PFFile fileWithName:placa data:imageData];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    // Set determinate mode
    HUD.mode = MBProgressHUDModeDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Guardando";
    [HUD show:YES];
    
    // Save PFFile
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //Hide determinate HUD
            [HUD hide:YES];
            
            // Show checkmark
            HUD = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUD];
            
            // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
            // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
            HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            
            // Set custom view mode
            HUD.mode = MBProgressHUDModeCustomView;
            
            HUD.delegate = self;
            
            // Create a PFObject around a PFFile and associate it with the current user
            PFObject *userPhoto = [PFObject objectWithClassName:@"Photos"];
            [userPhoto setObject:imageFile forKey:@"photoid"];
            [userPhoto setObject:user forKey:@"userid"];
            [userPhoto setObject:placa forKey:@"photouser"];
            [userPhoto setObject:@"no" forKey:@"aprobed"];


            
            // Set the access control list to current user for security purposes
           // userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
           // PFUser *user = [PFUser currentUser];
            //[userPhoto setObject:user forKey:@"user"];
            
            [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                 //   [self refresh:nil];
                }
                else{
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
        else{
            [HUD hide:YES];
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    } progressBlock:^(int percentDone) {
        // Update your progress spinner here. percentDone will be between 0 and 100.
        HUD.progress = (float)percentDone/100;
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // Dismiss controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    NSData *imageData = UIImageJPEGRepresentation(smallImage, 0.05f);
    [self uploadImage:imageData];
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Listo!" message:@"Su foto se ha almacenado correctamente. Se publicará en la galería asociada a este vehículo cuando el equipo de Street la haya aprobado." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}


- (IBAction)goGalleryButton:(id)sender {
    
    [self performSegueWithIdentifier:@"gogallerysegue" sender:self];
}

- (IBAction)gobackButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)positiveButton:(id)sender {
    
    
    if ([self verificarPlacaSqlite]) {
        
        UIAlertView *aviso = [[UIAlertView alloc]initWithTitle:@"Valoracion" message:@"Ya ha votado por este taxi" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [aviso show];
    
    }
    else{
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Valoraciones"];
    [query whereKey:@"placa" equalTo:placa];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            
            PFObject *uno = [objects objectAtIndex:0];
            
            tres = uno.objectId;
            
              PFQuery *querye = [PFQuery queryWithClassName:@"Valoraciones"];
             
             // Retrieve the object by id
             [querye getObjectInBackgroundWithId:tres block:^(PFObject *objects, NSError *error) {
             
             // Now let's update it with some new data. In this case, only cheatMode and score
             // will get sent to the cloud. playerName hasn't changed.
             [objects incrementKey:@"positivo"];
             [objects saveInBackground];
             
             
             }];
            
            
            
            
            
        } else {
            
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    [self guardarPlacaEnSqLite];
        [self updateValuesPos];

    }

}

- (IBAction)negativeButton:(id)sender {
    
    
    if ([self verificarPlacaSqlite]) {
        
        UIAlertView *aviso = [[UIAlertView alloc]initWithTitle:@"Valoración" message:@"Su voto ha sido emitido correctamente. Gracias." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [aviso show];
        
    }
    else{
    
   
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Valoraciones"];
    [query whereKey:@"placa" equalTo:placa];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            
            PFObject *uno = [objects objectAtIndex:0];
            
            tres = uno.objectId;
            
            PFQuery *querye = [PFQuery queryWithClassName:@"Valoraciones"];
            
            // Retrieve the object by id
            [querye getObjectInBackgroundWithId:tres block:^(PFObject *objects, NSError *error) {
                
                // Now let's update it with some new data. In this case, only cheatMode and score
                // will get sent to the cloud. playerName hasn't changed.
                [objects incrementKey:@"negativo"];
                [objects saveInBackground];
                
                
            }];
            
            
            
            
            
        } else {
            
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    [self guardarPlacaEnSqLite];
        [self updateValuesNeg];


    
    }
    
}
@end
