//
//  DetailViewController.m
//  SampleTableView003
//
//  Created by Ryohei Terakata on 2014/07/17.
//  Copyright (c) 2014年 Ryohei Terakata. All rights reserved.
//

#import "HowToListController.h"
#import "DetailViewController.h"

@interface HowToListController ()

@end

@implementation HowToListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}


- (void)viewDidLoad
    {
        [super viewDidLoad];
        
        
        NSBundle *bundle=[NSBundle mainBundle];
        
        //読み込みプロパティリストのファイルパス（場所）を指定
        NSString *path = [bundle pathForResource:@"OperationList" ofType:@"plist"];
        
        //プロパティリストの中身のデータを取得
        //※_HowToListにはrootそのものをとってくる。
        _HowToList = [NSDictionary dictionaryWithContentsOfFile:path];
        
        //rootはディクショナリー型なので、キーで引っ張ってくる。
        //キーの名前はOperationList(Root["OperationList"]という形になってる)
        NSArray *temp = [_HowToList objectForKey:@"OperationList"];
        
        //tempは配列型なので、数値で引っ張ってくる。selectnumには、前の画面で、
        //押された行番号が入っている。
        //tempはArray型、temp[0],temp[1]はディクショナリー型
        //temp[押された行番号]に対してはキーで引っ張ってくる必要がある。
        //今回引っ張りたいキーはHowToList.
        _TitileList = [temp[self.selectnum] objectForKey:@"HowToList"];
        
        //ここでいったん処理終了、実際に表示する部分はcellForRowAtIndexPathにまかせる。
        
        NSLog(@"------------------------------");
        
        
        self.howtoTableView.delegate = self;
        self.howtoTableView.dataSource = self;
        
    }


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

return _TitileList.count;
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
           UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];//_HowToList[indexpath.row]];
}

    //ViewDidLoadで準備しといたtitlelistを使って実際に名前を引っ張ってくる。
    //_TitileListはアレイ型、TitleList[0],TitleList[1]はディクショナリー型
    //キーの名前はName
    NSString *name = [_TitileList[indexpath.row] objectForKey:@"Name"];
    
    
    cell.textLabel.text=[NSString stringWithFormat:name];


return cell;


}
    

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Tap:%d",indexPath.row);
    
    DetailViewController *dvc=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    //行番号を保存
    
    dvc.selectnum=indexPath.row;
    
    
    //友達リストをDetailViewControllerに渡す
    
    NSString *content = [_TitileList[indexPath.row] objectForKey:@"Content"];
    dvc.content = content;

    
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

@end
