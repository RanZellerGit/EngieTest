//
//  AncestorTableViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "AncestorTableViewController.h"

@interface AncestorTableViewController ()

@end

@implementation AncestorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithTitle:@"create" style:UIBarButtonItemStylePlain target:self action:@selector(presentCreateForm)];
    self.navigationItem.rightBarButtonItem = refreshButton;
}

- (void)presentCreateForm
{
    // abstruct fucntion
    return;
}

#pragma CrateTripFormViewControllerDelecate

- (void)finishCreate
{
    
    [self.tableView reloadData];
    [self.formVc dismissViewControllerAnimated:YES completion:nil];
}

@end
