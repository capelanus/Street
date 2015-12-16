//
//  LoginViewController.m
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "SFHFKeychainUtils.h"
#import "Reachability.h"

@interface LoginViewController () {
    
    UITextField *alertTextField;
    NSString *text;
    Reachability *internetReachableFoo;
  
}

@end

@implementation LoginViewController
@synthesize userTextField, passwordTextField;


NSString *newName;


- (void)viewDidLoad{
    

    userTextField.delegate=self;
    passwordTextField.delegate=self;
    
    userTextField.keyboardType=UIKeyboardTypeAlphabet;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//******************conexion************************

- (BOOL) isConnectionAvailable{
    
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
//******************conexion************************

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)shouldAutorotate{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{


    [userTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
    return YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [userTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];

}

-(void)textFieldDidBeginEditing:(UITextField *) textField{
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    
    if(textField == self.userTextField  ||textField == self.passwordTextField){
        
        if(screenHeight == 480.000000){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationBeginsFromCurrentState:YES];
            self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y-55), self.view.frame.size.width , self.view.frame.size.height);
            [UIView commitAnimations];
        }
        
           }
    
    
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    
    if(textField == self.userTextField||textField == self.passwordTextField){
        
        if(screenHeight == 480.000000){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationBeginsFromCurrentState:YES];
            self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y+55), self.view.frame.size.width , self.view.frame.size.height);
            [UIView commitAnimations];
        }
        
               
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)goButton:(id)sender {
    
    if (![self isConnectionAvailable]) {
        
        UIAlertView *noweb = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se encuentra conectado a internet." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [noweb show];

    }
    
    else{
    
    [PFUser logInWithUsernameInBackground:userTextField.text password:passwordTextField.text block:^(PFUser *user, NSError *error) {
        
        if (!error) {
            
            NSLog(@"Login user!");
         
            NSString *valueToSave= userTextField.text;
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:valueToSave forKey:@"nombre"];
            
            passwordTextField.text = nil;
            userTextField.text = nil;

       
            [self performSegueWithIdentifier:@"goSegue2" sender:self];
        }
        if (error) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Usuario y/o contraseña incorrectos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
    }];
    
    
   
        
    }
   
    
}




- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex

{
    if (buttonIndex)
    {
        newName = [[alertView textFieldAtIndex:0] text];
    }
}

- (void) getEmail{
    
    UIAlertView *nameAlertView= [[UIAlertView alloc] initWithTitle:@"Recuperar contraseña"
                               message:@"Introduzca la dirección de correo electrónico con la que se registró"
                              delegate:self
                     cancelButtonTitle:@"Cancelar"
                     otherButtonTitles:@"Enviar", nil];
    
    //alertTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
    nameAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    alertTextField = [nameAlertView textFieldAtIndex:0];
    alertTextField.keyboardType = UIKeyboardTypeEmailAddress;
    alertTextField.placeholder = @"Introducir email";
    
    [nameAlertView show];
    
    //[nameAlertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
   // [[nameAlertView textFieldAtIndex:1] setSecureTextEntry:NO];
     
   
}

- (BOOL) validateEmail: (NSString *) candidate{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //    return 0;
    return [emailTest evaluateWithObject:candidate];
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    NSString *email =[alertView textFieldAtIndex:0].text;
    
    NSUInteger number =[email length];
    
    
    if(buttonIndex == 1){
        
        if(number>0){
        
            if ([self validateEmail:email]){
        
            NSLog(@"%@",email);
                
                [PFUser requestPasswordResetForEmailInBackground:email];
                
                UIAlertView *alerta1 = [[UIAlertView alloc]initWithTitle:@"Reestablecimiento de contraseña"
                                                                message:@"Se ha enviado un email a esta dirección de correo electrónico para reestablecer tu contraseña"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil, nil];
                [alerta1 show];
        
            }
            else{
        
            NSLog(@"esto no es un email");
                UIAlertView *alerta2 = [[UIAlertView alloc]initWithTitle:@"Error"
                                                                message:@"Dirección de correo electrónico no válido"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil, nil];
                [alerta2 show];
                
         
    
            }
            }
        
        else{
    
        NSLog(@"el campo está vacío");
            UIAlertView *alerta3 = [[UIAlertView alloc]initWithTitle:@"Error"
                                                            message:@"No has introducido ninguna dirección de correo electrónico"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
            [alerta3 show];
            
       

    
            }
            }
    else{
            
            NSLog(@"este es el boton cancelar");

            
            }
    
 
    }
    

- (IBAction)recoverButton:(id)sender {
    
    if (![self isConnectionAvailable]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"No se encuentra conectado a internet" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else{
    
    [self getEmail];
    
   
    }
    
    
   //newName = display.text;
    //falta acceder al campo de la alerta y enviarlo...
    
}


@end
