//
//  ComentViewController.h
//  Street
//
//  Created by Daniel López on 01/08/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<Parse/Parse.h>

@interface ComentViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    NSArray *nuevoarray2;
    NSDate *FechaHoy;
    
}

@property (weak, nonatomic) IBOutlet UITextField *oneTextField;
- (IBAction)sendButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView2;
@property (weak, nonatomic) IBOutlet UIImageView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *buttonView;
@end
