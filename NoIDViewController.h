//
//  NoIDViewController.h
//  Street
//
//  Created by iDaniel on 14/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"

#import "AppDelegate.h"


@interface NoIDViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate,MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    MBProgressHUD *refreshHUD;

    AppDelegate *appDelegate;
    NSMutableArray *allImages;
    NSArray *imageFilesArray;
    NSString *objectId;

    
}
- (IBAction)twitterButton:(id)sender;
- (IBAction)facebookButton:(id)sender;

- (IBAction)saveButton:(id)sender;
- (IBAction)fotoButton:(id)sender;
- (IBAction)goGalleryButton:(id)sender;
- (IBAction)gobackButton:(id)sender;
- (IBAction)positiveButton:(id)sender;
- (IBAction)negativeButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *text1Label;
@property (weak, nonatomic) IBOutlet UILabel *numeroFotosLabel;
@property (weak, nonatomic) IBOutlet UILabel *placaLabel;
@property (weak, nonatomic) IBOutlet UILabel *positiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *negativeLabel;

@end
