//
//  ArticleClassifyModel.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "ArticleClassifyModel.h"

@implementation ArticleClassifyModel

- (NSArray *)setArticleClassifyModelWithDictionary:(NSDictionary *)dice{
	NSArray *array = dice[@"showapi_res_body"][@"typeList"];
	NSMutableArray *modelArr = [[NSMutableArray alloc] init];
	for (NSDictionary *dic in array) {
		ArticleClassifyModel *model = [[ArticleClassifyModel alloc] init];
		[model setValuesForKeysWithDictionary:dic];
		[modelArr addObject:model];
	}
	return modelArr;
}
@end
