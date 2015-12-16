//
//  SearchViewController.h
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>

#import <MapKit/MapKit.h>

@interface SearchViewController : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate,UIAlertViewDelegate,MKMapViewDelegate>{

    NSMutableArray *passArray;
}
@property (weak, nonatomic) IBOutlet UITextField *placaTextField;
@property (strong, nonatomic) NSMutableArray *json;
@property (strong, nonatomic) NSMutableArray *taxistasArray;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)infoButton:(id)sender;

- (IBAction)searchButton:(id)sender;


@end
