//
//  AddCell.m
//  41-CoreData
//
//  Created by igor on 10/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

#import "AddCell.h"

@implementation AddCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textField = [[UITextField alloc] initWithFrame:self.bounds];
    [super setAccessoryView:self.textField];

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
