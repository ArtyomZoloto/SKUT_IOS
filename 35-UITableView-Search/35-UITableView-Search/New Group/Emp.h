//
//  Emp.h
//  35-UITableView-Search
//
//  Created by iMac on 29/04/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Emp : NSObject
@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *surName;
@property(copy, nonatomic) NSDate *birthDate;
@property(strong, nonatomic) NSString *birthDateString;
@end

NS_ASSUME_NONNULL_END
