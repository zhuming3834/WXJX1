//
//  ArticleModel.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

@synthesize id;


/*
 @property (nonatomic,copy)NSString *contentImg;
 @property (nonatomic,copy)NSString *ct;
 @property (nonatomic,copy)NSString *date;
 @property (nonatomic,copy)NSString *id;
 @property (nonatomic,copy)NSString *typeName;
 @property (nonatomic,copy)NSString *url;
 @property (nonatomic,copy)NSString *userLogo;
 @property (nonatomic,copy)NSString *userLogo_code;
 @property (nonatomic,copy)NSString *userName;
 */

+ (ArticleModel *)setArticleModelWithDictionary:(NSDictionary *)dice{
	NSDictionary *dic = dice[@"showapi_res_body"][@"item"];
	ArticleModel *model = [[ArticleModel alloc] init];
	[model setValuesForKeysWithDictionary:dic];
	return model;
}


@end










