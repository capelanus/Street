//
//  AppDelegate.h
//  Street
//
//  Created by iDaniel on 01/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarDelegate>

@property (nonatomic, retain) NSString *databaseName;

@property (nonatomic, retain) NSString *databasePath;

@property (strong, nonatomic) UIWindow *window;










@end
