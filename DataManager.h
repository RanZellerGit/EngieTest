//
//  DataManager.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trip.h"
#import "Malfunction.h"

@interface DataManager : NSObject


+ (DataManager *)sharedInstance;


- (Trip *)createTrip:(NSDate *)startTime andEndTime:(NSDate *)endTime andDistance:(NSNumber *)distance andDescrip:(NSString *)description;

- (Trip *)editTrip;

- (NSArray *)fetchAllTrips;

- (void)DeleteTrip:(Trip*)trip;

@end
