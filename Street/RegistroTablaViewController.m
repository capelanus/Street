//
//  RegistroTablaViewController.m
//  Street
//
//  Created by iDaniel on 22/03/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "RegistroTablaViewController.h"
#import "CustomCell2.h"

@interface RegistroTablaViewController ()

@end

@implementation RegistroTablaViewController
@synthesize myTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.myTableView addSubview:refreshControl];
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
    
    PFQuery *retrieveData =[PFQuery queryWithClassName:@"viajes"];
    [retrieveData whereKey:@"usuario" equalTo:user];
    [retrieveData orderByDescending:@"createdAt"];
    retrieveData.limit=20;
    
    [retrieveData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            nuevoarray =[[NSArray alloc]initWithArray:objects];
            NSLog(@"%@",nuevoarray);
        }
        
        [myTableView reloadData];
        
        
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
    
    NSLog(@"esto vale el nuevo array%lu",(unsigned long)[nuevoarray count]);
    return [nuevoarray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellIdentifier = @"celldata";
    
    CustomCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell= [[CustomCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    PFObject *tempDict = [ nuevoarray objectAtIndex:indexPath.row];
    
    cell.placaLabel.text=[tempDict objectForKey:@"placa"];
    cell.direccionLabel.text=[tempDict objectForKey:@"direccion"];
    cell.fechaLabel.text=[tempDict objectForKey:@"Fecha"];
    cell.horaLabel.text=[tempDict objectForKey:@"Hora"];
   //cell.backgroundColor = [UIColor clearColor];


    
    
    return cell;
    
    
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"tapped cell");
    
}







@end