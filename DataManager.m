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
#import "Malfunction+CoreDataProperties.h"


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

- (Trip *)createTrip:(NSDate *)startTime andEndTime:(NSDate *)endTime andDistance:(NSNumber *)distance andDescrip:(NSString *)description andMalfunction:(NSSet *)malfunctions;
{
    Trip *trip = [NSEntityDescription
                                       insertNewObjectForEntityForName:@"Trip"
                  inManagedObjectContext:self.moc];
    trip.startTime = startTime;
    trip.endTime = endTime;
    trip.tripDescription = description;
    trip.distance = distance;
    trip.malfunctions = malfunctions;
    
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

- (Malfunction *)createMalfunction:(NSDate *)time andSymptoms:(NSString *)symptoms andTrips:(NSSet *)trips
{
    Malfunction *malfunction = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Malfunction"
                  inManagedObjectContext:self.moc];
    malfunction.time = time;
    malfunction.symptoms = symptoms;
    
    [malfunction addTrips:trips];
    
    NSError *error;
    if (![self.moc save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    else
    {
        return malfunction;
    }
    return nil;
}

- (void)edit;
{
    NSError *error;
    if (![self.moc save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void)deleteObject:(NSManagedObject*)object
{
    [self.moc deleteObject:object];
    NSError *error;
    if (![self.moc save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
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

- (NSArray *)fetchAllMalfunction
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Malfunction" inManagedObjectContext:self.moc];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [self.moc executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects;
}
@end
