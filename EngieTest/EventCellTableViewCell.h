//
//  tripCellTableViewCell.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventCellTableViewCellDelegate

- (void)editWasPressed:(NSUInteger)row;

- (void)deleteWasPressed:(NSUInteger)row;

@end
@interface EventCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) id<EventCellTableViewCellDelegate> delegate;
@property (nonatomic) NSUInteger row;
@end
