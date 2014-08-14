//
//  ViewController.h
//  OperationManeger
//
//  Created by Ryohei Terakata on 2014/08/01.
//  Copyright (c) 2014年 Ryohei Terakata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
