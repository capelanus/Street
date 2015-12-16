//
//  AdvicesViewController.h
//  Street
//
//  Created by iDaniel on 08/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvicesViewController : UIViewController<UIAlertViewDelegate>
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//@property (weak, nonatomic) IBOutlet UIPageControl *control;
//- (IBAction)handleswap:(UIGestureRecognizer *)sender;
- (IBAction)policeCallButton:(id)sender;
- (IBAction)firemanCallButton:(id)sender;
- (IBAction)defenseCallButton:(id)sender;
- (IBAction)redCrossButton:(id)sender;
- (IBAction)smsButton:(id)sender;

- (IBAction)mensajesButton:(id)sender;

@end
