//
//  LTxNetworkHttpService.m
//  LTxNetwork
//
//  Created by liangtong on 2019/3/28.
//

#import "LTxNetworkHttpService.h"

@implementation LTxNetworkHttpService
static LTxNetworkHttpService *_instance;
+ (LTxNetworkHttpService*)sharedInstance{
    static dispatch_once_t onceTokenLTxHttpService;
    dispatch_once(&onceTokenLTxHttpService, ^{
        _instance = [[LTxNetworkHttpService alloc] init];
        _instance.sessionManager = [AFHTTPSessionManager manager];
        [_instance setupDefaultSessionManager];
    });
    return _instance;
}
-(void)setupDefaultSessionManager{
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    _sessionManager.requestSerializer.timeoutInterval = 30.f;
}


- (NSURLSessionDataTask*)doGetWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete{
    return [self.sessionManager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:responseObject
                                                    complete:complete];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        NSLog(@"\n网络访问异常：%s\n%@",__func__,error);
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:nil
                                                    complete:complete];
    }];
}

- (NSURLSessionDataTask*)doPostWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete{
    return [self.sessionManager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:responseObject
                                                    complete:complete];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        NSLog(@"\n网络访问异常：%s\n%@",__func__,error);
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:nil
                                                    complete:complete];
    }];
}

- (NSURLSessionDataTask*)doPutWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete{
    return [self.sessionManager PUT:url parameters:param success:^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:responseObject
                                                    complete:complete];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        NSLog(@"\n网络访问异常：%s\n%@",__func__,error);
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:nil
                                                    complete:complete];
    }];
}

- (NSURLSessionDataTask*)doDeleteWithURL:(NSString*)url param:(NSDictionary*)param complete:(LTxStringAndObjectCallbackBlock)complete{
    return [self.sessionManager DELETE:url parameters:param success:^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:responseObject
                                                    complete:complete];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        NSLog(@"\n网络访问异常：%s\n%@",__func__,error);
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:nil
                                                    complete:complete];
    }];
}

- (NSURLSessionDataTask*)doMultiPostWithURL:(NSString *)url param:(NSDictionary*)param filePathArray:(NSArray*)filePathArray progress:( void (^)(NSProgress *progress))progress complete:(LTxStringAndObjectCallbackBlock)complete{
    return [self.sessionManager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (NSURL* filePath in filePathArray) {
            NSString* fileName = [filePath.path.lastPathComponent stringByDeletingPathExtension];
            [formData appendPartWithFileURL:filePath
                                       name:fileName
                                      error:nil];
        }
    } progress:^(NSProgress *uploadProgress){
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:responseObject
                                                    complete:complete];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        NSLog(@"\n网络访问异常：%s\n%@",__func__,error);
        [self handleHttpResponseWithStatusCode:((NSHTTPURLResponse*)(task.response)).statusCode
                                              responseObject:nil
                                                    complete:complete];
    }];
}

#pragma mark - 数据检查/处理
-(void)handleHttpResponseWithStatusCode:(NSInteger)statusCode
                         responseObject:(id)responseObject
                               complete:(LTxStringAndObjectCallbackBlock)complete{
    
    
    NSDictionary* data = [responseObject objectForKey:@"data"];
    
    NSString* msg = [responseObject objectForKey:@"message"];
    NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
    NSString* errorTips = [LTxError errorTipsWithHttpStatusCode:statusCode code:code message:msg];
    
    if (complete) {
        complete(errorTips, data);
    }
}
@end
