//
//  CrateTripFormViewController.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "CrateTripFormViewController.h"
#import "DataManager.h"

@interface CrateTripFormViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tripDescription;
@property (weak, nonatomic) IBOutlet UITextField *distance;

@end

@implementation CrateTripFormViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)createTrip:(id)sender
{
    [[DataManager sharedInstance]createTrip:[NSDate date] andEndTime:[NSDate date]  andDistance:@([self.distance.text integerValue]) andDescrip:self.tripDescription.text];
    
    [self.delegate finishCreateTrip];
}

@end
