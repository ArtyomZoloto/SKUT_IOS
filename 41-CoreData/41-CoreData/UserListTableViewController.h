//
//  StudentListTableViewController.h
//  41-CoreData
//
//  Created by iMac on 08/06/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserListTableViewController : UITableViewController
@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

@end

NS_ASSUME_NONNULL_END
