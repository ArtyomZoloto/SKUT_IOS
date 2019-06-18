//
//  AZFriendMO.h
//  41-CoreDataCustom
//
//  Created by igor on 10/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@class AZJeansMO;

@interface AZFriendMO : NSManagedObject
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDecimalNumber *age;
@property (nullable, nonatomic, retain) AZJeansMO *jeans;
@end

NS_ASSUME_NONNULL_END
