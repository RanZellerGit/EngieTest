//
//  ViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "Trip.h"
#import "Malfunction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createNewTrip:(id)sender
{
    [[DataManager sharedInstance] createTrip:[NSDate date] andEndTime:[NSDate date] andDistance:@(100) andDescrip:@"try"];
    
}

- (IBAction)fatch:(id)sender {
    NSArray *trips = [[DataManager sharedInstance] fetchAllTrips];
}

@end
