//
//  PhonesViewController.h
//  Street
//
//  Created by iDaniel on 10/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhonesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{


    NSArray *miarray;


}
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSArray *miarray;


@end
