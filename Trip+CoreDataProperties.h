//
//  Trip+CoreDataProperties.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@interface Trip (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *startTime;
@property (nullable, nonatomic, retain) NSDate *endTime;
@property (nullable, nonatomic, retain) NSNumber *distance;
@property (nullable, nonatomic, retain) NSString *tripDescription;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *malfunctions;

@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addMalfunctionsObject:(NSManagedObject *)value;
- (void)removeMalfunctionsObject:(NSManagedObject *)value;
- (void)addMalfunctions:(NSSet<NSManagedObject *> *)values;
- (void)removeMalfunctions:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
