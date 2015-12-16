//
//  AdvicesViewController.m
//  Street
//
//  Created by iDaniel on 08/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "AdvicesViewController.h"

@interface AdvicesViewController ()

@end

@implementation AdvicesViewController

//int imageIndex = 9;


/*- (IBAction)handleswap:(UIGestureRecognizer *)sender{

    NSArray *images = [[NSArray alloc ]initWithObjects:@"avisogris1.png",@"avisogris2.png",@"avisogris3.png",@"avisogris4.png",@"avisogris5.png",@"avisogris6.png",@"avisogris7.png",@"avisogris8.png",@"avisogris9.png", nil];
    
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex++;
            NSLog(@"Swipe left");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex--;
            NSLog(@"Swipe right");
            
            break;
            
        default:
            break;
    }
    imageIndex = (imageIndex < 0) ? ([images count] - 1):
    imageIndex % [images count];
    imageView.image=[UIImage imageNamed:[images objectAtIndex:imageIndex]];
    
    control.currentPage = imageIndex;


}*/

- (IBAction)policeCallButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://105"]];
}

- (IBAction)firemanCallButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://116"]];
}

- (IBAction)defenseCallButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://110"]];
}

- (IBAction)redCrossButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://115"]];
}

- (IBAction)mensajesButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://119"]];
}

- (IBAction)smsButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Mensaje de emergencia" message:@"Si estás en una emergencia, deja un mensaje en el 119. Tu familia podrá saber cómo te encuentras." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
