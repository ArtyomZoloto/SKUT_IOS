//
//  AZDog.m
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 20/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "AZDog.h"

@implementation AZDog
    -(void) speak {
        NSLog(@"Bow-Wow!");
    }
    -(void) move {
        [super move];
    }
    
    -(NSString*) breed {
        switch (_breed){
            case Dalmatian:
            return @"Dalmatian";
            break;
            case Poodle:
            return @"Poodle";
            break;
            case Shepherd:
            return @"Shepherd";
            break;
            default:
            break;
        }
    }
@end
