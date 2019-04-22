//
//  AZProger.h
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 19/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZHuman.h"
#import "Worker.h"

typedef NS_ENUM (NSInteger, AZProgramLanguage){
    C,
    Cpp,
    Java,
    Swift
};

NS_ASSUME_NONNULL_BEGIN

@interface AZProger : AZHuman <Worker>
    @property(assign, nonatomic) NSInteger salary;
    @property(assign, nonatomic) AZProgramLanguage language;
    -(void) work;
    -(NSString*) getProgramLanguageString;
@end

NS_ASSUME_NONNULL_END
