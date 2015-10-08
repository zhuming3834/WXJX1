//
//  PublicNumListModel.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "PublicNumListModel.h"
#import "SubPublicNumListModel.h"

@implementation PublicNumListModel


+ (PublicNumListModel *)setPublicNumListModelWithDictionary:(NSDictionary *)dice{
	PublicNumListModel *pm = [[PublicNumListModel alloc] init];
	NSDictionary *dic = dice[@"showapi_res_body"][@"pagebean"];
	[pm setValue:dic[@"allNum"] forKey:@"allNum"];
	[pm setValue:dic[@"allPages"] forKey:@"allPages"];
	[pm setValue:dic[@"currentPage"] forKey:@"currentPage"];
	[pm setValue:dic[@"maxResult"] forKey:@"maxResult"];
	
	NSArray *arr = dic[@"contentlist"];
	NSMutableArray *array = [[NSMutableArray alloc] init];
	for (NSDictionary *di in arr) {
		SubPublicNumListModel *model = [[SubPublicNumListModel alloc] init];
		[model setValuesForKeysWithDictionary:di];
		[array addObject:model];
	}
	[pm setValue:array forKey:@"contentlist"];
	return pm;
}





@end









