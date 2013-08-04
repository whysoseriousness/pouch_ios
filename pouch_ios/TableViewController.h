//
//  TableViewController.h
//  pouch_ios
//
//  Created by Joshua Martin on 8/4/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *pouchArrayFromAFNetworking;
@property (strong, nonatomic) NSArray *finishedPouchArray;

@end
