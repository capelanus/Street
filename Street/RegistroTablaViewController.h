//
//  RegistroTablaViewController.h
//  Street
//
//  Created by iDaniel on 22/03/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface RegistroTablaViewController : UIViewController<UITableViewDelegate>{
    
    NSArray *nuevoarray;
    
}


@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
