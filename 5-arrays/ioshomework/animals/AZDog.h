//
//  AZDog.h
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 20/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AZAnimal.h"

typedef NS_ENUM(NSInteger, AZDogBreed){
    Dalmatian,
    Poodle,
    Shepherd
};

NS_ASSUME_NONNULL_BEGIN

@interface AZDog : AZAnimal
    @property(assign, nonatomic) AZDogBreed breed;
    -(void) speak;
@end

NS_ASSUME_NONNULL_END
