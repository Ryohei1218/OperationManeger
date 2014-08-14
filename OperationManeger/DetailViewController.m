//
//  DetailViewController.m
//  SampleTableView003
//
//  Created by Ryohei Terakata on 2014/07/17.
//  Copyright (c) 2014年 Ryohei Terakata. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    
    
    NSLog(@"dvc=%d",self.selectnum);
    NSLog(@"dvc=%@",self.content);
    
    self.contentTextVew.text=self.content;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
