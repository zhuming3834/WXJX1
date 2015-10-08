//
//  AllListModel.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllListModel : NSObject

@property (nonatomic,strong)NSArray  *childList;
@property (nonatomic,strong)NSString *id;
@property (nonatomic,strong)NSString *name;


/**
 *  某一类公众号模型
 *
 *  @param dataDictionary 建模需要传入的字典
 *
 *  @return 返回一类公众号的模型
 */
+ (AllListModel *)setAllListModelWithDictionary:(NSDictionary *)dataDictionary;

@end
