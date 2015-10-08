//
//  URLModels.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLModels : NSObject



/**
 *  根据文章ID查找文章
 *
 *  @param articleID 文章的ID号
 *
 *  @return 返回该文章的URLString
 */
- (NSString *)getArticleWithID:(NSString *)articleID;
/**
 *  查找公众号明细列表
 *
 *  @param type1ID type1ID
 *  @param type2ID type2ID
 *  @param keyword 关键字  公众号中的关键字
 *  @param page    查询结果中的第几页
 *
 *  @return 查找的URLString
 */
- (NSString *)getPublicNumListWithType1ID:(NSString *)type1ID type2ID:(NSString *)type2ID keyword:(NSString *)keyword page:(NSString *)page;
/**
 *  公众号分类查询
 *
 *  @return 查询链接
 */
- (NSString *)getPublicClassify;
/**
 *  查询微信精选文章
 *
 *  @param typeID  文章分类
 *  @param keyword 文章标题中的关键字
 *  @param page    查询结果中的第几页
 *
 *  @return 返回查询需要的URLString1
 */
- (NSString *)getArticleWithTypeID:(NSString *)typeID keyword:(NSString *)keyword page:(NSString *)page;
/**
 *  获取微信文章类别
 *
 *  @return 返回需要查询的URLString
 */
- (NSString *)getArticleClassify;



@end
