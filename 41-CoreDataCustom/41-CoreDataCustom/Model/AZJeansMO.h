//
//  AZJeansMO.h
//  41-CoreDataCustom
//
//  Created by iMac on 18/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@class AZFriendMO;

@interface AZJeansMO : NSManagedObject
@property (nullable, nonatomic, retain) NSString *brand;
@property (nullable, nonatomic, retain) NSDecimalNumber *size;
@property (nullable, nonatomic, retain) AZFriendMO *owner;
@end

NS_ASSUME_NONNULL_END
