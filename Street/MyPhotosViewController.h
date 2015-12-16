//
//  MyPhotosViewController.h
//  Street
//
//  Created by Daniel López on 23/07/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "TaxiCustomCollectionCell.h"


@interface MyPhotosViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UIAlertViewDelegate>{
    
    NSMutableArray *imagesArray;
    NSArray *imageFilesArray2;
    
    }

@property (weak, nonatomic) IBOutlet UICollectionView *imageCollection;

- (IBAction)backButton:(id)sender;


- (IBAction)infoButton:(id)sender;







@end
