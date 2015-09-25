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


- (Trip *)createTrip:(NSDate *)startTime andEndTime:(NSDate *)endTime andDistance:(NSNumber *)distance andDescrip:(NSString *)description andMalfunction:(NSSet *)malfunctions;

- (Malfunction *)createMalfunction:(NSDate *)time andSymptoms:(NSString *)symptoms andTrips:(NSSet *)trips;

- (void)edit;
- (void)deleteObject:(NSManagedObject*)object;

- (NSArray *)fetchAllTrips;
- (NSArray *)fetchAllMalfunction;




@end
