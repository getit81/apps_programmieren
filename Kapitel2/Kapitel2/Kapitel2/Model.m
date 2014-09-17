//
//  Model.m
//  Kapitel2
//
//  Created by David Brünner on 16.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Model.h"
#import "Droid.h"
#import "ProtocolDroid.h"
#import "AstroDroid.h"
#import "Wookie.h"

@interface Model ()

@property (strong) NSMutableArray *objects;

@end

@implementation Model {
    @private
    NSMutableArray *objects;
}

@synthesize status;
@synthesize creation;
@synthesize name;
@synthesize objects;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.creation = [NSDate date];
        self.objects = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)inName {
    self = [self init];
    if (self) {
        self.name = inName;
    }
    return self;
}

- (void)updateDroids:(int)inValue {
    [self willChangeValueForKey:@"countOfObjects"];
    if (inValue > [objects count]) {
        int theRemainder = inValue % 3;
        Droid *theDroid;
        
        if (theRemainder == 0) {
            theDroid = [[Droid alloc] initWithID:inValue];
        } else if (theRemainder == 1) {
            theDroid = [[ProtocolDroid alloc] initWithID:inValue];
        } else {
            theDroid = [[AstroDroid alloc] initWithID:inValue];
        }
        [self setStatus:[theDroid droidID]];
        [objects addObject:theDroid];
    } else if (inValue < [objects count]) {
        [objects removeLastObject];
    }
    [self didChangeValueForKey:@"countOfObjects"];
}

- (int)countOfObjects {
    return (int)[objects count];
}

- (void)listDroids {
    Wookie *theWookie = [[Wookie alloc] initWithName:@"Chewbacca"];
    
    [objects addObject:theWookie];
    
    NSLog(@"[+] Current droids (%d):", [self countOfObjects]);
    for (id anItem in objects) {
        [anItem sayName];
    }
}

@end
