//
//  PerfilViewController.m
//  Street
//
//  Created by iDaniel on 07/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "PerfilViewController.h"

@interface PerfilViewController ()

@end

@implementation PerfilViewController
@synthesize emailLabel,usuarioLabel,myTableView;

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
    

    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uno = [UserDefaults objectForKey:@"nombre"];

    usuarioLabel.text=uno;
    
    [self reloadAvailableUsers];

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



-(void)reloadAvailableUsers{
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *miid = [UserDefaults objectForKey:@"nombre"];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:miid];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        int i =0;
        PFUser *usuario = [objects objectAtIndex:i ];
        NSString *str = [usuario valueForKey:@"email"];
        
        emailLabel.text=str;
        
        //NSLog(@"%@",str);
        
    }];
    
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

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
