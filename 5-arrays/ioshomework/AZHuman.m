//
//  Human.m
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 18/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "AZHuman.h"

@implementation AZHuman
    -(instancetype) initWithName: (NSString*)name height:(NSInteger) height weigth:(CGFloat) weigth male:(AZHumanMale) male{
        self = [super init];
        if (self){
            self.name = name;
            self.height = height;
            self.weight = weigth;
            self.male = male;}
        return self;
    }
    
    -(void)move{
        NSLog(@"Я человек и двигаюсь");
    }
    
    -(NSString*) getMaleString{
        switch (self.male){
            case Man:
            return @"Man";
            break;
            case Woman:
            return @"Woman";
            break;
            default:
            break;
        }
    }
    
    @end
