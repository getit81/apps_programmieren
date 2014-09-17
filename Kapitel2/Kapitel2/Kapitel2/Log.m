//
//  Log.m
//  Kapitel2
//
//  Created by David Brünner on 17.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "Log.h"

@implementation Log

- (void)logToConsole:(NSString *)theMessage {
    NSLog(@"[+] %@.%@: %@", self, NSStringFromSelector(_cmd), theMessage);
    [self.delegate logDidFinishLogging:self];
}

@end
