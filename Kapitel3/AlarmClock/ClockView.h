//
//  ClockView.h
//  AlarmClock
//
//  Created by David Brünner on 18.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockView : UIView

@property (nonatomic, strong) NSDate *time;
@property (nonatomic, strong) NSCalendar *calendar;

@end
