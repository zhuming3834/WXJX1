//
//  PublicClassifyModel.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicClassifyModel : NSObject

@property (nonatomic,copy)NSArray *allList;



/**
 *  全部公众号模型
 *
 *  @param dice 下载数据经JSON解析后的字典
 *
 *  @return 返回模型本身
 */
+ (PublicClassifyModel *)setPublicClassifyModelWith:(NSDictionary *)dice;

@end
