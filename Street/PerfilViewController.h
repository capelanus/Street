//
//  PerfilViewController.h
//  Street
//
//  Created by iDaniel on 07/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface PerfilViewController : UIViewController



- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@property (weak, nonatomic) IBOutlet UILabel *usuarioLabel;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
