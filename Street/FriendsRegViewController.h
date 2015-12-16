//
//  FriendsRegViewController.h
//  Street
//
//  Created by iDaniel on 16/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface FriendsRegViewController : UIViewController<UITableViewDelegate>{
    
    NSArray *nuevoarray2;
    
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView2;

- (IBAction)gobackButton:(id)sender;
- (IBAction)infoButton:(id)sender;

@end
