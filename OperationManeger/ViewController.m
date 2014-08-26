//
//  ViewController.m
//  OperationManeger
//
//  Created by Ryohei Terakata on 2014/08/01.
//  Copyright (c) 2014年 Ryohei Terakata. All rights reserved.
//

#import "ViewController.h"
#import "HowToListController.h"

@interface ViewController ()
{
    NSArray *_operationList;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSBundle *bundle=[NSBundle mainBundle];
    
    //読み込みプロパティリストのファイルパス（場所）を指定
    
    NSString *path = [bundle pathForResource:@"OperationList" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",dic);
    
    _operationList=[dic objectForKey:@"OperationList"];
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _operationList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexpath
{
    static NSString *CellIndentifier=@"Cell";
    
    //セルの再利用
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if(cell==nil)
    {
        //表示スタイルを決定
        cell=[[UITableViewCell alloc]
              initWithStyle:
              UITableViewCellStyleDefault reuseIdentifier:_operationList[indexpath.row]];
    }
    
    
    NSLog(@"row:: %@", _operationList[indexpath.row]);
    NSDictionary *dic = _operationList[indexpath.row];
    NSLog(@"dict:: %@", dic[@"Name"]);
    cell.textLabel.text=[NSString stringWithFormat:@"%@", dic[@"Name"]];
    
    
    NSDictionary *how = dic[@"how to"];
    NSLog(@"content:: %@", how[@"content"]);
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Tap:%d",indexPath.row);
    
    HowToListController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"HowToListController"];
    //行番号を保存
    
    hvc.selectnum=indexPath.row;
    
    //友達リストをDetailViewControllerに渡す
    hvc.HowToList=_operationList [indexPath.row];

    
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:hvc animated:YES];
}


@end
