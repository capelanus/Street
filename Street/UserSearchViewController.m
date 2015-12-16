//
//  UserSearchViewController.m
//  Street
//
//  Created by iDaniel on 07/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "UserSearchViewController.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "usuario.h"
#import <sqlite3.h>

@interface UserSearchViewController ()

@end



@implementation UserSearchViewController{

    BOOL pfProductPurchaseInProgress;
    NSMutableArray *arrayuser;
    int num;


}
@synthesize searchUserTextField,myUserNameLabel,disponiblesLabel,compartoLabel;


- (void)viewDidLoad
{
    pfProductPurchaseInProgress = NO;
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uno = [UserDefaults objectForKey:@"nombre"];
    myUserNameLabel.text = uno;
    
    arrayuser = [[NSMutableArray alloc]init];
    [self loadUsersFromDB];
    
   // [self reloadComparteDatosLabel];
    [self reloadAvailableUsers];
    [self isItPossible];

    

    searchUserTextField.delegate=self;
    
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self reloadComparteDatosLabel];
    

    
}

-(void)reloadAvailableUsers{
    
    //actualiza en la etiqueta [disponibleslabel] el valor de "testnumber" de parse
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *miid = [UserDefaults objectForKey:@"nombre"];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:miid];
     query.limit=1;

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        PFUser *usuario = [objects objectAtIndex:0 ];
        NSNumber *str = [usuario valueForKey:@"testnumber"];
        
        NSString *myString = [str stringValue];
        

        disponiblesLabel.text=myString;
        //NSLog(@"%@",str);
        
       }];
    
}

-(void)reloadComparteDatosLabel{

//Actualiza la etiqueta XX de comparte datos con XX contactos (sqlite)

    arrayuser = [[NSMutableArray alloc]init];
    
    [self loadUsersFromDB];
    
    [arrayuser count];
    
    NSString *strFromInt = [NSString stringWithFormat:@"%lu",(unsigned long)[arrayuser count]];
    
    compartoLabel.text = strFromInt;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [searchUserTextField resignFirstResponder];
    
    return YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [searchUserTextField resignFirstResponder];
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) isConnectionAvailable{
    
	SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"google.com" UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    
    if (!receivedFlags || (flags == 0) )
    {
        return FALSE;
    } else {
		return TRUE;
	}
}

-(void)loadUsersFromDB{
    
    arrayuser = [[NSMutableArray alloc]init];

    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
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

    
}  //mis usuarios de la base de datos se meten en un array

-(void)isItPossible{
    
    //este metodo actualiza el valor de num
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *miid = [UserDefaults objectForKey:@"nombre"];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:miid];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        int i =0;
        
        PFUser *usuario = [objects objectAtIndex:i ];
        NSNumber *contactsNumber = [usuario valueForKey:@"testnumber"];
        

        num= [contactsNumber intValue];
        //en num está guardado el numero de contactos permitido
        //num = [contactsNumber intValue];

       
        
    }];
    

    

}



- (IBAction)searchUserButton:(id)sender {
    
    

    
    
    arrayuser = [[NSMutableArray alloc]init];

    [self loadUsersFromDB];
    
    NSLog(@"esto hay en el array cuando le doy al boton buscar %@",arrayuser);

    
    if (![self isConnectionAvailable]) {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se encuentra conectado a internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alerta show];
    }
    else{
        
        if ([searchUserTextField.text isEqualToString:@""]) {
            UIAlertView * alerta = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Para buscar un contacto debe introducir su nombre de usuario" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alerta show];
        }
        
        else{
            
            if ([arrayuser count]<num) {
                
            
            
            PFQuery *query = [PFUser query];
            [query whereKey:@"username" equalTo:searchUserTextField.text];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                
                NSLog(@"%@",objects);
                
                if (objects.count!=0) {
                    
                    UIAlertView *addContactAlert = [[UIAlertView alloc] initWithTitle:searchUserTextField.text message:@"Pulse 'Guardar' para compartir con este usuario los datos que desee almacenar" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Guardar", nil];
                    
                    [addContactAlert setTag:101];
                    [addContactAlert show];
                    

                    
                } else {
                    
                  
                    
                    UIAlertView *alerta1 = [[UIAlertView alloc] initWithTitle:@"No encontrado" message:@"El nombre de usuario insertado no se encuentra registrado" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alerta1 show];
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                    
                                    }
            }];
    
            
            
            
            }  ///////NO BORRAR AUN LA ALERTA 2 TIENE EL CAMPO DE INSERCION DEL USUARIO
            else{
            
                UIAlertView *alerta3 = [[UIAlertView alloc] initWithTitle:@"Contactos Completo" message:@"No puede agregar más de los contactos disponibles indicados" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alerta3 show];
            
            }
            
        }
    
    }
}//BUSCAR USUARIO EN INTERNET



- (BOOL)containsObject{
    
    [self loadUsersFromDB];

    NSLog(@"buscamos en el containsobject");


    for (int i=0; i<[arrayuser count]; i++) {
        
        usuario *auxTutorial = [arrayuser objectAtIndex:i];
        
        if ([searchUserTextField.text isEqualToString:[auxTutorial usuario2]]) {
           
            NSLog(@"el usuario esta en la base de datos");
           
            return YES;
            break;
            
        }
        
        
    }
    
    return NO;

   

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag==300) {
        
        NSLog(@"boton aceptar");
        [self reloadAvailableUsers];
        [self isItPossible];
    
    }
    
    if(alertView.tag==101 ){
        
        
        if (buttonIndex == [alertView firstOtherButtonIndex]){
            
            NSLog(@"guardando...");
            
            //////////////////////BOTON GUARDAR CONTACTO////////////////////////
            
            NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                                    stringForKey:@"nombre"];
            
            
            if ([searchUserTextField.text isEqualToString:savedValue]) {
                
                UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No puede agregarse a sí mismo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alerta show];
            }
            
            else{
                
                
                /////////////////////SE VERIFICA SI EL USUARIO ESTA EN MI BD//////////////////////
                
                if ([self containsObject]) {
                    
                    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Este usuario ya se encuentra en su registro de contactos" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alerta show];
                    
                    
                    
                }else{    /////////////////////SE INSERTA NOMBRE DE USUARIO EN MI BD//////////////////////
                    
                    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
                    
                    sqlite3 *database;
                    
                    sqlite3_stmt *compiledStatement;
                    
                    if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
                        
                        NSString *sqlStatement = [NSString stringWithFormat:@"Insert into misusuarios (\"myusername\",\"friendusername\") VALUES (\"%@\",\"%@\")",savedValue,self.searchUserTextField.text];
                        
                        
                        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
                            
                            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                                
                            }
                            
                        } else {
                            
                            NSLog(@"error");
                        }
                        
                        sqlite3_finalize(compiledStatement);
                        
                    }
                    sqlite3_close(database);
                    
                    [self reloadComparteDatosLabel];
                    
                    
                    
                }
                
                
                
            }
            
            
            
            /*  for (int i=0; i<[arrayuser count]; i++) {
             
             usuario *auxTutorial = [arrayuser objectAtIndex:i];
             
             if ([searchUserTextField.text isEqualToString:[auxTutorial usuario2]]) {
             
             UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Este usuario ya se encuentra en su base de datos" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
             [alerta show];
             
             break;
             
             }
             
             
             }*/
            
            /*    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
             
             sqlite3 *database;
             
             sqlite3_stmt *compiledStatement;
             
             if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
             
             NSString *sqlStatement = [NSString stringWithFormat:@"Insert into misusuarios (\"myusername\",\"friendusername\") VALUES (\"%@\",\"%@\")",savedValue,self.searchUserTextField.text];
             
             
             if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
             
             while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
             
             }
             
             } else {
             
             NSLog(@"error");
             }
             
             sqlite3_finalize(compiledStatement);
             
             }
             sqlite3_close(database);
             
             */
        }
        
    }
    
    if(alertView.tag==100 ){
        
        
        if(buttonIndex ==1){
        
            NSLog(@"comprado...");
            
            [PFPurchase buyProduct:@"contact.DaniLG.Peru.Street" block:^(NSError *error) {
                
                if (!error) {
                   
                    

                  // [self reloadAvailableUsers];
                    
                    UIAlertView *buySuccesAlert = [[UIAlertView alloc] initWithTitle:@"Listo" message:@"Ya puede agregar un usuario más a su lista de contactos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [buySuccesAlert setTag:300];
                    [buySuccesAlert show];
                    
                    


                }
                
                else{
                    
                    NSLog(@"%@",error);
                
                }
            }];
        
        }
    
    }
    
   
    
    }

- (IBAction)infoButton:(id)sender {
    
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Nombre de usuario" message:@"Busque contactos introduciendo el nombre de usuario con el que están registrados" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alerta show];
    
    
}

/*-(void)buyProduct:(NSString *)productID withCompletionBlock:(CompletionBlock)block {
    
    if (!self->pfProductPurchaseInProgress) {
    
    self->pfProductPurchaseInProgress = YES;
    [PFPurchase buyProduct:productID block:^(NSError *error) {
        self->pfProductPurchaseInProgress = NO;
        if (!error) {
          //  block();
        }
    }];
} }
*/

- (IBAction)payButton:(id)sender {
    
    UIAlertView *buyContactAlert = [[UIAlertView alloc]initWithTitle:@"Compra" message:@"¿Desea añadir un contacto extra por 0.99$?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Comprar",nil];
    
    [buyContactAlert setTag:100 ];
    
    [buyContactAlert show];
    
    
    
   /* if (!self->pfProductPurchaseInProgress) {

    self->pfProductPurchaseInProgress = YES;
        
        NSLog(@"Sí ha entrado");
        
        [PFPurchase addObserverForProduct:@"com.DaniLG.Peru.Street" block:^(SKPaymentTransaction *transaction) {
            
            self->pfProductPurchaseInProgress = NO;


             [self aumentausuarios];
        
        
            }];
        
    [PFPurchase buyProduct:@"com.DaniLG.Peru.Street" block:^(NSError *error) {
        
        
        if (!error) {
            
            NSLog(@"la compra se ha efectado con exito");
            
        }
    }];
        
    }
    
    else{
        
    NSLog(@"No ha entrado");
        
    }*/
}

/*
 
 
 // Use the product identifier from iTunes to register a handler.
 [PFPurchase addObserverForProduct:@"com.DaniLG.Peru.Street" block:^(SKPaymentTransaction *transaction) {
 // Write business logic that should run once this product is purchased.
 [self aumentausuarios];

 isPro = YES;
 }];
 
 
 */




@end





