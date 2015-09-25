//
//  CrateTripFormViewController.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateFormViewControllerDelegate;

typedef enum {
    TripFromType,
    MalfunctionFormType
}FormType;

@interface CreateFormViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *tripDescription;
@property (weak, nonatomic) IBOutlet UITextField *distance;
@property (nonatomic) FormType type;

@property (nonatomic, weak) id<CreateFormViewControllerDelegate> delegate;


// Abstruct funcitons
- (IBAction)submit:(id)sender;

@end

@protocol CreateFormViewControllerDelegate <NSObject>

- (void)finishCreate;

@end
