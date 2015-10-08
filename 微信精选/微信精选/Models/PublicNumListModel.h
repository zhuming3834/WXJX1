//
//  PublicNumListModel.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicNumListModel : NSObject

@property (nonatomic,copy)NSNumber *allNum;
@property (nonatomic,copy)NSNumber *allPages;
@property (nonatomic,copy)NSArray  *contentlist;
@property (nonatomic,copy)NSNumber *currentPage;
@property (nonatomic,copy)NSNumber *maxResult;

/**
 *  公众号名下表模型
 *
 *  @param dice 下载数据经JSON解析后的字典
 *
 *  @return 模型本身
 */
+ (PublicNumListModel *)setPublicNumListModelWithDictionary:(NSDictionary *)dice;

@end




















































































