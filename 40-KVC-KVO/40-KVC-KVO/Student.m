//
//  Student.m
//  40-KVC-KVO
//
//  Created by iMac on 02/06/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void) reset {
    [self willChangeValueForKey:@"firstName"];
    _firstName = nil;
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = nil;
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = nil;
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"gender"];
    _gender = 0;
    [self didChangeValueForKey:@"gender"];
    
    [self willChangeValueForKey:@"grade"];
    _grade = 0;
    [self didChangeValueForKey:@"grade"];
}

@end
