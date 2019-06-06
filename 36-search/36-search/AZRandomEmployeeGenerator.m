//
//  AZRandomGenerator.m
//  36-search
//
//  Created by igor on 29/04/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

#import "AZRandomEmployeeGenerator.h"
@interface AZRandomEmployeeGenerator ()
@property (strong, nonatomic) NSArray<NSString*>* names;
@property (strong, nonatomic) NSArray<NSString*>* surNames;
@end



@implementation AZRandomEmployeeGenerator

-(AZEmployee*) randomEmployee{
    AZEmployee *emp = [AZEmployee new];
    emp.name = self.names[arc4random() % self.names.count];
    emp.surName = self.surNames[arc4random() % self.surNames.count];
    emp.birthDate = [self generateRandomDateWithinDaysBeforeToday:365*50];
    return emp;
}

-(NSArray<NSString*>*) names {
    return @[@"Melisa",
             @"Abdul",
             @"Donny",
             @"Rudolph",
             @"Savannah",
             @"Lola",
             @"George",
             @"Jenny",
             @"Marcelino",
             @"Devin",
             @"Concetta",
             @"Andy",
             @"Riley",
             @"Bobby",
             @"Elma"];
}

-(NSArray<NSString*>*) surNames
{
    return @[@"Ochoa",
             @"Richards",
             @"Ewing",
             @"Skinner",
             @"Sheppard",
             @"Bowman",
             @"Lam",
             @"Frost"];
}


- (NSDate *) generateRandomDateWithinDaysBeforeToday:(NSInteger)days
{
    int r1 = arc4random_uniform(days);
    int r2 = arc4random_uniform(23);
    int r3 = arc4random_uniform(59);
    
    NSDate *today = [NSDate new];
    NSCalendar *gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setDay:(r1*-1)];
    [offsetComponents setHour:r2];
    [offsetComponents setMinute:r3];
    
    NSDate *rndDate1 = [gregorian dateByAddingComponents:offsetComponents
                                                  toDate:today options:0];
    
    return rndDate1;
}
@end
