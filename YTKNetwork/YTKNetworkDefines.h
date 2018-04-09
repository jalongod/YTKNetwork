//
//  YTKNetworkDefines.h
//  Pods
//
//  Created by rong on 2018/4/3.
//

#ifndef YTKNetworkDefines_h
#define YTKNetworkDefines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YTKBaseRequest;
@class YTKNetworkAgent;

@protocol YTKNetBreakProtocol <NSObject>

- (BOOL) agent:(YTKNetworkAgent *)agent shouldResumeRequestImmediately:(YTKBaseRequest *)request;
- (BOOL) agent:(YTKNetworkAgent *)agent shouldBreakNetwork:(YTKBaseRequest *)request;

@end

NS_ASSUME_NONNULL_END
#endif /* YTKNetworkDefines_h */
