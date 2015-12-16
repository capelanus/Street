//
//  RegisterViewController.m
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "Reachability.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize  emailTextField, password1TextField, password2TextField,usernametextField;


- (void)viewDidLoad
{
    emailTextField.delegate=self;
    password2TextField.delegate=self;
    password1TextField.delegate=self;
    usernametextField.delegate=self;
    
    emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

- (BOOL) validateEmail: (NSString *) candidate{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //    return 0;
    return [emailTest evaluateWithObject:candidate];
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

    [emailTextField resignFirstResponder];
    [password1TextField resignFirstResponder];
    [password2TextField resignFirstResponder];
    [usernametextField resignFirstResponder];


}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{

        [emailTextField resignFirstResponder];
        [password1TextField resignFirstResponder];
        [password2TextField resignFirstResponder];
    [usernametextField resignFirstResponder];


    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    
if(textField == self.password2TextField){
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


-(void)textFieldDidBeginEditing:(UITextField *) textField{
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    
    if(textField == self.password2TextField){
        
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(IBAction)conditionsButton:(id)sender{
    
    [self performSegueWithIdentifier:@"goToUsoSegue" sender:self];

}

-(IBAction)privacyButton:(id)sender{
    
    [self performSegueWithIdentifier:@"goToPrivacySegue" sender:self];
}
*/

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

- (IBAction)sendButton:(id)sender {
    
    if (![self isConnectionAvailable]) {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se encuentra conectado a internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alerta show];
    }
    else{
         if([usernametextField.text isEqualToString:@""]){
            
            UIAlertView *alertaUserName = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Debe introducir un usuario para poder registrarse." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alertaUserName show];

            nil;
            
        }
        else{
    
    
               if ([usernametextField.text length]<3||[usernametextField.text length]>16) {
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El nombre de usuario debe contener entre 3 y 15 caracteres para poder registrarse" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alerta show];
    }
    
                else{
    
        
    
    
     if ([self.password2TextField.text isEqualToString:self.password1TextField.text]){
        
        NSUInteger number =[password1TextField.text length];
         
         NSUInteger number2 =[usernametextField.text length];
         
         if (number2<15) {
             nil;
         
         
         
        
        if (number> 5){
            
            if([self validateEmail:[emailTextField text]] ==1){
                
           // LoginViewController *login = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            //[self.navigationController pushViewController:login animated:YES];
                
                NSLog(@"registering....");
                
                NSNumber *aNumber = [NSNumber numberWithInteger:1];
                
                PFUser *newUser = [PFUser user];
                newUser.username = usernametextField.text;
                newUser.email = emailTextField.text;
                newUser.password = password1TextField.text;
                newUser[@"testnumber"] = aNumber;
             
                
                
                [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                   
                    if (!error) {
                        NSLog(@"Registration success!");
                        
                     
                        
                        password1TextField.text = nil;
                        usernametextField.text = nil;
                        password1TextField.text = nil;
                        password2TextField.text = nil;
                        emailTextField.text = nil;
                        
                        
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Registrado" message:@"Se ha registrado correctamente. Introduzca su usuario y contraseña para empezar." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]  ;
                        [alert show];
                        
                        [self performSegueWithIdentifier:@"login" sender:self];
                    }
                    
                    else {
                        
                        //aqui tengo que diferenciar los tipos de errores... "email ya registrado" y "usuario ya registrado"
                        
                        
                        
                        NSString *errorString = [error userInfo][@"error"];
                        NSLog(@"errorstring = %@",errorString);
                        
                        NSString *texterror = [NSString stringWithFormat:@"username %@ already taken",usernametextField.text];
                        NSLog(@"%@",texterror);
                        
                        NSString *emailerror = [NSString stringWithFormat:@"the email address %@ has already been taken",emailTextField.text];
                        NSLog(@"%@",texterror);
                        
                        
                        
                        if ([texterror isEqual:errorString]) {
                            
                            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"El nombre de usuario que ha introducido ya se encuentra registrado" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]  ;
                            [alert show];
                        }
                        
                        if ([emailerror isEqualToString: errorString]) {
                            
                            UIAlertView *alertX = [[UIAlertView alloc]initWithTitle:@"Error" message:@"El email que ha introducido ya se encuentra registrado" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]  ;
                            [alertX show];
                        }
                        
                    }
                }];

                
                
                
            }
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensaje" message:@"Email no válido" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
                
            }
        }
        
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensaje" message:@"La contraseña debe contener al menos 6 caracteres" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        
         }
     
     
         else{
         
             UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Mensaje" message:@"EL nombre de usuario no puede contener más de 15 caracteres" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             
             [alert show];
         
         }
     
     
     }
    
    else{
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Mensaje" message:@"La contraseñas no coinciden" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
        
    
    
    }
        
        }
    }
}



- (IBAction)inicioButton:(id)sender {
    
    [self performSegueWithIdentifier:@"login" sender:self];
}
@end
