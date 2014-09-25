//
//  ViewController.h
//  ActionsUndOutlets
//
//  Created by David Brünner on 25.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *switchStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchStatusSwitch;
@property (weak, nonatomic) IBOutlet UISlider *sliderStatusSlider;

- (IBAction)buttonPressed:(UIButton *)sender;
- (IBAction)switchSwitched:(UISwitch *)sender;
- (IBAction)sliderMoved:(UISlider *)sender;

@end
