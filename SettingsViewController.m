//
//  SettingsViewController.m
//  Street
//
//  Created by iDaniel on 27/03/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "SettingsViewController.h"
#import "SFHFKeychainUtils.h"
#import "HomeViewController.h"


@interface SettingsViewController () <UIActionSheetDelegate>

@end

@implementation SettingsViewController

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

- (IBAction)logoutButton:(id)sender {
    
   UIActionSheet *alert = [[UIActionSheet alloc]initWithTitle:@"¿ Seguro quiere salir de la aplicación ?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Salir" otherButtonTitles:nil, nil];
    
    [alert showInView:self.view ];
    
    

}




-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==0){
        
        NSLog(@"Boton salir");
        
        [PFUser logOut];
        PFUser *currentUser = [PFUser currentUser];
        NSLog(@"%@",currentUser);
        
      //  [SFHFKeychainUtils purgeItemsForServiceName:@"StreetApp" error:nil];
      //  [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"preferenceName"];
        
        
        
        
        [self dismissViewControllerAnimated:YES completion:^{
            [(UINavigationController *)self.presentingViewController popToRootViewControllerAnimated:YES];
        }];
        

        
        [self performSegueWithIdentifier:@"gobacksegue" sender:self];
    }

    
    }
 






@end
