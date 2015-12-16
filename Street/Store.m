//
//  Store.m
//  Street
//
//  Created by iDaniel on 11/02/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "Store.h"

@implementation Store
@synthesize passedArray;

static Store *sharedStore = nil;

// Store* myStore = [Store sharedStore];
+ (Store *) sharedStore {
    @synchronized(self){
        if (sharedStore == nil){
            sharedStore = [[self alloc] init];
        }
    }
    
    return sharedStore;
}


@end
