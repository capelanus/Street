//
//  Store.h
//  Street
//
//  Created by iDaniel on 11/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject{

    NSMutableArray *passedArray;
    
}
@property(strong, nonatomic) NSMutableArray *passedArray;

+ (Store *) sharedStore;



@end
