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
{
    NSArray *_favoriteList;
    
}

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
    NSMutableArray *favouriteList =[userDefaults mutableArrayValueForKey:@"favoriteList"];

    _favoriteList = favouriteList.copy;

//ここから
    
    
    


self.additionalList.delegate = self;
self.additionalList.dataSource = self;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSMutableArray *favouriteList =[userDefaults mutableArrayValueForKey:@"favoriteList"];
    

    return _favoriteList.count;
    
}
    
    
    
    //ここから
    
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
        static NSString *CellIndentifier=@"Cell";
        
        //セルの再利用
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
        if(cell==nil)
        {
            //表示スタイルを決定
            cell=[[UITableViewCell alloc]
                  initWithStyle:
                  UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
        }
        
        
        NSLog(@"row:: %@", _favoriteList[indexPath.row]);
        NSDictionary *dic = _favoriteList[indexPath.row];
        NSLog(@"dict:: %@", dic[@"Name"]);
        cell.textLabel.text=[NSString stringWithFormat:@"%@", dic[@"Name"]];
        
        
        NSDictionary *how = dic[@"how to"];
        NSLog(@"content:: %@", how[@"content"]);
    
        
        return cell;
    }

    
    //ここまで





//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                      reuseIdentifier:CellIdentifier ];
//    }
////        Mybutton *aButton = [[Mybutton alloc] initWithFrame:CGRectMake(10, 8, 30, 30)];
////        aButton.tag = 10000;
////        aButton.backgroundColor = [UIColor blueColor];
////        [aButton addTarget:aButton
////                    action:@selector(buttonDidTouchDown:)
////          forControlEvents:UIControlEventTouchDown];
//        
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        NSMutableArray *favouriteList =[userDefaults mutableArrayValueForKey:@"favoriteList"];
//        
//        //    [favouriteRist addObject:self.HowTo];
//        //    NSLog(@"favoriteList%@",favouriteRist);
//        
//        // お気に入りとして登録してあるデータをチェックする。
//        // もし、既に登録してあれば、お気に入りから削除して処理を終了
//        //（終了というのは、returnの部分です。returnを書くとそれ以降の処理をせずに終了します。）
////        for(NSDictionary *favoriteHowto in favouriteList){
////            NSDictionary *howto = self.TitileList[indexPath.row];
////            if ([favoriteHowto isEqual:howto]) {
////                //aButton.titleLabel = @"★";
////                [aButton setTitle:@"★" forState:UIControlStateNormal];
////            }
////        }
////        [cell addSubview:aButton];
////    }
////    
////    
////    Mybutton *theButton = (Mybutton *)[cell viewWithTag:10000];
////    if (theButton) {
////        theButton.section = [indexPath section];
////        theButton.row = [indexPath row];
////        theButton.HowTo = _TitileList[indexPath.row];
////    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%d", [indexPath row]];
//    return cell;
//    
//    
//}
//


//ここまで

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}




@end
