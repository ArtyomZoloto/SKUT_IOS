//
//  AZCell.m
//  skut-22-touches
//
//  Created by Zolotoverkhov Artem on 01/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "AZCell.h"

@implementation AZCell

- (void)setIsWithChess:(BOOL)isWithChess{
    if (isWithChess){
        self.backgroundColor = [UIColor orangeColor];
    } else {
        self.backgroundColor = [UIColor blueColor];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
