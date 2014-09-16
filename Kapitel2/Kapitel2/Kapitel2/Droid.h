//
//  Droid.h
//  Kapitel2
//
//  Created by David Brünner on 16.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Droid : UIView

@property (copy) NSString *droidID;

- (id)initWithID:(int)inID;

@end
