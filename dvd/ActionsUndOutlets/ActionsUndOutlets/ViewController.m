//
//  ViewController.m
//  ActionsUndOutlets
//
//  Created by David Brünner on 25.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.switchStatusSwitch.isOn) {
        [self.switchStatusLabel setText:@"On"];
    } else {
        [self.switchStatusLabel setText:@"Off"];
    }
    [self.sliderValueLabel setText:[NSString stringWithFormat:@"%.2f",self.sliderStatusSlider.value]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"%@", [self.myTextField text]);
    [self.blackView setBackgroundColor:[UIColor greenColor]];
}

- (IBAction)switchSwitched:(UISwitch *)sender {
    if (sender.isOn) {
        [self.switchStatusLabel setText:@"On"];
    } else {
        [self.switchStatusLabel setText:@"Off"];
    }
}

- (IBAction)sliderMoved:(UISlider *)sender {
    [self.sliderValueLabel setText:[NSString stringWithFormat:@"%.2f", sender.value]];
}

@end
