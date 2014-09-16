//
//  Droid.m
//  Kapitel2
//
//  Created by David Brünner on 16.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Droid.h"

@implementation Droid

@synthesize droidID;

- (id)initWithID:(int)inID {
    self = [super init];
    if (self) {
        self.droidID = [NSString stringWithFormat:@"0xDEADBEEF%i", inID];
    }
    return self;
}

@end
