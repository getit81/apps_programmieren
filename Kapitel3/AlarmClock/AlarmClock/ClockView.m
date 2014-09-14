//
//  ClockView.m
//  AlarmClock
//
//  Created by David Brünner on 14.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "ClockView.h"

@implementation ClockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    CGRect theBounds = self.bounds;
    CGContextSaveGState(theContext);
    CGContextSetRGBFillColor(theContext, 1.0, 1.0, 1.0, 1.0);
    CGContextAddEllipseInRect(theContext, theBounds);
    CGContextFillPath(theContext);
    CGContextRestoreGState(theContext);
}

@end
