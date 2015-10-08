//
//  AllListModel.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "AllListModel.h"
#import "ChildListModel.h"

@implementation AllListModel

@synthesize id;

+ (AllListModel *)setAllListModelWithDictionary:(NSDictionary *)dataDictionary{
	AllListModel *allModel = [[AllListModel alloc] init];
		
	[allModel setValue:dataDictionary[@"id"] forKey:@"id"];
	[allModel setValue:dataDictionary[@"name"] forKey:@"name"];
		
	NSArray *dataArr = dataDictionary[@"childList"];
	NSMutableArray *childListArr = [[NSMutableArray alloc] init];
	for (NSDictionary *di in dataArr) {
		ChildListModel *model = [[ChildListModel alloc] init];
		[model setValuesForKeysWithDictionary:di];
		[childListArr addObject:model];
	}
	[allModel setValue:childListArr forKey:@"childList"];
	return allModel;
}



@end















