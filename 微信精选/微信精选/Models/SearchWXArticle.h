//
//  SearchWXArticle.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchWXArticle : NSObject

@property (nonatomic,copy)NSNumber *allNum;
@property (nonatomic,copy)NSNumber *allPages;
@property (nonatomic,copy)NSArray  *contentlist;
@property (nonatomic,copy)NSNumber *currentPage;
@property (nonatomic,copy)NSNumber *maxResult;

+ (SearchWXArticle *)setSearchWXArticleModelWithDictionary:(NSDictionary *)dice;

@end
