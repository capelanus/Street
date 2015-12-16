//
//  ComentViewController.m
//  Street
//
//  Created by Daniel López on 01/08/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "ComentViewController.h"
#import "ComentCell.h"


@interface ComentViewController ()

@property (strong,nonatomic) ComentCell *customCell;

@end

@implementation ComentViewController

@synthesize oneTextField,tableView2,lineView,buttonView;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad{
   // self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"streetName2.png"]];
   //self.title = @"Comentarios";

    FechaHoy = [NSDate date];
   /* NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSLog(@"La fecha de hoy es%@",[dateFormatter stringFromDate:FechaHoy]);

  */
    
    UIImage *buttonImage = [UIImage imageNamed:@"backButton50.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 22  , 25);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    [self performSelector:@selector(retrievefromParse)];


    oneTextField.delegate=self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"opacoheader2.png"] forBarMetrics:UIBarMetricsDefault];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg@2x.png"] forBarMetrics:UIBarMetricsDefault];
    
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
    if(textField == self.oneTextField){
        
        //este va hacia abajo
        
   /*     [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.1];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y+216), self.view.frame.size.width , self.view.frame.size.height);
        [UIView commitAnimations];*/
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.oneTextField.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y +216);
            self.oneTextField.layer.position = newPosition;
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.lineView.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y +216);
            self.lineView.layer.position = newPosition;
        }];

        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.tableView2.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y +216);
            self.tableView2.layer.position = newPosition;
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.buttonView.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y +216);
            self.buttonView.layer.position = newPosition;
        }];

        
    }
    
    
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *) textField{
    
    
    
    if(textField == self.oneTextField){
        //Tengo que hacer que se mueva solamente la view del textfield
        
        
     /*  [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.35];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y-216), self.view.frame.size.width , self.view.frame.size.height);
        [UIView commitAnimations];*/
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.oneTextField.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y -216);
            self.oneTextField.layer.position = newPosition;
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.lineView.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y -216);
            self.lineView.layer.position = newPosition;
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.tableView2.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y -216);
            self.tableView2.layer.position = newPosition;
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            CGPoint oldPosition = self.buttonView.layer.position;
            CGPoint newPosition = CGPointMake(oldPosition.x, oldPosition.y -216);
            self.buttonView.layer.position = newPosition;
        }];
    }
    
    
    
    
}

-(void)retrievefromParse{
    

    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placa = [UserDefaults objectForKey:@"placa"];

    
    PFQuery *retrieveData =[PFQuery queryWithClassName:@"comentarios"];
    [retrieveData whereKey:@"placa" equalTo:placa];
    [retrieveData orderByDescending:@"createdAt"];
    
    [retrieveData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            nuevoarray2 =[[NSArray alloc]initWithArray:objects];
            //NSLog(@"%@",nuevoarray2);
        }
        
       [tableView2 reloadData];
        
        
    }];
    
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [oneTextField resignFirstResponder];
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [oneTextField resignFirstResponder];
    
    
    
    return YES;
}

-(NSInteger)numbersOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [nuevoarray2 count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    static NSString *cellIdentifier = @"cell";
    
    ComentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell= [[ComentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    PFObject *tempDict = [ nuevoarray2 objectAtIndex:indexPath.row];
    
    cell.userLabel.text=[tempDict objectForKey:@"username"];
    cell.myabel.text=[tempDict objectForKey:@"comentario"];

    
    ///////////////////////////////////////////////FECHA//////////////////////////////////////////////
    ///////////////////////////////////////////////FECHA//////////////////////////////////////////////
    
    
  //  cell.fechaLabel.text=[tempDict objectForKey:@"fecha"];
    
    
    NSString *myDate=[tempDict objectForKey:@"fecha"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    // voila!
    dateFromString = [dateFormatter dateFromString:myDate];
    
   // NSLog(@"%@",[dateFormatter stringFromDate:dateFromString]);
    
    NSTimeInterval interval = [FechaHoy timeIntervalSinceDate: dateFromString];

    float X = interval/86400;
    
    int y = (int)X; //dias
    
    int a = (int)(y/365); //años
    
    int b = (int)(y/30);   //meses
    
    int c = (int)(y/7);   //semanas
    
    
    
    if(a>0){
    
        if(a==1){
            cell.fechaLabel.text=@"Hace 1 año";
            //hace 1 año
        }
        else{
            
            NSString *texto = [NSString stringWithFormat:@"Hace %d años", a];
            cell.fechaLabel.text=texto;

            //hace x años
        };
    }
    
    else{
        if(b>0){
            if(b==1){
                cell.fechaLabel.text=@"Hace 1 mes";
    
            //hace 1 mes
            }
            else{
                NSString *texto = [NSString stringWithFormat:@"Hace %d meses", b];
                cell.fechaLabel.text=texto;
            //hace x meses
            }
            
            
        }
        else{
            if(c>0){
                
                if(c==1){
                    cell.fechaLabel.text=@"Hace 1 semana";

                //hace 1 semana
                }
                
                else{
                    NSString *texto = [NSString stringWithFormat:@"Hace %d semanas", c];
                    cell.fechaLabel.text=texto;
                //hace x semanas
                }
                
            
            
            }
            else{
                
                if(y==0){
                    cell.fechaLabel.text=@"Hoy";
                }
                else{
                    
                    if(y==1){
                       cell.fechaLabel.text=@"Hace 1 día";
                    
                    }
                    
                    else{
                        NSString *texto = [NSString stringWithFormat:@"Hace %d dias", y];
                        cell.fechaLabel.text=texto;
                        
                        //hace x dias
                    }
                   
                }
            
            }
        
    
    
    }
    
    
    }
    
    
    ///////////////////////////////////////////////FECHA//////////////////////////////////////////////
    ///////////////////////////////////////////////FECHA//////////////////////////////////////////////
    


   
    
    
    
    return cell;
    
    
    
 //   return [self basicCellAtIndexPath:indexPath];

}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (!self.customCell) {
        
        self.customCell = [self.tableView2 dequeueReusableCellWithIdentifier:@"cell"];
    }
    

    PFObject *tempDict = [ nuevoarray2 objectAtIndex:indexPath.row];
    
    self.customCell.userLabel.text=[tempDict objectForKey:@"username"];
    
    self.customCell.fechaLabel.text=[tempDict objectForKey:@"fecha"];
    
    self.customCell.myabel.text=[tempDict objectForKey:@"comentario"];

    
    [self.customCell layoutIfNeeded];
    
    
    CGFloat height = [self.customCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;

}
/*

 -(ComentCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    ComentCell *cell = [self.tableView2 dequeueReusableCellWithIdentifier:RWBasicCellIdentifier forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}


- (void)configureBasicCell:(ComentCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    
    PFObject *tempDict = [nuevoarray2 objectAtIndex:indexPath.row];
    
    cell.userLabel.text=[tempDict objectForKey:@"username"];
    
    NSLog(@"%@",cell.userLabel.text);
    
    
    cell.fechaLabel.text=[tempDict objectForKey:@"fecha"];
    //cell.textLabel.text=[tempDict objectForKey:@"comentario"];
    
    NSLog(@"%@",cell.fechaLabel.text);


    NSString *subtitle = [[NSString alloc]init];
    subtitle =[tempDict objectForKey:@"comentario"];
    
    if (subtitle.length > 200) {
        subtitle = [NSString stringWithFormat:@"%@...", [subtitle substringToIndex:130]];
    }
    
    [cell.myabel setText:subtitle];

    NSLog(@"%@",cell.textLabel.text);


}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   return [self heightForBasicCellAtIndexPath:indexPath];
}



- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
    static ComentCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView2 dequeueReusableCellWithIdentifier:RWBasicCellIdentifier];
    });
    
    [self configureBasicCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

*/


-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
     NSLog(@"tapped cell");
    [oneTextField resignFirstResponder];

    
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




- (IBAction)sendButton:(id)sender {
    
    
    
    if([oneTextField.text isEqualToString:@""]){
    
        UIAlertView * alerta = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Debe introducir un texto" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerta show];
    
        
    }
    
    
    
    else{
    
    NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uno = [UserDefaults objectForKey:@"placa"];
    NSString *yo = [UserDefaults objectForKey:@"nombre"];

    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];
    // NSLog(@"date: %@", dateString);
    
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *resultString = [dateFormatter stringFromDate: currentTime];
    

    NSString *texto= oneTextField.text;


    
    PFObject *coments = [PFObject objectWithClassName:@"comentarios"];
    
    coments[@"Hora"] = resultString;
    coments[@"fecha"] = dateString;
    coments[@"username"] = yo;
    coments[@"placa"] = uno;
    coments[@"comentario"]=texto;
   
    [coments saveInBackground];
    
    
    [self performSelector:@selector(retrievefromParse)];

    [oneTextField resignFirstResponder];

    self.oneTextField.text=nil;

    
    
    
    }

    
    
    
    
    
    
}
@end
