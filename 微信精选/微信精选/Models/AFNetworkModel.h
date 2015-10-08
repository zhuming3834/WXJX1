//
//  AFNetworkModel.h
//  微信精选
//
//  Created by qf on 15/9/26.
//  Copyright (c) 2015年 朱明. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AFNetworkDownloadDelegate <NSObject>

- (void)getAFNetworkDownloadData:(NSData *)recData withAFNetWorking:(id)AFNetWorking;

@end


@interface AFNetworkModel : NSObject

@property (nonatomic,retain)NSString *identify;
@property (nonatomic,weak)id<AFNetworkDownloadDelegate>delegate;

- (void)AFNetDownloadFromURLString:(NSString *)URLString;


@end
