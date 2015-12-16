//
//  RegisterViewController.h
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface RegisterViewController : UIViewController<UITextFieldDelegate>

//@property (weak, nonatomic) IBOutlet UITextField *unsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *password2TextField;
@property (weak, nonatomic) IBOutlet UITextField *password1TextField;
@property (weak, nonatomic) IBOutlet UITextField *usernametextField;

- (IBAction)sendButton:(id)sender;
//- (IBAction)conditionsButton:(id)sender;
//- (IBAction)privacyButton:(id)sender;
- (IBAction)inicioButton:(id)sender;

@end
