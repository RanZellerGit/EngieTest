//
//  tripCellTableViewCell.m
//  EngieTest
//
//  Created by Ran Zeller on 9/25/15.
//  Copyright © 2015 ran. All rights reserved.
//

#import "tripCellTableViewCell.h"
@interface tripCellTableViewCell()

@end
@implementation tripCellTableViewCell

- (IBAction)editPressed:(id)sender
{
    [self.delegate editWasPressed:self.row];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
