//
//  tripsTableViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "tripsTableViewController.h"
#import "DataManager.h"
#import "CrateTripFormViewController.h"
#import "tripCellTableViewCell.h"
#import "Trip.h"

@interface tripsTableViewController()<CrateTripFormViewControllerDelegate, tripCellTableViewCellDelegate>

@property (nonatomic,strong) CrateTripFormViewController *formVc;
@property (nonatomic,strong) NSArray *trips;
@end

@implementation tripsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithTitle:@"create" style:UIBarButtonItemStylePlain target:self action:@selector(createNewTrip)];
    self.navigationItem.rightBarButtonItem = refreshButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNewTrip
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    self.formVc = [storyboard instantiateViewControllerWithIdentifier:@"crateTripFormViewController"];
    self.formVc.delegate = self;
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
     
 tripCellTableViewCell *cell = (tripCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"tripCell" forIndexPath:indexPath];
     
     cell.descriptionLabel.text = ((Trip *)self.trips[indexPath.row]).tripDescription;
     cell.delegate = self;
     cell.row = indexPath.row;
//
 return cell;
 }

#pragma CrateTripFormViewControllerDelecate

- (void)finishCreateTrip
{
    
    [self.tableView reloadData];
    [self.formVc dismissViewControllerAnimated:YES completion:nil];
}


- (void)editWasPressed:(NSUInteger)row
{
    
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
