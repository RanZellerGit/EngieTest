//
//  DataManager.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "DataManager.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Trip+CoreDataProperties.h"


@interface DataManager()

@property (nonatomic, strong) NSManagedObjectContext *moc;

@end
@implementation DataManager


- (id)init
{
    self = [super init];
    if (self)
    {
        _moc = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) managedObjectContext];
    }
    return self;
}

+ (DataManager *)sharedInstance
{
    static DataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataManager alloc] init];
    });
    return sharedInstance;
}

- (Trip *)createTrip:(NSDate *)startTime andEndTime:(NSDate *)endTime andDistance:(NSNumber *)distance andDescrip:(NSString *)description
{
    Trip *trip = [NSEntityDescription
                                       insertNewObjectForEntityForName:@"Trip"
                  inManagedObjectContext:self.moc];
    trip.startTime = startTime;
    trip.endTime = endTime;
    trip.tripDescription = description;
    trip.distance = distance;
    
    NSError *error;
    if (![self.moc save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    else
    {
        return trip;
    }
    return nil;
}

- (void)editTrip:(Trip *)trip
{
    
}

- (NSArray *)fetchAllTrips
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Trip" inManagedObjectContext:self.moc];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [self.moc executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects;
}

- (void)DeleteTrip:(Trip*)trip
{
    
}
@end
