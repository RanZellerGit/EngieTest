//
//  Malfunction+CoreDataProperties.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Malfunction.h"

NS_ASSUME_NONNULL_BEGIN

@interface Malfunction (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *symptoms;
@property (nullable, nonatomic, retain) NSDate *time;
@property (nullable, nonatomic, retain) NSSet<Trip *> *trips;

@end

@interface Malfunction (CoreDataGeneratedAccessors)

- (void)addTripsObject:(Trip *)value;
- (void)removeTripsObject:(Trip *)value;
- (void)addTrips:(NSSet<Trip *> *)values;
- (void)removeTrips:(NSSet<Trip *> *)values;

@end

NS_ASSUME_NONNULL_END
