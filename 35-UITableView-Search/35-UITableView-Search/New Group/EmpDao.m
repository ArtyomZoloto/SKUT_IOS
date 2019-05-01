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

-(NSArray<EmpBirthsdayBlock*>*) dataWithFilter: (NSString*) filteR{
    NSString *filter = [filteR lowercaseString];
    if (!filter || filter.length == 0){
        return self.employeesByBirthsdays;
    }
    NSMutableArray<EmpBirthsdayBlock*> *arr = [NSMutableArray new];
    for (EmpBirthsdayBlock *block in self.employeesByBirthsdays){
        NSMutableArray<Emp*> *newEmps = [NSMutableArray new];
        for (Emp *emp in block.employees){
            NSString* name = [emp.name lowercaseString];
            NSString* surName = [emp.surName lowercaseString];
            if ([name rangeOfString:filter].location != NSNotFound){
                [newEmps addObject:emp];
            } else if ([surName rangeOfString:filter].location != NSNotFound) {
                [newEmps addObject:emp];
            }
        }
        if (newEmps.count != 0){
            block.employees = [NSArray arrayWithArray:newEmps];
        [arr addObject:block];
        }
    }
    return [NSArray arrayWithArray:arr];
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
        
        
        for (EmpBirthsdayBlock *block in result){
            NSArray<Emp*>* sorted;
            sorted = [block.employees sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                Emp *emp1 = obj1;
                Emp *emp2 = obj2;
                NSComparisonResult r= [emp1.name compare:emp2.name];
                if (r != NSOrderedSame){
                    return r;
                }
                r = [emp1.surName compare:emp2.surName];
                if (r != NSOrderedSame){
                    return r;
                }
                return [emp1.birthDate compare:emp2.birthDate];
            }];
            block.employees = sorted;
        }
        _employeesByBirthsdays = [NSArray arrayWithArray:result];
    }
    return _employeesByBirthsdays;
    
}

@end
