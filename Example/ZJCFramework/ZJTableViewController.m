//
//  ZJTableViewController.m
//  zjcdFramework_Example
//
//  Created by alan on 2020/11/14.
//  Copyright © 2020 Alan. All rights reserved.
//

#import "ZJTableViewController.h"
#import "ZJNetWorkingController.h"

@interface ZJTableViewController ()

@end

@implementation ZJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.item == 0) {
        ZJNetWorkingController *controller = [[ZJNetWorkingController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        return;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
