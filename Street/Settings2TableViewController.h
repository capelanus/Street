//
//  Settings2TableViewController.h
//  Street
//
//  Created by iDaniel on 24/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface Settings2TableViewController : UITableViewController<UITableViewDelegate,UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UITableViewCell *perfil;
@property (strong, nonatomic) IBOutlet UITableViewCell *acerca;
@property (strong, nonatomic) IBOutlet UITableViewCell *contacto;

@property (strong, nonatomic) IBOutlet UITableViewCell *politicas;
@property (strong, nonatomic) IBOutlet UITableViewCell *condiciones;
@property (strong, nonatomic) IBOutlet UITableViewCell *salir;
@end
