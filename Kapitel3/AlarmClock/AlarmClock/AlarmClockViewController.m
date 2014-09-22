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
@property (weak, nonatomic) IBOutlet UISwitch *animationSwitch;
- (IBAction)switchAnimation:(UISwitch *)sender;

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

- (void)startAnimations {
    [self.clockViews makeObjectsPerformSelector:@selector(startAnimation)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self switchAnimation:self.animationSwitch];
}

- (void)stopAnimations {
    [self.clockViews makeObjectsPerformSelector:@selector(stopAnimation)];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (IBAction)switchAnimation:(UISwitch *)sender {
    if (sender.on) {
        [self startAnimations];
    } else {
        [self stopAnimations];
    }
}
@end
