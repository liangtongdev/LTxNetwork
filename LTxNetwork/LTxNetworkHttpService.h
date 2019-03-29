//
//  LTxNetworkHttpService.h
//  LTxNetwork
//
//  Created by liangtong on 2019/3/28.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <LTxConfig/LTxConfig.h>
NS_ASSUME_NONNULL_BEGIN

@interface LTxNetworkHttpService : NSObject

/***
 * （1）如果需要验证签名等信息，可以通过对其属性requestSerializer进行设置
 * （2）如果需要对返回值格式进行设置，可以通过对其属性responseSerializer进行设置
 ***/
@property (nonatomic, strong) AFHTTPSessionManager* sessionManager;

/**
 *    @brief  实例
 */
+(LTxNetworkHttpService*)sharedInstance;

- (NSURLSessionDataTask*)doGetWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete;

- (NSURLSessionDataTask*)doPostWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete;

- (NSURLSessionDataTask*)doPutWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete;

- (NSURLSessionDataTask*)doDeleteWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete;

- (NSURLSessionDataTask*)doMultiPostWithURL:(NSString *)url param:(NSDictionary*)param filePathArray:(NSArray*)filePathArray progress:( void (^)(NSProgress *progress))progress complete:(LTxStringAndObjectCallbackBlock)complete;

@end

NS_ASSUME_NONNULL_END
