//
//  ViewController.m
//  微信精选
//
//  Created by qf on 15/9/24.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "ViewController.h"
#import "ArticleModel.h"
#import "AFNetworkModel.h"
#import "URLModels.h"
#import "ArticleClassifyModel.h"
#import "PublicNumListModel.h"
#import "SubPublicNumListModel.h"
#import "PublicClassifyModel.h"
#import "ChildListModel.h"
#import "AllListModel.h"
#import "SearchArticleModel.h"
#import "SearchWXArticle.h"


#define ScreenWidth   [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight   [[UIScreen mainScreen] bounds].size.height
#define VProportionImg  ScreenHeight/667//UI设计以6的屏幕为参考
#define HProportionImg  ScreenWidth/375


@interface ViewController ()<AFNetworkDownloadDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)UIView         *leftView;
@property (nonatomic,strong)UIView         *currentView;

@property (nonatomic,strong)UITableView    *tableView;
@property (nonatomic,strong)UIScrollView   *scrollView;
@property (nonatomic,strong)UIPageControl  *pageControl;

@property (nonatomic,strong)UIImageView    *titleImageView;
@property (nonatomic,strong)UIButton       *loginButton;
@property (nonatomic,strong)UILabel        *titleLabel;
@property (nonatomic,strong)UIButton       *settingButton;
@property (nonatomic,strong)UILabel        *testLabel;

@property (nonatomic,strong)NSTimer        *timer;
@property (nonatomic,assign)int             currentPage;
@property (nonatomic,assign)int             page;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	[self testModels];
	
	[self setLeftView];
	
	[self setCurrentView];
	
	[self setTableView];

	
//	self.view.backgroundColor = [UIColor orangeColor];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)setLeftView{
	self.leftView = [[UIView alloc] init];
	self.leftView.frame = CGRectMake(-180, 0, 180, self.view.frame.size.height);
	self.leftView.backgroundColor = [UIColor orangeColor];
	[self.view addSubview:self.leftView];
	
	self.testLabel = [[UILabel alloc] init];
	self.testLabel.frame = CGRectMake(0, 100, self.leftView.frame.size.width, 34);
	self.testLabel.textColor = [UIColor whiteColor];
	self.testLabel.text = @"  测试用数据";
	self.testLabel.backgroundColor = [UIColor blueColor];
	[self.leftView addSubview:self.testLabel];
}
- (void)setCurrentView{
	self.currentView = [[UIView alloc] init];
	self.currentView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	self.currentView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:self.currentView];
	
	self.titleImageView = [[UIImageView alloc] init];
	self.titleImageView.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
	self.titleImageView.backgroundColor = [UIColor grayColor];
	self.titleImageView.userInteractionEnabled = YES;
	[self.currentView addSubview:self.titleImageView];
	
	self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
	self.loginButton.frame = CGRectMake(10, 5, 40, 34);
	self.loginButton.backgroundColor = [UIColor greenColor];
	self.loginButton.selected = NO;
	[self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
	[self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[self.titleImageView addSubview:self.loginButton];
	
	self.titleLabel = [[UILabel alloc] init];
	self.titleLabel.frame = CGRectMake(60, 5, 50, 34);
	self.titleLabel.textColor = [UIColor whiteColor];
	self.titleLabel.text = @"首页";
	self.titleLabel.backgroundColor = [UIColor blueColor];
	[self.titleImageView addSubview:self.titleLabel];
	
	self.settingButton = [[UIButton alloc] init];
	self.settingButton.frame = CGRectMake(self.view.frame.size.width - 50, 5, 40, 34);
	self.settingButton.backgroundColor = [UIColor greenColor];
	[self.settingButton setTitle:@"设置" forState:UIControlStateNormal];
	[self.settingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.titleImageView addSubview:self.settingButton];
}
- (void)loginButtonClick{
	self.loginButton.selected = !self.loginButton.selected;
	if (self.loginButton.selected == YES) {
		[UIView animateWithDuration:0.5 animations:^{
			self.leftView.frame = CGRectMake(0, 0, 180, self.view.frame.size.height);
			self.currentView.frame = CGRectMake(180, 0, self.view.frame.size.width, self.view.frame.size.height);
		}];
	}
	else{
		[UIView animateWithDuration:0.5 animations:^{
			self.leftView.frame = CGRectMake(-180, 0, 180, self.view.frame.size.height);
			self.currentView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
		}];
	}
}

- (void)setTableView{
	self.tableView = [[UITableView alloc] init];
	self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
	self.tableView.bounces = NO;
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableView.userInteractionEnabled = YES;
	[self.currentView addSubview:self.tableView];
	
	self.scrollView = [[UIScrollView alloc] init];
	self.scrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, 120);
	self.scrollView.backgroundColor = [UIColor orangeColor];
	self.scrollView.userInteractionEnabled = YES;
	self.scrollView.pagingEnabled = YES;
	self.scrollView.showsHorizontalScrollIndicator = NO;
	self.scrollView.delegate = self;
	self.tableView.tableHeaderView = self.scrollView;
	
	NSArray *colorArr = @[[UIColor blueColor],[UIColor grayColor],[UIColor lightGrayColor],[UIColor blackColor],[UIColor greenColor]];
	for (int i = 0; i < colorArr.count; i ++) {
		UIImageView *imageView = [[UIImageView alloc] init];
		imageView.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, 120);
		imageView.backgroundColor = colorArr[i];
		imageView.userInteractionEnabled = YES;
		[self.scrollView addSubview:imageView];
	}
	[self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width * colorArr.count, 120)];
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scrollViewChange) userInfo:nil repeats:YES];
	
	
	self.pageControl = [[UIPageControl alloc] init];
	self.pageControl.frame = CGRectMake(self.view.frame.size.width/2 - 50, 83, 100, 37);
	self.pageControl.numberOfPages = 5;
	self.pageControl.currentPage = 0;
	self.pageControl.tintColor = [UIColor whiteColor];
	self.pageControl.pageIndicatorTintColor = [UIColor redColor];
	[self.tableView addSubview:self.pageControl];
	
}
- (void)scrollViewChange{
	
	CGPoint pos = self.scrollView.contentOffset;
	if (pos.x == self.view.frame.size.width * 4) {
		self.scrollView.contentOffset = CGPointMake(-self.scrollView.frame.size.width, 0);
	}
	[self.scrollView scrollRectToVisible:CGRectMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:YES];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
	//在滚动完以后设置页码
	self.currentPage = self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
	self.pageControl.currentPage = self.currentPage;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 40;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *identify = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
	}
	cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
	return cell;
}
- (void)testModels{
	URLModels *urlModel = [[URLModels alloc] init];
	
	NSString *urlString = [urlModel getArticleWithTypeID:nil keyword:nil page:@"1"];
	
	
	AFNetworkModel *AFnet = [[AFNetworkModel alloc] init];
	AFnet.delegate = self;
	AFnet.identify = @"1";
	[AFnet AFNetDownloadFromURLString:urlString];
}

- (void)getAFNetworkDownloadData:(NSData *)recData withAFNetWorking:(id)AFNetWorking{
	NSDictionary *dice = [NSJSONSerialization JSONObjectWithData:recData options:NSJSONReadingMutableContainers error:nil];
/*    //1
	AFNetworkModel *a = (AFNetworkModel *)AFNetWorking;
	
	if ([a.identify isEqualToString:@"1"]) {
		ArticleClassifyModel *arModel = [[ArticleClassifyModel alloc] init];
		NSArray *arr = [arModel setArticleClassifyModelWithDictionary:dice];
		NSLog(@"arr = %@",arr);
		
		for (ArticleClassifyModel *mo in arr) {
			NSLog(@"name = %@",mo.name);
		}
	}
*/
/*  //2
	ArticleModel *armodel = [ArticleModel setArticleModelWithDictionary:dice];
	NSLog(@"ID查文章 = %@",armodel.contentImg);
*/

/*  //3
	PublicNumListModel *pubM = [PublicNumListModel setPublicNumListModelWithDictionary:dice];
	NSLog(@"contentlist = %@",pubM.contentlist);
	NSArray *arr = (NSArray *)pubM.contentlist;
	SubPublicNumListModel *sub = (SubPublicNumListModel *)arr[0];
	NSLog(@"sub = %@",sub.code2img);
 */
	
/* //4
	PublicClassifyModel *pModel = [PublicClassifyModel setPublicClassifyModelWith:dice];
	NSLog(@"pModel = %@",pModel.allList);
	
	for (AllListModel *mo in pModel.allList) {
		NSLog(@"allModel.name = %@",mo.name);
		for (ChildListModel *cm in mo.childList) {
			NSLog(@"cm.name = %@",cm.name);
		}
	}
 */
	//5
	SearchWXArticle *sWX = [SearchWXArticle setSearchWXArticleModelWithDictionary:dice];
	NSLog(@"allNum = %@",sWX.allNum);
	NSLog(@"allNum = %@",sWX.allPages);
	
	SearchArticleModel *sm = (SearchArticleModel *)sWX.contentlist[1];
	NSLog(@"sm.title = %@",sm.title);
	NSLog(@"sm.date = %@",sm.date);
	NSLog(@"sm.url = %@",sm.url);
	NSLog(@"sm.userName = %@",sm.userName);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
