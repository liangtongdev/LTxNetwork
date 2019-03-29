# LTxNetwork
#### http service

Depend on **AFNetworking**

+ GET
+ POST
+ PUT
+ DELETE

##### Demo

```objective-c
[[LTxNetworkHttpService sharedInstance] doPostWithURL:@"http://localhost:8802/base-login/v1/api/mobile/user/authentication" param:@{ @"username":@"liangtong", @"password":@"xxxx", @"appId":@"8c41f00f-8870-469d-8180-5d9e556f0170", } complete:^(NSString * error, id retObj) {
        
}];
```



##### More Configuration

```objective-c
LTxNetworkHttpService* service = [LTxNetworkHttpService sharedInstance];
    AFHTTPSessionManager* session = service.sessionManager;
    //Request
    [session.requestSerializer setValue:@"token xxxxxx" forHTTPHeaderField:@"Authorization"];
    session.requestSerializer.timeoutInterval = 4.f;
    
    
    //Response
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", nil];
```

#### download task

Use **dispatch_semaphore_t**  and **dispatch_queue_t** to limit the number of Downloads.

Use **NSURLSession** and **NSOperationQueue** to download items.

##### Demo

```objective-c
NSString* url = @"https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf";
[[LTxNetworkDownloadService sharedInstance] addDownloadTaskWithURL:url pathInSandbox:@"Library/Caches" saveName:@"test_download.pdf"];
```

##### Configuration

`LTxConfig.plist` in main bundle.

+ backgroundDownload - BOOL
  + background download enable
  + XCode - Target - Capabilities - Background Modes
+ maxDownloadingCount - Integer
  + the downloading number at a moment

``` xml
	<key>download</key>
	<dict>
		<key>backgroundDownload</key>
		<false/>
		<key>maxDownloadingCount</key>
		<integer>2</integer>
	</dict>
```



#### License

MIT

