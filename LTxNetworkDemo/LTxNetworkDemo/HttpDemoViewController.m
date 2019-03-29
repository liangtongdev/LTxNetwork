//
//  HttpDemoViewController.m
//  LTxNetworkDemo
//
//  Created by liangtong on 2019/3/29.
//  Copyright © 2019 LIANGTONG. All rights reserved.
//

#import "HttpDemoViewController.h"
#import <LTxNetwork/LTxNetwork.h>

@interface HttpDemoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation HttpDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Http";
}

- (IBAction)getAction:(UIButton *)sender {
    /***
     * GET / POST / PUT / DELETE
     ***/
    [[LTxNetworkHttpService sharedInstance] doPostWithURL:@"http://localhost:8802/base-login/v1/api/mobile/user/authentication" param:@{ @"username":@"liangtong", @"password":@"xxxx", @"appId":@"8c41f00f-8870-469d-8180-5d9e556f0170", } complete:^(NSString * error, id retObj) {
        
    }];
}

- (IBAction)moreAction:(UIButton *)sender {
    
    LTxNetworkHttpService* service = [LTxNetworkHttpService sharedInstance];
    AFHTTPSessionManager* session = service.sessionManager;
    //Request
    [session.requestSerializer setValue:@"token xxxxxx" forHTTPHeaderField:@"Authorization"];
    session.requestSerializer.timeoutInterval = 4.f;
    
    
    //Response
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", nil];
    
    [service doPostWithURL:@"http://localhost:8802/base-login/v1/api/mobile/user/authentication" param:@{ @"username":@"liangtong", @"password":@"xxxx", @"appId":@"8c41f00f-8870-469d-8180-5d9e556f0170", } complete:^(NSString * error, id retObj) {
        
    }];
}



@end
