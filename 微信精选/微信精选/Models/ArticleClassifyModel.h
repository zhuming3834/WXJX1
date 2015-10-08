//
//  ArticleClassifyModel.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleClassifyModel : NSObject

@property (nonatomic,copy)NSString *id;
@property (nonatomic,copy)NSString *name;

- (NSArray *)setArticleClassifyModelWithDictionary:(NSDictionary *)dice;

@end
