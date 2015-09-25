//
//  tripsTableViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "TripsTableViewController.h"
#import "DataManager.h"
#import "CreateFormViewController.h"
#import "EventCellTableViewCell.h"
#import "Trip.h"
#import "MalfunctionConnectToTripTableViewController.h"

@interface TripsTableViewController()<EventCellTableViewCellDelegate>

@property (nonatomic,strong) NSArray *trips;
@end

@implementation TripsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

}

- (void)presentCreateForm
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    self.formVc = [storyboard instantiateViewControllerWithIdentifier:@"createFormViewController"];
    self.formVc.delegate = self;
    self.formVc.type = TripFromType;
    [self presentViewController:self.formVc animated:NO completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    self.trips = [[DataManager sharedInstance] fetchAllTrips];
    return [self.trips count];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
 EventCellTableViewCell *cell = (EventCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"tripCell" forIndexPath:indexPath];
     
     cell.descriptionLabel.text = ((Trip *)self.trips[indexPath.row]).tripDescription;
     cell.delegate = self;
     cell.row = indexPath.row;

 return cell;
 }


- (void)editWasPressed:(NSUInteger)row
{
    
}

- (void)deleteWasPressed:(NSUInteger)row
{
    [[DataManager sharedInstance]deleteObject:self.trips[row]];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(EventCellTableViewCell *)cell
{
    MalfunctionConnectToTripTableViewController *vc = (MalfunctionConnectToTripTableViewController *)[segue destinationViewController];
    vc.trip = ((Trip *)self.trips[cell.row]);
}
@end
