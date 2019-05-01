//
//  AZTableViewController.h
//  35-search-easy-mode
//
//  Created by iMac on 01/05/2019.
//  Copyright © 2019 Zolotoverkhov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AZTableViewController : UITableViewController <UISearchBarDelegate>
@property(readonly, strong, nonatomic) NSArray* data;
@property(strong, nonatomic) NSArray *displayData;
@property(strong, nonatomic) NSString *filter;
@end

NS_ASSUME_NONNULL_END
