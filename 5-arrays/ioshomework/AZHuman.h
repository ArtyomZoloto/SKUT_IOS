//
//  Human.h
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 18/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AZHumanMale){
    Man,
    Woman
};

@interface AZHuman : NSObject
    @property(strong, nonatomic) NSString *name;
    @property(assign, nonatomic) NSInteger height;
    @property(assign, nonatomic) CGFloat weight;
    @property(assign, nonatomic) AZHumanMale male;
    -(instancetype) initWithName: (NSString*)name height:(NSInteger) height weigth:(CGFloat) weigth male:(AZHumanMale) male;
    -(void) move;
    -(NSString*) getMaleString;
@end

NS_ASSUME_NONNULL_END
