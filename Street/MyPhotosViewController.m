//
//  MyPhotosViewController.m
//  Street
//
//  Created by Daniel López on 23/07/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "MyPhotosViewController.h"

@interface MyPhotosViewController ()

@end

@implementation MyPhotosViewController
@synthesize imageCollection;


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
    [self queryParseMethod];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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


-(void)queryParseMethod{
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [UserDefaults objectForKey:@"nombre"];
    
    NSLog(@"%@",user);
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Photos"];
    [query whereKey:@"userid" equalTo:user];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        
        if(!error){
            
            imageFilesArray2= [[NSArray alloc]initWithArray:objects];
            
            [imageCollection reloadData];
            
            
            NSInteger i = [imageFilesArray2 count];
            
            NSLog(@"esto vale el long = %ld",(long)i);
            

            
            if (i==0) {
                
                UIAlertView *alertImages = [[UIAlertView alloc] initWithTitle:@"Sin fotos" message:@"No ha hecho fotos de ningún vehículo hasta ahora." delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil,   nil];
                
                [alertImages show];
            }
            
            
        }
        
        
        
    }];
    
    
}

-(NSInteger) NumberOfSectionsInCollectionView:(UICollectionView *)CollectionView{
    
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [imageFilesArray2 count];
    
}

-(UICollectionViewCell *) collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier =@"cell2";
    
    TaxiCustomCollectionCell *cell = (TaxiCustomCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    PFObject *imageObject =[imageFilesArray2 objectAtIndex:indexPath.row];
    
   PFFile *imageFile = [imageObject objectForKey:@"photoid"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        
        if(!error){
            cell.imageInCell.image=[UIImage imageWithData:data];
            
        }
       
    }];
    
    
    return cell;
    
}


-(void)collectionView:(UICollectionView *) collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",(long)indexPath.row);
    
}






- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    //[self performSegueWithIdentifier:@"backgallerysegue" sender:self];
}

- (IBAction)infoButton:(id)sender {
    
    
    UIAlertView *alerta =[[UIAlertView alloc]initWithTitle:@"Fotos" message:@"Gracias a las fotos que hagas podremos identificar taxis falsos y alertar a otros usuarios." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alerta show];
}



@end
