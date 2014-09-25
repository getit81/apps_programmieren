//
//  TableViewController.m
//  UITableViewController
//
//  Created by David Brünner on 25.09.14.
//  Copyright (c) 2014 David Brünner. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataArray = @[@"Hallo", @"Tabelle", @"Wie geht's?"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
    [cell.textLabel setText:self.dataArray[indexPath.row]];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        DetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        detailVC.detailText = self.dataArray[path.row];
    }
}

@end
