//
//  AncestorTableViewController.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateFormViewController.h"
#import "DataManager.h"

@interface AncestorTableViewController : UITableViewController <CreateFormViewControllerDelegate>

@property (nonatomic,strong) CreateFormViewController *formVc;

- (void)presentCreateForm;
@end
