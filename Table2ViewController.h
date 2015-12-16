//
//  Table2ViewController.h
//  Street
//
//  Created by iDaniel on 20/03/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Table2ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    NSMutableArray *dataArray;
    NSMutableArray *sendArray;
    int count;

}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end
