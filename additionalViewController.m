//
//  additionalViewController.m
//  OperationManeger
//
//  Created by Ryohei Terakata on 2014/08/14.
//  Copyright (c) 2014年 Ryohei Terakata. All rights reserved.
//

#import "additionalViewController.h"
#import <UIKit/UIKit.h>

@interface MyButton : UIButton
{
    NSUInteger section;
    NSUInteger row;
}

@property (nonatomic, readwrite) NSUInteger section;
@property (nonatomic, readwrite) NSUInteger row;

@end


@interface additionalViewController ()

@end

@implementation additionalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *favouriteRist =[userDefaults mutableArrayValueForKey:@"favoriteList"];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
