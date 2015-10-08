//
//  AFNetworkModel.m
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import "AFNetworkModel.h"
#import "AFNetworking.h"


@implementation AFNetworkModel


- (void)AFNetDownloadFromURLString:(NSString *)URLString{
	NSURL *url = [NSURL URLWithString:URLString];
	AFHTTPRequestOperationManager *manage = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
	[manage.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
		if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
			[[NSNotificationCenter defaultCenter] postNotificationName:@"netStatusUnknown" object:nil];
		}
	}];
	[manage.reachabilityManager startMonitoring];
	
	manage.responseSerializer = [AFHTTPResponseSerializer serializer];
	[manage GET:URLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
		[self.delegate getAFNetworkDownloadData:responseObject withAFNetWorking:self];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		UIAlertView * netStatusAl = [[UIAlertView alloc] initWithTitle:@"服务器连接失败" message:@"请检查网络连接" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
		[netStatusAl show];  //请检查网络连接
	}];
}






@end



































