//
//  GallViewController.m
//  Street
//
//  Created by iDaniel on 05/05/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "GallViewController.h"
//#import "PhotoDetailViewController.h"

@interface GallViewController ()

@end

@implementation GallViewController
@synthesize imageCollection,placaLabel;


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
    NSString *user = [UserDefaults objectForKey:@"placa"];
    
    placaLabel.text=user;
    
    [super viewDidLoad];
    [self queryParseMethod];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {



        
        if (buttonIndex == [alertView cancelButtonIndex]){
            
                [self.navigationController popViewControllerAnimated:YES];
        
        }
    
    
    



}



-(void)queryParseMethod{
    
   NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
   NSString *placa = [UserDefaults objectForKey:@"placa"];
    
    

    
    PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    [query whereKey:@"photouser" equalTo:placa];
    [query whereKey:@"aprobed" equalTo:@"yes"];


    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        
        if(!error){
            
            imageFilesArray= [[NSArray alloc]initWithArray:objects];
            
            [imageCollection reloadData];
            
            NSInteger i = [imageFilesArray count];
            
            NSLog(@"%ld",(long)i);
            
            if (i==0) {
                
                UIAlertView *alertImages = [[UIAlertView alloc] initWithTitle:@"Sin fotos" message:@"No hay fotos de este taxi, toma una e identifícalo para todos los usuarios de Street." delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil,   nil];
                
                [alertImages setTag:17];
                [alertImages show];
            }
            
           
        }
        
        
        
    }];
    

    
}




#pragma mark - UICollection data source


-(NSInteger) NumberOfSectionsInCollectionView:(UICollectionView *)CollectionView{
    
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [imageFilesArray count];

    
}

-(UICollectionViewCell *) collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
 static NSString *cellIdentifier =@"cell";
    
 CustomCollectionCell *cell = (CustomCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
 PFObject *imageObject =[imageFilesArray objectAtIndex:indexPath.row];
    
 PFFile *imageFile = [imageObject objectForKey:@"photoid"];
 
 [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
     
 if(!error){
     NSLog(@"entra");
 cell.imageInCell.image=[UIImage imageWithData:data];
 
 }
     
 }];
 
 
 return cell;
 
 }


-(void)collectionView:(UICollectionView *) collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
  
    
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
    //[self performSegueWithIdentifier:@"backgallerysegue" sender:self];
}
@end
