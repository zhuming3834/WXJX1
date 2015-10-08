//
//  PublicClassifyModel.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "PublicClassifyModel.h"
#import "AllListModel.h"

@implementation PublicClassifyModel


+ (PublicClassifyModel *)setPublicClassifyModelWith:(NSDictionary *)dice{
	PublicClassifyModel *pm = [[PublicClassifyModel alloc] init];
	NSArray *allListArray = dice[@"showapi_res_body"][@"allList"];
	NSMutableArray *modelArr = [[NSMutableArray alloc] init];

	for (NSDictionary * dic in allListArray) {
		if (dic.count > 1) {
			AllListModel *model = [AllListModel setAllListModelWithDictionary:dic];
			[modelArr addObject:model];
		}
	}
	[pm setValue:modelArr forKey:@"allList"];
	return pm;
}




@end






































