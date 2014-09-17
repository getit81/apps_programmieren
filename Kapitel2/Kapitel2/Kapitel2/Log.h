//
//  Log.h
//  Kapitel2
//
//  Created by David Brünner on 17.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LogDelegate;

@interface Log : NSObject

@property (nonatomic, weak) id<LogDelegate> delegate;

- (void)logToConsole:(NSString *)theMessage;

@end

@protocol LogDelegate <NSObject>

- (void)logDidFinishLogging:(Log *)inLog;

@end
