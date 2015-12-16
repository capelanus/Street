//
//  NumbersCell.m
//  Street
//
//  Created by Daniel López on 04/06/14.
//  Copyright (c) 2014 DaniLG.Peru. All rights reserved.
//

#import "NumbersCell.h"

@implementation NumbersCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
