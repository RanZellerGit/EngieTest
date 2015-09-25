//
//  CrateTripFormViewController.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CrateTripFormViewControllerDelegate;

@interface CrateTripFormViewController : UIViewController

@property (nonatomic, weak) id<CrateTripFormViewControllerDelegate> delegate;

@end

@protocol CrateTripFormViewControllerDelegate <NSObject>

- (void)finishCreateTrip;

@end
