//
//  EmpDao.m
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "EmpDao.h"
#import "EmpFactory.h"

@interface EmpDao ()
@end

@implementation EmpDao
- (instancetype)init
{
    self = [super init];
    if (self) {
        EmpFactory *f = [EmpFactory new];
        self.employees = [f randomEmp:50000];
    }
    return self;
}

- (NSArray<EmpBirthsdayBlock*>*) employeesByBirthsdays {

    if (!_employeesByBirthsdays)
    {
        NSMutableDictionary<NSString*, NSMutableArray<Emp*>*> *dictionary = [NSMutableDictionary new];
        for (Emp *emp in self.employees){
            NSDateFormatter *df = [NSDateFormatter new];
            [df setDateFormat:@"MM"];
            NSString *monthString = [df stringFromDate:emp.birthDate];
            NSMutableArray<Emp*> *arr = dictionary[monthString];
            if (arr){
            } else {
                arr = [NSMutableArray new];
                [dictionary setValue:arr forKey:monthString];
            }
            [arr addObject:emp];
        }
        
        NSMutableArray<EmpBirthsdayBlock*>* result = [NSMutableArray new];
        for (NSString *string in dictionary.allKeys){
            EmpBirthsdayBlock *block = [EmpBirthsdayBlock new];
            block.dateString = string;
            block.employees = dictionary[string];
            [result addObject:block];
        }
        
        [result sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            EmpBirthsdayBlock* first = obj1;
            EmpBirthsdayBlock* second = obj2;
            return [first.dateString compare:second.dateString];
        }];
        _employeesByBirthsdays = [NSArray arrayWithArray:result];
    }
    return _employeesByBirthsdays;
    
}

@end
