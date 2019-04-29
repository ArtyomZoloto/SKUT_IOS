//
//  EmpDao.m
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "EmpFactory.h"
@interface EmpFactory ()
@property (strong, nonatomic) NSDate* birthDate;
@property (strong, nonatomic) NSArray *names;
@property (strong, nonatomic) NSArray *surNames;
@end
@implementation EmpFactory

-(NSArray<Emp*>*) randomEmp: (NSInteger) count{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < count; i++){
        Emp *emp = [Emp new];
        emp.name = self.names[arc4random() % self.names.count];
        emp.surName = self.surNames[arc4random() % self.surNames.count];
        emp.birthDate = [self generateRandomDateWithinDaysBeforeToday: 365*60];
        [arr addObject:emp];
    }
    return [NSArray arrayWithArray:arr];
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

-(NSArray*) names {
    return @[@"Josue",
             @"Duane",
             @"Chau",
             @"Cammie",
             @"Sophie",
             @"Michale",
             @"Shad",
             @"Aron",
             @"Cherryl",
             @"Faye",
             @"Maegan",
             @"Rosalia",
             @"Aida",
             @"Rosie",
             @"Lien",
             @"Jessia",
             @"Milagros",
             @"Viva",
             @"Samuel",
             @"Terra"
             ];
}

-(NSArray*) surNames {
    return @[@"Johns",
             @"McCenzie",
             @"Volmer",
             @"Scamer",
             @"Brown",
             @"Frane",
             @"Shvalz",
             @"Corn",
             @"Zohye",
             @"Merell",
             @"Wans",
             @"Laida",
             @"Kukatake",
             @"Suma",
             @"Loisen",
             @"Mytou",
             @"Biork",
             @"Yoshen",
             @"Remark",
             @"Souer"
             ];
}

@end
