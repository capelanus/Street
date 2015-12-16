//
//  GallViewController.h
//  Street
//
//  Created by iDaniel on 05/05/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionCell.h"
#import <Parse/Parse.h>


@interface GallViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>{

    NSMutableArray *imagesArray;
    NSArray *imageFilesArray;


}

@property (weak, nonatomic) IBOutlet UICollectionView *imageCollection;
@property (weak, nonatomic) IBOutlet UILabel *placaLabel;

- (IBAction)backButton:(id)sender;



@end
