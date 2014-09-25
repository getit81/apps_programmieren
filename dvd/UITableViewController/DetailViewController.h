//
//  DetailViewController.h
//  UITableViewController
//
//  Created by David Brünner on 25.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSString *detailText;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
