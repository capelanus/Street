//
//  DataViewController.h
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"


@interface DataViewController : UIViewController <UIAlertViewDelegate>{

    NSMutableArray *array2;
    NSString *placaPass;
    AppDelegate *appDelegate;

    
}
@property (weak, nonatomic) IBOutlet UIImageView *fotoImage;
@property (weak, nonatomic) IBOutlet UILabel *nombreTaxistaLabel;
@property (weak, nonatomic) IBOutlet UILabel *apellidoTaxistaLabel;
@property (weak, nonatomic) IBOutlet UILabel *dniLabel;
@property (weak, nonatomic) IBOutlet UILabel *nacionLabel;
@property (weak, nonatomic) IBOutlet UILabel *placaLabel;


- (IBAction)nuevaBusquedaButton:(id)sender;

- (IBAction)saveDataButton:(id)sender;

@end
