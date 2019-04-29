//
//  EmpDao.h
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Emp.h"
#import "EmpBirthsdayBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmpDao : NSObject
@property (strong, nonatomic) NSArray<Emp*> *employees;
@property (strong, nonatomic) NSArray<EmpBirthsdayBlock*>* employeesByBirthsdays;
@end

NS_ASSUME_NONNULL_END
