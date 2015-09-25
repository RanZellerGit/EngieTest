//
//  CrateTripFormViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "CreateFormViewController.h"
#import "DataManager.h"

@interface CreateFormViewController ()

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) NSArray *eventsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreateFormViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.type) {
        case TripFromType:
            self.distanceLabel.text = @"Distance";
            break;
        case MalfunctionFormType:
        {
            self.distanceLabel.text = @"Symptoms";
            [self.tripDescription removeFromSuperview];
            [self.descriptionLabel removeFromSuperview];
            break;
        }
        default:
            break;
    }
}


- (IBAction)submit:(id)sender
{
    NSArray *selectedCells = [self.tableView indexPathsForSelectedRows];
    
    NSMutableSet *events = [[NSMutableSet alloc]init];
    for (NSIndexPath * indexPath in selectedCells)
    {
        [events addObject:self.eventsArray[indexPath.row]];
    }
    switch (self.type) {
        case TripFromType:
            [[DataManager sharedInstance]createTrip:[NSDate date] andEndTime:[NSDate date]  andDistance:@([self.distance.text integerValue]) andDescrip:self.tripDescription.text andMalfunction:[events copy]];;
            break;
        case MalfunctionFormType:
            [[DataManager sharedInstance] createMalfunction:[NSDate date] andSymptoms:self.distance.text andTrips:[events copy]];
            break;
        default:
            break;
    }
    
    [self.delegate finishCreate];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    tableView.allowsMultipleSelection = YES;
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (self.type) {
        case TripFromType:
            self.eventsArray = [[DataManager sharedInstance] fetchAllMalfunction];
            break;
        case MalfunctionFormType:
            self.eventsArray = [[DataManager sharedInstance] fetchAllTrips];
            break;
        default:
            break;
    }
    return [self.eventsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormCell" forIndexPath:indexPath];
    
    switch (self.type) {
        case TripFromType:
            cell.textLabel.text = ((Malfunction *)self.eventsArray[indexPath.row]).symptoms;
            break;
        case MalfunctionFormType:
            cell.textLabel.text = ((Trip*)self.eventsArray[indexPath.row]).tripDescription;
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}
@end
