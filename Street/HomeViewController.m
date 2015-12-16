//
//  HomeViewController.m
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotate

{
    return NO;
    
}

- (void)viewDidLoad
{

     PFUser *currentUser = [PFUser currentUser];
     
     if (currentUser) {
     
    
     
         [self performSegueWithIdentifier:@"tabbarsegue" sender:self];
     
     } else {
     // show the signup or login screen
     }

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterButon:(id)sender {
    
    [self performSegueWithIdentifier:@"loginsegue" sender:self];
}


@end
