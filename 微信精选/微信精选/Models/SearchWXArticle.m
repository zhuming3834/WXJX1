//
//  SearchWXArticle.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "SearchWXArticle.h"
#import "SearchArticleModel.h"

@implementation SearchWXArticle

+ (SearchWXArticle *)setSearchWXArticleModelWithDictionary:(NSDictionary *)dice{
	NSDictionary *dic = dice[@"showapi_res_body"][@"pagebean"];
	SearchWXArticle *sWX = [[SearchWXArticle alloc] init];
	[sWX setValue:dic[@"allNum"] forKey:@"allNum"];
	[sWX setValue:dic[@"allPages"] forKey:@"allPages"];
	[sWX setValue:dic[@"currentPage"] forKey:@"currentPage"];
	[sWX setValue:dic[@"maxResult"] forKey:@"maxResult"];
	NSArray *arr = dic[@"contentlist"];
	NSMutableArray *sArr = [[NSMutableArray alloc] init];
	for (NSDictionary *di in arr) {
		SearchArticleModel *aModel = [[SearchArticleModel alloc] init];
		[aModel setValuesForKeysWithDictionary:di];
		[sArr addObject:aModel];
	}
	[sWX setValue:sArr forKey:@"contentlist"];
	return sWX;
}



@end















































