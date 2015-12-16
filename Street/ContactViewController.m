//
//  ContactViewController.m
//  Street
//
//  Created by iDaniel on 28/03/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

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

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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

- (IBAction)goBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)webButton:(id)sender {
    
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.streetperu.com"]];
    
   
}

- (IBAction)meFacebookButton:(id)sender {
    
   /* NSURL *url = [NSURL URLWithString:@"fb://profile/628130724"];
    [[UIApplication sharedApplication] openURL:url];*/
}

- (IBAction)facebookAppButton:(id)sender {
    
   
    
    NSURL *url = [NSURL URLWithString:@"fb://profile/620399008043777"];
    [[UIApplication sharedApplication] openURL:url];
    
}

- (IBAction)twiitterAcountButton:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=street_app"]];
    
    
    
    
}
@end
