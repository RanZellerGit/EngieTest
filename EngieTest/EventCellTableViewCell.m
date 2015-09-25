//
//  tripCellTableViewCell.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "EventCellTableViewCell.h"
@interface EventCellTableViewCell()

@end
@implementation EventCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)editPressed:(id)sender
{
    [self.delegate editWasPressed:self.row];
}

- (IBAction)deletePressed:(id)sender
{
    [self.delegate deleteWasPressed:self.row];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
