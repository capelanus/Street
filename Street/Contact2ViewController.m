//
//  Contact2ViewController.m
//  Street
//
//  Created by iDaniel on 10/04/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "Contact2ViewController.h"
#import <sqlite3.h>
#import "AppDelegate.h"
#import "usuario.h"
#import "CustomUsuarioCell.h"
#import "UserSearchViewController.h"
@interface Contact2ViewController ()

@end

@implementation Contact2ViewController{
    
    NSMutableArray *arrayuser;
    
}



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
    arrayuser = [[NSMutableArray alloc]init];
    [self loadUsersFromDB];
    [self.myTableView reloadData];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //devolver el tamaño del array
    return [arrayuser count];
    
}

- (void)tableView:(UITableView *)tableView

    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //AQUI EL CODIGO QUE BORRA EL USUARIO DE LA BASE DE DATOS 
        //**********************borrando de sqlite******************************
        //**********************borrando de sqlite******************************
        
        NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"nombre"];

       
            
            sqlite3 *database;
            
            
            sqlite3_stmt *compiledStatement;
            
            
            
            // Abrimos la base de datos de la ruta indicada en el delegate
            if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
                
                usuario *auxTutorial = [arrayuser objectAtIndex:indexPath.row];

                NSLog(@"hasta aqui va bien");
                
                NSString *sqlStatement = [NSString stringWithFormat:@"DELETE FROM  misusuarios WHERE myusername ='%@' AND friendusername= '%@'",savedValue, [auxTutorial usuario2]];
                
                //DELETE FROM  misusuarios WHERE myusername ='dani' AND friendusername= 'pepe'
                

                // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
                if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
                    
                    // Recorremos los resultados. En este caso no habrá.
                    while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                        
                    }
                    
                    
                    
                } else {
                    NSLog(@"error");
                }
                
                // Libero la consulta
                sqlite3_finalize(compiledStatement);
                
            }
            // Cierro la base de datos
            sqlite3_close(database);
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
            
        
        
        //**********************borrando de sqlite******************************
        //**********************borrando de sqlite******************************
        
        [arrayuser removeObjectAtIndex:[indexPath row]];
        [tableView reloadData];
        
       
        
        

    }
}


- (NSInteger)numberOfSections:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"cell";
    
    CustomUsuarioCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[CustomUsuarioCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //cell.textLabel.text = self.miarray[indexPath.row];
    usuario *auxTutorial = [arrayuser objectAtIndex:indexPath.row];
    //    cell.pesoLabel.text=[auxTutorial peso];
    cell.usuarioLabel.text=[auxTutorial usuario2];
    
    NSString *str = [@(indexPath.row + 1) stringValue];
    cell.numberLabel.text=str;

    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

- (void)loadUsersFromDB{
    
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
    sqlite3 *database;
    
    
    sqlite3_stmt *compiledStatement;
    
    
    
    // Abrimos la base de datos de la ruta indicada en el delegate
    if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
        
        
        // Podríamos seleccionar solo algunos, o todos en el orden deseado así:
        // NSString *sqlStatement = [NSString stringWithFormat:@"seletc peso, largos, minutos from Gimnasio"];
        
        NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"nombre"];

        NSString *sqlStatement = [NSString stringWithFormat:@"select * from misusuarios"];
        
        
        
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            
            // Recorremos los resultados.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Leemos las columnas necesarias. Aunque algunos valores son numéricos, prefiero recuperarlos en string y convertirlos luego, porque da menos problemas.
                NSString *nombre1 = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *nombre2 = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];

                usuario *user = [[usuario alloc]init];
                
                user.usuario1 = nombre1;
                user.usuario2 = nombre2;
                
                if ([nombre1 isEqualToString:savedValue]) {
                    
                    [arrayuser addObject:user];
                    
                }
                
                
                
                
            }
            
            
            
        } else {
            NSLog(@"error1");
        }
        
        // Libero la consulta
        sqlite3_finalize(compiledStatement);
        
    }
    // Cierro la base de datos
    sqlite3_close(database);
    
    NSLog(@"esto es lo que hay en el array = %@",arrayuser);
    
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
