//
//  DownloadDemoViewController.m
//  LTxNetworkDemo
//
//  Created by liangtong on 2019/3/29.
//  Copyright © 2019 LIANGTONG. All rights reserved.
//

#import "DownloadDemoViewController.h"
#import <LTxNetwork/LTxNetwork.h>

@interface DownloadDemoViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView1;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView2;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView3;


@end

@implementation DownloadDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Download";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveLocalNotification:) name:LTX_CORE_DOWNLOAD_TASK_PROGRESS_UPDATE_KEY object:nil];//下载进度更新
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveLocalNotification:) name:LTX_CORE_DOWNLOAD_TASK_STATE_UPDATE_KEY object:nil];//下载完成
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)downloadAction:(UIButton *)sender {
    
    /****
     * 可以在配置文件中配置最大同时下载的个数
     * 是否开启后台模式（需要应用相应的开关同时开启）
     ****/
    
    for (NSInteger i = 1; i < 10; ++i) {
        NSString* url = [NSString stringWithFormat:@"https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf?t=%td",i];
        [[LTxNetworkDownloadService sharedInstance] addDownloadTaskWithURL:url pathInSandbox:@"Library/Caches" saveName:[NSString stringWithFormat:@"test_download_%td.pdf",i]];
    }
}


-(void)recieveLocalNotification:(NSNotification*)notification{
    NSString* notificationKeyName = [notification name];
    NSDictionary* obj = notification.object;
    if ([notificationKeyName isEqualToString:LTX_CORE_DOWNLOAD_TASK_PROGRESS_UPDATE_KEY]) {//下载进度更新
        NSString* progressUrl = [obj objectForKey:@"url"];
        CGFloat progress = [[obj objectForKey:@"value"] floatValue];
        if ([progressUrl hasSuffix:@"1"]) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.progressView1 setProgress:progress animated:YES];
            });
        }else if ([progressUrl hasSuffix:@"2"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.progressView2 setProgress:progress animated:YES];
            });
        }else if ([progressUrl hasSuffix:@"3"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.progressView3 setProgress:progress animated:YES];
            });
        }
    }else if ([notificationKeyName isEqualToString:LTX_CORE_DOWNLOAD_TASK_STATE_UPDATE_KEY]) {//下载完成
        NSString* progressUrl = [obj objectForKey:@"url"];
        NSLog(@"%@ 下载完成！",progressUrl);
    }
}

@end
