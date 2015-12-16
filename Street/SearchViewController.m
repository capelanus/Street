//
//  SearchViewController.m
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "SearchViewController.h"
#import "DataViewController.h"
#import "Taxista.h"
#import "Store.h"
#import "Reachability.h"

@interface SearchViewController ()

@end

@implementation SearchViewController{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    NSString *longitud;
    NSString *latitud;
}
@synthesize placaTextField, taxistasArray,mapView;

- (void)viewDidLoad
{
    placaTextField.delegate = self;
    placaTextField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
  

    
    self.mapView.delegate = self;
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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [placaTextField resignFirstResponder];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [placaTextField resignFirstResponder];

    return  YES;
}

-(void)textFieldDidBeginEditing:(UITextField *) textField{
    
/*    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;

    
    if(textField == self.placaTextField){
        
        if(screenHeight == 480.000000){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationBeginsFromCurrentState:YES];
            self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y-75), self.view.frame.size.width , self.view.frame.size.height);
            [UIView commitAnimations];
        }
        
            }
    
    
    
    */
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
   /* CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;

    
    if(textField == self.placaTextField){
        
        if(screenHeight == 480.000000){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationBeginsFromCurrentState:YES];
            self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y+75), self.view.frame.size.width , self.view.frame.size.height);
            [UIView commitAnimations];
        }
        
        
    }
    
    
  */
    
    
}





- (BOOL) isConnectionAvailable
{
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

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 300, 300);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)infoButton:(id)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"INFO" message:@"Ingrese la placa de cualquier taxi que usted utilice para guardarla y compartirla. Ejem: AA1-123 se debe ingresar como AA1123." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation

//location: Busco la calle, direccion longitud y latitud

{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        NSLog(@"%@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]);
        NSLog(@"%@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
        
        longitud = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        latitud = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];

    }
    
    [locationManager stopUpdatingLocation];
    
    // Reverse Geocoding
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            
            NSMutableString *direcZ = [NSMutableString string];
            
            if (placemark.subThoroughfare) {
                [direcZ appendString:placemark.subThoroughfare];
            }
            if (placemark.thoroughfare) {
                if (direcZ.length) {
                    [direcZ appendString:@", "];
                }
                [direcZ appendString:placemark.thoroughfare];
            }
            [direcZ appendString:@", "];
            [direcZ appendString:placemark.postalCode];
            [direcZ appendString:@", "];
            [direcZ appendString:placemark.locality];
            [direcZ appendString:@", "];
            [direcZ appendString:placemark.administrativeArea];
            
            NSLog(@"%@",direcZ);
  
            
            /*NSString *direcZ=   [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
            
            
            
            */
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:direcZ forKey:@"direccion"];
            [userDefaults setObject:longitud forKey:@"long"];
            [userDefaults setObject:latitud forKey:@"lat"];

            
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

- (IBAction)searchButton:(id)sender {
    
    
    
    
    if (![self isConnectionAvailable]) {
        
        UIAlertView *alertax = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se encuentra conectado a internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertax show];

    }
    
    else{
        
        NSUInteger placaSize = [placaTextField.text length];
        
        if (placaSize !=6 ) {
            
            UIAlertView *alerta1 = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Formato de placa inválido. Debe contener 6 dígitos." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alerta1 show];;
        }
        else{
    
  /*  if([placaTextField.text isEqualToString:@""]){
        
        UIAlertView *alertax = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Debe ingresar una placa para buscar los datos del conductor" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alertax show];
    
    }*/
            
   // else{
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        [locationManager startUpdatingLocation];
        
        //GUARDO LA PLACA EN NSUSERDEFAULTS Y MANDO CONSULTA
        
        NSString *placa= placaTextField.text;
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:placa forKey:@"placa"];
            
            //BUSCO EN LA BASE DE DATOS "taxistas" la placa del textfield
            
            PFQuery *buscar = [PFQuery queryWithClassName:@"conductores"];
            [buscar whereKey:@"placa" equalTo:placaTextField.text];
            [buscar findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                
                NSLog(@"%@",objects);
                
                if (objects.count!=0) {
                    
                        if (objects.count==1) {
                        //Hay un taxista en el array
                        [self performSegueWithIdentifier:@"onedriversegue" sender:self];
                         NSLog(@"hay 1 resultado");
                        
                        }else{
                        
                        //Hay más de 1 taxista en el array
                         [self performSegueWithIdentifier:@"seguenew" sender:self];
                         NSLog(@"hay mas de 1");
                    
                        }
                 
                    
                   
                    
                } else {
                    
                    //Hay 0 taxistas en el array
                    [self performSegueWithIdentifier:@"noidsegue" sender:self];

                    NSLog(@"no hay objetos");
                }
            }];
            
            placaTextField.text=nil;
            [self textFieldShouldReturn:placaTextField];
        
            
        }
    }
        
    
}
@end
