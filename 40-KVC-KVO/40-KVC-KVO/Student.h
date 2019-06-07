//
//  Student.h
//  40-KVC-KVO
//
//  Created by iMac on 02/06/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Gender){
    Male,
    Female
};

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
@property (copy, nonatomic)   NSString* firstName;
@property (copy, nonatomic)   NSString* lastName;
@property (strong, nonatomic) NSDate* dateOfBirth;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) NSInteger grade;
@property (weak, nonatomic) Student* friend;

-(void) reset;
@end

NS_ASSUME_NONNULL_END
