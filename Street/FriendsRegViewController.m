//
//  FriendsRegViewController.m
//  Street
//
//  Created by iDaniel on 16/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "FriendsRegViewController.h"
#import "CustomCellFriends.h"

@interface FriendsRegViewController ()

@end

@implementation FriendsRegViewController
@synthesize myTableView2;

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
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.myTableView2 addSubview:refreshControl];
    [super viewDidLoad];
    [self performSelector:@selector(retrievefromParse)];
    
    
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    
    [self performSelector:@selector(retrievefromParse)];
    [refreshControl endRefreshing];
}

-(void)retrievefromParse{
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [UserDefaults objectForKey:@"nombre"];
    
    PFQuery *retrieveData =[PFQuery queryWithClassName:@"updatereg"];
    [retrieveData whereKey:@"otrousuario" equalTo:user];
    [retrieveData orderByDescending:@"createdAt"];
    retrieveData.limit=20;
    
    [retrieveData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            nuevoarray2 =[[NSArray alloc]initWithArray:objects];
            NSLog(@"%@",nuevoarray2);
        }
        
        [myTableView2 reloadData];
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numbersOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"esto vale el nuevo array%lu",(unsigned long)[nuevoarray2 count]);
    return [nuevoarray2 count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellIdentifier = @"datacell2";
    
    CustomCellFriends *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell= [[CustomCellFriends alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    PFObject *tempDict = [ nuevoarray2 objectAtIndex:indexPath.row];
    
    cell.placaLabel.text=[tempDict objectForKey:@"placa"];
    cell.direccionLabel.text=[tempDict objectForKey:@"direccion"];
    cell.fechaLabel.text=[tempDict objectForKey:@"Fecha"];
    cell.horaLabel.text=[tempDict objectForKey:@"Hora"];
    cell.idamigoLabel.text=[tempDict objectForKey:@"miusuario"];
    
    
    
    return cell;
    
    
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"tapped cell");
    
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

- (IBAction)gobackButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)infoButton:(id)sender {
    
    UIAlertView *infoAlert =[[UIAlertView alloc]initWithTitle:@"Info" message:@"Este es el registro de los usuarios que comparten datos contigo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [infoAlert show];
    
}
@end
