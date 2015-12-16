//
//  UserSearchViewController.h
//  Street
//
//  Created by iDaniel on 07/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"


@interface UserSearchViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    
    
    AppDelegate *appDelegate;
    
    int *numeroContactos;

    
}
@property (weak, nonatomic) IBOutlet UITextField *searchUserTextField;
- (IBAction)searchUserButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myUserNameLabel;
- (IBAction)infoButton:(id)sender;


- (IBAction)payButton:(id)sender;
- (void)reloadComparteDatosLabel;


@property (weak, nonatomic) IBOutlet UILabel *disponiblesLabel;
@property (weak, nonatomic) IBOutlet UILabel *compartoLabel;

@end
