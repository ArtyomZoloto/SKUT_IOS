//
//  AZUser+CoreDataProperties.h
//  41-CoreData
//
//  Created by igor on 10/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//
//

#import "AZUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface AZUser (CoreDataProperties)

+ (NSFetchRequest<AZUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *surname;

@end

NS_ASSUME_NONNULL_END
