//
//  AZAnimal.h
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 20/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSInteger, AZAnimalMovingType){
    Swim,
    Run,
    Fly
};

@interface AZAnimal : NSObject
    @property(strong, nonatomic) NSString* diet;
    @property(strong, nonatomic) NSString* name;
    @property(assign, nonatomic) AZAnimalMovingType movingType;
    -(void) move;
    -(void) speak;
@end

NS_ASSUME_NONNULL_END
