//
//  AZUser+CoreDataProperties.m
//  41-CoreData
//
//  Created by igor on 10/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//
//

#import "AZUser+CoreDataProperties.h"

@implementation AZUser (CoreDataProperties)

+ (NSFetchRequest<AZUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"AZUser"];
}

@dynamic email;
@dynamic name;
@dynamic surname;

@end
