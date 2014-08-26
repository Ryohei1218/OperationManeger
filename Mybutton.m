//
//  Mybutton.m
//  OperationManeger
//
//  Created by Ryohei Terakata on 2014/08/15.
//  Copyright (c) 2014年 Ryohei Terakata. All rights reserved.
//

#import "Mybutton.h"

@implementation Mybutton

@synthesize section;
@synthesize row;
@synthesize HowTo;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)buttonDidTouchDown:(id)sender {
    
    Mybutton *theButton = (Mybutton *)sender;
    NSLog(@"Button[%d,%d] was pressed.", theButton.section, theButton.row);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *favouriteRist =[userDefaults mutableArrayValueForKey:@"favoriteList"];
    
//    [favouriteRist addObject:self.HowTo];
//    NSLog(@"favoriteList%@",favouriteRist);
    
    // お気に入りとして登録してあるデータをチェックする。
    // もし、既に登録してあれば、お気に入りから削除して処理を終了
    //（終了というのは、returnの部分です。returnを書くとそれ以降の処理をせずに終了します。）
    for(NSDictionary *favoriteHowto in favouriteRist){
        if ([favoriteHowto isEqual:self.HowTo]) {
            // 既にお気に入り登録されている場合は、お気に入り解除
            [favouriteRist removeObject:favoriteHowto];
            [theButton setTitle:@"" forState:UIControlStateNormal];
            return;
        }
    }
    
    // section Aを通りこして、ここまで処理が進んだということは、
    // お気に入りに登録されていない状態なので、新規に登録する。
    [favouriteRist addObject:self.HowTo];
    [theButton setTitle:@"★" forState:UIControlStateNormal];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
