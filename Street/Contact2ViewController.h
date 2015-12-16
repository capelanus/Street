//
//  Contact2ViewController.h
//  Street
//
//  Created by iDaniel on 10/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UserSearchViewController.h"


@interface Contact2ViewController : UIViewController{
    
    AppDelegate *appDelegate;
    
    
}

- (IBAction)backButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end
