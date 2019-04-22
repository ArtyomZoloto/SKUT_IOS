//
//  AZAnimal.m
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 20/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "AZAnimal.h"

@implementation AZAnimal
    -(void) move {
        switch (self.movingType){
            case Fly:
            NSLog( @"Flying!");
            break;
            case Run:
            NSLog(@"Runnig!");
            break;
            case Swim:
            NSLog(@"Swimming!");
            default:
            break;
        }
    }
@end
