//
//  EmpDao.h
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Emp.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmpFactory : NSObject
-(NSArray<Emp*>*) randomEmp: (NSInteger) count;
@end

NS_ASSUME_NONNULL_END
