//
//  URLModels.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "URLModels.h"


#define SHOWAPI_SIGN   @"ad3ae301016b4058bb792b7c4a6ea2c2"
#define SHOWAPI_APPID  @"10216"

@implementation URLModels

/**
 *  获取系统时间
 *
 *  @return 返回NSString类型的yyyyMMddHHmmss格式的时间
 */
- (NSString *)getDateStr{
	//得到当前系统日期
	NSDate *date1 = [NSDate date];
	//然后您需要定义一个NSDataFormat的对象
	NSDateFormatter * dateFormat = [[NSDateFormatter alloc]init];
	//然后设置这个类的dataFormate属性为一个字符串，系统就可以因此自动识别年月日时间
	[dateFormat setDateFormat: @"yyyyMMddHHmmss"];
	//之后定义一个字符串，使用stringFromDate方法将日期转换为字符串
	NSString * show_timestamp = [dateFormat stringFromDate:date1];
	return show_timestamp;
}
/**
 *  根据文章ID查找文章
 *
 *  @param articleID 文章的ID号
 *
 *  @return 返回该文章的URLString
 */
- (NSString *)getArticleWithID:(NSString *)articleID{
	//eg:
	//https://route.showapi.com/582-5?id=55f63a9c6e36700c1519c4b7&showapi_appid=4954&showapi_timestamp=20150926110906&showapi_sign=0e186ed9163e5fc09178e789fb8d9fb8
	NSString *show_timestamp = [self getDateStr];
	NSString *showapi_appid = SHOWAPI_APPID;
	NSString *showapi_sign = SHOWAPI_SIGN;
	NSString * temp = [NSString stringWithFormat:@"https://route.showapi.com/582-5?id=%@&showapi_appid=%@&showapi_timestamp=%@&showapi_sign=%@",articleID,showapi_appid,show_timestamp,showapi_sign];
	//解决http中带中文字符的情况
	NSString * urlStr = [temp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return urlStr;
}
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
- (NSString *)getPublicNumListWithType1ID:(NSString *)type1ID type2ID:(NSString *)type2ID keyword:(NSString *)keyword page:(NSString *)page{
	//eg:
	//https://route.showapi.com/582-4?keyword=&page=&showapi_appid=4954&showapi_timestamp=20150926111434&type1_id=&type2_id=&showapi_sign=f5063ea30702eb646d68b802f30df816
	
	if (type1ID == nil) {
		type1ID = @"";
	}
	if (type2ID == nil) {
		type2ID = @"";
	}
	if (keyword == nil) {
		keyword = @"";
	}
	if (page == nil) {
		page = @"";
	}
	
	NSString *show_timestamp = [self getDateStr];
	NSString *showapi_appid = SHOWAPI_APPID;
	NSString *showapi_sign = SHOWAPI_SIGN;
	NSString * temp = [NSString stringWithFormat:@"https://route.showapi.com/582-4?keyword=%@&page=%@&showapi_appid=%@&showapi_timestamp=%@&type1_id=%@&type2_id=%@&showapi_sign=%@",keyword,page,showapi_appid,show_timestamp,type1ID,type2ID,showapi_sign];
	//解决http中带中文字符的情况
	NSString * urlStr = [temp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return urlStr;
}
/**
 *  公众号分类查询
 *
 *  @return 查询链接
 */
- (NSString *)getPublicClassify{
	//eg:
	//https://route.showapi.com/582-3?showapi_appid=4954&showapi_timestamp=20150926112431&showapi_sign=795ff4ebd34d3c1299816e55d060b38c
	NSString *show_timestamp = [self getDateStr];
	NSString *showapi_appid = SHOWAPI_APPID;
	NSString *showapi_sign = SHOWAPI_SIGN;
	NSString * temp = [NSString stringWithFormat:@"https://route.showapi.com/582-3?showapi_appid=%@&showapi_timestamp=%@&showapi_sign=%@",showapi_appid,show_timestamp,showapi_sign];
	//解决http中带中文字符的情况
	NSString * urlStr = [temp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return urlStr;
}
/**
 *  查询微信精选文章
 *
 *  @param typeID  文章分类
 *  @param keyword 文章标题中的关键字
 *  @param page    查询结果中的第几页
 *
 *  @return 返回查询需要的URLString
 */
- (NSString *)getArticleWithTypeID:(NSString *)typeID keyword:(NSString *)keyword page:(NSString *)page{
	//eg:
	//https://route.showapi.com/582-2?key=&page=&showapi_appid=4954&showapi_timestamp=20150926112850&typeId=1&showapi_sign=985a09c6f475d6fda6cf3beb98c93d79
	
	if (typeID == nil) {
		typeID = @"";
	}
	if (keyword == nil) {
		keyword = @"";
	}
	if (page == nil) {
		page = @"";
	}
	
	NSString *show_timestamp = [self getDateStr];
	NSString *showapi_appid = SHOWAPI_APPID;
	NSString *showapi_sign = SHOWAPI_SIGN;
	NSString * temp = [NSString stringWithFormat:@"https://route.showapi.com/582-2?key=%@&page=%@&showapi_appid=%@&showapi_timestamp=%@&typeId=%@&showapi_sign=%@",keyword,page,showapi_appid,show_timestamp,typeID,showapi_sign];
	//解决http中带中文字符的情况
	NSString * urlStr = [temp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return urlStr;
}
/**
 *  获取微信文章类别
 *
 *  @return 返回需要查询的URLString
 */
- (NSString *)getArticleClassify{
	//eg:
	//https://route.showapi.com/582-1?showapi_appid=4954&showapi_timestamp=20150926113333&showapi_sign=e3d86744761d308691b72809d98d3059
	NSString *show_timestamp = [self getDateStr];
	NSString *showapi_appid = SHOWAPI_APPID;
	NSString *showapi_sign = SHOWAPI_SIGN;
	NSString * temp = [NSString stringWithFormat:@"https://route.showapi.com/582-1?showapi_appid=%@&showapi_timestamp=%@&showapi_sign=%@",showapi_appid,show_timestamp,showapi_sign];
	//解决http中带中文字符的情况
	NSString * urlStr = [temp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return urlStr;
}











@end








































