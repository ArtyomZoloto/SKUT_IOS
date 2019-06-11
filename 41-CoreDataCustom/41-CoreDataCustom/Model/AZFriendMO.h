//
//  AZFriendMO.h
//  41-CoreDataCustom
//
//  Created by igor on 10/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface AZFriendMO : NSManagedObject
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDecimalNumber *age;
@end

NS_ASSUME_NONNULL_END
