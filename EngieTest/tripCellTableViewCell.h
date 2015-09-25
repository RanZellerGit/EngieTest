//
//  tripCellTableViewCell.h
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tripCellTableViewCellDelegate

- (void)editWasPressed:(NSUInteger)row;

@end
@interface tripCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) id<tripCellTableViewCellDelegate> delegate;
@property (nonatomic) NSUInteger row;
@end
