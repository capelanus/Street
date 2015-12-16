//
//  LoginViewController.h
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>



@interface LoginViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)goButton:(id)sender;
//- (IBAction)recoverButton:(id)sender;
//- (IBAction)backButton:(id)sender;




@end