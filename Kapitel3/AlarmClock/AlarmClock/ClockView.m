//
//  ClockView.m
//  AlarmClock
//
//  Created by David Brünner on 14.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "ClockView.h"

@interface ClockView ()

@property (nonatomic, strong) NSTimer *timer;

- (void)startAnimation;
- (void)stopAnimation;

@end

@implementation ClockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.calendar = [NSCalendar currentCalendar];
        self.time = [NSDate date];
    }
    return self;
}

/// Aufruf aus Storyboard
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.calendar = [NSCalendar currentCalendar];
        self.time = [NSDate date];
    }
    [self startAnimation];
    return self;
}

- (void)dealloc {
    [self stopAnimation];
}

//// Wird nach der Initialisierung aufgefufen
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    self.calendar = [NSCalendar currentCalendar];
//    self.time = [NSDate date];;
//}

/// Berechnet die Koordinaten des Mittelpunktes
- (CGPoint)midPoint {
    CGRect theBounds = self.bounds;
    return CGPointMake(CGRectGetMidX(theBounds), CGRectGetMidY(theBounds));
}

/// Berechnet Kooridnaten eines Punktes ausgehend vom Mittelpunkt
- (CGPoint)pointWithRadius:(CGFloat)inRadius angle:(CGFloat)inAngle {
    CGPoint theCenter = [self midPoint];
    return CGPointMake(theCenter.x + inRadius * sin(inAngle), theCenter.y - inRadius * cos(inAngle));
}

/// Zeichnet das Ziffernblatt
- (void)drawRect:(CGRect)rect
{
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    CGRect theBounds = self.bounds;
    CGFloat theRadius = CGRectGetWidth(theBounds) / 2.0;
    
    // Zeichnet den Kreis
    CGContextSaveGState(theContext);
    CGContextSetRGBFillColor(theContext, 1.0, 1.0, 1.0, 1.0);
    CGContextAddEllipseInRect(theContext, theBounds);
    CGContextFillPath(theContext);
    CGContextAddEllipseInRect(theContext, theBounds);
    CGContextClip(theContext);
    CGContextSetRGBStrokeColor(theContext, 0.25, 0.25, 0.25, 1.0);
    CGContextSetRGBFillColor(theContext, 0.25, 0.25, 0.25, 1.0);
    CGContextSetLineWidth(theContext, theRadius / 20.0);
    CGContextSetLineCap(theContext, kCGLineCapRound);
    
    // Zeichnet die Zeiteinteilungen
    for (NSInteger i = 0; i < 60; ++i) {
        CGFloat theAngle = i * M_PI / 30.0;
        
        if (i % 5 == 0) {
            CGFloat theInnerRadius = theRadius * ((i % 15 == 0) ? 0.7 : 0.8);
            CGPoint theInnerPoint = [self pointWithRadius:theInnerRadius angle:theAngle];
//            NSLog(@"Für i = %d (theAngle: %.2f): theInnerRadius: %.2f - theInnerPoint: %.2f;%2f", i, theAngle, theInnerRadius, theInnerPoint.x, theInnerPoint.y);
            CGPoint theOuterPoint = [self pointWithRadius:theRadius angle:theAngle];
//            NSLog(@"Für i = %d (theAngle: %.2f): theRadius: %.2f - theOuterPoint: %.2f;%2f\n\n", i, theAngle, theRadius, theOuterPoint.x, theOuterPoint.y);
            
            CGContextMoveToPoint(theContext, theInnerPoint.x, theInnerPoint.y);
            CGContextAddLineToPoint(theContext, theOuterPoint.x, theOuterPoint.y);
            CGContextStrokePath(theContext);
        } else {
            CGPoint thePoint = [self pointWithRadius:theRadius * 0.95 angle:theAngle];
            CGContextAddArc(theContext, thePoint.x, thePoint.y, theRadius / 40.0, 0.0, 2 * M_PI, YES);
            CGContextFillPath(theContext);
        }
    }
    [self drawClockHands];
    CGContextRestoreGState(theContext);
}

/// Zeichnet die Zeiger der Uhr
- (void)drawClockHands {
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    CGPoint theCenter = [self midPoint];
    CGFloat theRadius = CGRectGetWidth(self.bounds) / 2.0;
    NSDateComponents *theComponents = [self.calendar components:NSHourCalendarUnit
                                       | NSMinuteCalendarUnit
                                       | NSSecondCalendarUnit
                                                       fromDate:self.time];
    CGFloat theSecond = theComponents.second * M_PI / 30.0;
    CGFloat theMinute = theComponents.minute * M_PI / 30.0;
    CGFloat theHour = (theComponents.hour + theComponents.minute / 60.0) * M_PI / 6.0;
    
    // Stundenzeiger zeichnen
    CGPoint thePoint = [self pointWithRadius:theRadius * 0.7 angle:theHour];
    CGContextSetRGBStrokeColor(theContext, 0.25, 0.25, 0.25, 1.0);
    CGContextSetLineWidth(theContext, theRadius / 20.0);
    CGContextSetLineCap(theContext, kCGLineCapButt);
    CGContextMoveToPoint(theContext, theCenter.x, theCenter.y);
    CGContextAddLineToPoint(theContext, thePoint.x, thePoint.y);
    CGContextStrokePath(theContext);
    
    // Minutenzeiger zeichenen
    thePoint = [self pointWithRadius:theRadius * 0.9 angle:theMinute];
    CGContextSetLineWidth(theContext, theRadius / 40.0);
    CGContextMoveToPoint(theContext, theCenter.x, theCenter.y);
    CGContextAddLineToPoint(theContext, thePoint.x, thePoint.y);
    CGContextStrokePath(theContext);
    
    // Sekundenzeiger zeichnen
    thePoint = [self pointWithRadius:theRadius * 0.95 angle:theSecond];
    CGContextSetLineWidth(theContext, theRadius / 80.0);
    CGContextSetRGBStrokeColor(theContext, 1.0, 0.0, 0.0, 1.0);
    CGContextMoveToPoint(theContext, theCenter.x, theCenter.y);
    CGContextAddLineToPoint(theContext, thePoint.x, thePoint.y);
    CGContextStrokePath(theContext);
}

- (void)startAnimation {
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    }
}

- (void)stopAnimation {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)updateTimer:(NSTimer *)inTimer {
    self.time = [NSDate date];
    [self setNeedsDisplay];
}

@end
