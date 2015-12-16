//
//  Table2ViewController.m
//  Street
//
//  Created by iDaniel on 20/03/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "Table2ViewController.h"
#import "CustomCell.h"
#import "Store.h"
#import "Taxista.h"
#import "DataViewController.h"
 #import <QuartzCore/QuartzCore.h>

@interface Table2ViewController ()

@end

@implementation Table2ViewController

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
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    Store *myStore= [Store sharedStore];
    dataArray = myStore.passedArray;
    
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [dataArray count];
    
}


- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
   Taxista *persona = [dataArray objectAtIndex:indexPath.row];
    
    cell.image.layer.masksToBounds = YES;
    cell.image.layer.cornerRadius = 50;
    
    cell.lastNameLabel.text = [persona apellido];
    NSLog(@"%@",cell.lastNameLabel.text);
    cell.name.text = [persona nombre];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSURL * imageURL = [NSURL URLWithString:persona.imageData];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    cell.image.image = image;
   
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Taxista *persona2 = [dataArray objectAtIndex:indexPath.row];
    
    sendArray = [[NSMutableArray alloc]init];
    
    [sendArray addObject:persona2];
    
    DataViewController *detalle = [self.storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    
    Store *myStore = [Store sharedStore];
    myStore.passedArray = sendArray;
    
    //[detalle.nombreTaxistaLabel setText:[persona2 nombre]];
    //[detalle.apellidoTaxistaLabel setText: [persona2 objectForKey:@"apellido"]];
    //[detalle.dniLabel setText: [persona2 objectForKey:@"dni"]];
    //[detalle.nacionLabel setText: [persona2 objectForKey:@"nacionalidad"]];
    
    
    [self.navigationController pushViewController:detalle animated:YES];
    
    
    
    
    
    
    
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
