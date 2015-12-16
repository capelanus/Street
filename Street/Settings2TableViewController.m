//
//  Settings2TableViewController.m
//  Street
//
//  Created by iDaniel on 24/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "Settings2TableViewController.h"

@interface Settings2TableViewController ()

@end

@implementation Settings2TableViewController
@synthesize perfil,acerca,contacto,politicas,condiciones,salir;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"lightyellosnavbar.png"] forBarMetrics:UIBarMetricsDefault];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*  if ([indexPath isEqual:[NSIndexPath indexPathForRow:1 inSection:0]]) {
     
     
     [self performSegueWithIdentifier:@"segue" sender:self];
     
     
     }*/
    
    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (theCellClicked == salir) {
        NSLog(@"boton salir");
        
        UIActionSheet *alert = [[UIActionSheet alloc]initWithTitle:@"¿ Seguro quiere salir de la aplicación ?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Salir" otherButtonTitles:nil, nil];
        
        [alert showInView:self.view ];
        
    }
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==0){
        
        NSLog(@"Boton salir");
        
        [PFUser logOut];
        PFUser *currentUser = [PFUser currentUser];
        NSLog(@"%@",currentUser);
        
        //  [SFHFKeychainUtils purgeItemsForServiceName:@"StreetApp" error:nil];
        //  [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"preferenceName"];
        
        
        
        
      /*  [self dismissViewControllerAnimated:YES completion:^{
            [(UINavigationController *)self.presentingViewController popToRootViewControllerAnimated:YES];
        }];*/
        
        
        
        [self performSegueWithIdentifier:@"gobacksegue" sender:self];
    }
    
    
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
