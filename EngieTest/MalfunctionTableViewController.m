//
//  MalfunctionTableViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "MalfunctionTableViewController.h"
#import "EventCellTableViewCell.h"
#import "Malfunction.h"
#import "TripsConnectToMalfunctionTableViewController.h"

@interface MalfunctionTableViewController ()<EventCellTableViewCellDelegate>

@property (nonatomic,strong) NSArray *malfunctions;

@end

@implementation MalfunctionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)presentCreateForm
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    self.formVc = [storyboard instantiateViewControllerWithIdentifier:@"createFormViewController"];
    self.formVc.delegate = self;
    self.formVc.type = MalfunctionFormType;
    [self presentViewController:self.formVc animated:NO completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    self.malfunctions = [[DataManager sharedInstance] fetchAllMalfunction];
    return [self.malfunctions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EventCellTableViewCell *cell = (EventCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MalfunctionCell" forIndexPath:indexPath];
    
    cell.descriptionLabel.text = ((Malfunction *)self.malfunctions[indexPath.row]).symptoms;
    cell.delegate = self;
    cell.row = indexPath.row;
    
    return cell;
}

- (void)editWasPressed:(NSUInteger)row
{
    
}

- (void)deleteWasPressed:(NSUInteger)row
{
    [[DataManager sharedInstance]deleteObject:self.malfunctions[row]];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(EventCellTableViewCell *)cell
{
    TripsConnectToMalfunctionTableViewController *vc = (TripsConnectToMalfunctionTableViewController *)[segue destinationViewController];
    vc.malfunction = ((Malfunction *)self.malfunctions[cell.row]);
}
@end
