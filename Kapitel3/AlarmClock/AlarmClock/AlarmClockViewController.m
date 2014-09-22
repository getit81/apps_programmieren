//
//  AlarmClockViewController.m
//  AlarmClock
//
//  Created by David Brünner on 14.09.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AlarmClockViewController.h"
#import "ClockView.h"

@interface AlarmClockViewController ()

@property (weak, nonatomic) IBOutlet ClockView *clockView;
@property (strong, nonatomic) IBOutletCollection(ClockView) NSArray *clockViews;

@end

@implementation AlarmClockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (ClockView *theView in self.clockViews) {
        [theView startAnimation];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    for (ClockView *theView in self.clockViews) {
        [theView stopAnimation];
    }
    [super viewWillDisappear:animated];
}
@end
