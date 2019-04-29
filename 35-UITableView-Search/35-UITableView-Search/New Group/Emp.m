//
//  Emp.m
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import "Emp.h"

@implementation Emp
-(NSString*) birthDateString {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    return [formatter stringFromDate:self.birthDate];
}
@end
