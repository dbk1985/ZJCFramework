//
//  ZJNetWorkingController.m
//  zjcdFramework_Example
//
//  Created by alan on 2020/11/14.
//  Copyright © 2020 Alan. All rights reserved.
//

#import "ZJNetWorkingController.h"
#import <ZJCFramework/ZJFramework.h>

@interface ZJNetWorkingController ()

@end

@implementation ZJNetWorkingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleNetWorking];
}

- (void)handleNetWorking
{
    // 通常放在appdelegate就可以了
    [ZJNetworking updateBaseUrl:@"http://apistore.baidu.com"];
    [ZJNetworking enableInterfaceDebug:YES];
    
    // 配置请求和响应类型，由于部分伙伴们的服务器不接收JSON传过去，现在默认值改成了plainText
    [ZJNetworking configRequestType:ZJRequestTypePlainText
                        responseType:ZJResponseTypeJSON
                 shouldAutoEncodeUrl:YES
             callbackOnCancelRequest:NO];
    
    /*
     [HYBNetworking.m：in line: 189]-->[message:
     absoluteUrl: http://apistore.baidu.com/microservice/cityinfo?cityname=%E5%8C%97%E4%BA%AC
     params:(null)
     response:{
     errNum = 0;
     retData =     {
     cityCode = 101010100;
     cityName = "\U5317\U4eac";
     provinceName = "\U5317\U4eac";
     telAreaCode = 010;
     zipCode = 100000;
     };
     retMsg = success;
     }
     ]
     */
    
    // 设置GET、POST请求都缓存
    [ZJNetworking cacheGetRequest:YES shoulCachePost:YES];
    
    // 测试GET API
    NSString *url = @"http://api.map.baidu.com/telematics/v3/weather?location=嘉兴&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ";
    //   设置请求类型为text/html类型
    //  [HYBNetworking configRequestType:kHYBRequestTypePlainText];
    //  [HYBNetworking configResponseType:kHYBResponseTypeData];
    // 如果请求回来的数据是业务数据，但是是失败的，这时候需要外部开发人员才能判断是业务失败。
    // 内部处理是只有走failure的才能判断为无效数据，才不会缓存
    // 如果设置为YES,则每次会去刷新缓存，也就是不会读取缓存，即使已经缓存起来
    // 新下载的数据会重新缓存起来
    [ZJNetworking getWithUrl:url refreshCache:NO params:nil progress:^(int64_t bytesRead, int64_t totalBytesRead) {
      NSLog(@"progress: %f, cur: %lld, total: %lld",
            (bytesRead * 1.0) / totalBytesRead,
            bytesRead,
            totalBytesRead);
    } success:^(id response) {
      
    } fail:^(NSError *error) {
      
    }];
    
    
    // 测试POST API：
    // 假数据
    NSDictionary *postDict = @{ @"urls": @"http://www.henishuo.com/git-use-inwork/",
                                @"goal" : @"site",
                                @"total" : @(123)
                                };
    NSString *path = @"/urls?site=www.henishuo.com&token=bRidefmXoNxIi3Jp";
    // 由于这里有两套基础路径，用时就需要更新
    [ZJNetworking updateBaseUrl:@"http://data.zz.baidu.com"];
    // 每次刷新缓存
    // 如果获取到的业务数据是不正确的，则需要下次调用时设置为YES,表示要刷新缓存
  // HYBURLSessionTask *task =
    [ZJNetworking postWithUrl:path refreshCache:YES params:postDict success:^(id response) {
      
    } fail:^(NSError *error) {
      
    }];
    
    // 取消全部请求
  //  [HYBNetworking cancelAllRequest];
    
    // 取消单个请求方法一
  //  [HYBNetworking cancelRequestWithURL:path];
    
    // 取消单个请求方法二
  //  [task cancel];
    
    NSLog(@"%lld", [ZJNetworking totalCacheSize]);
  //  [HYBNetworking clearCaches];
    
     path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/b.zip"];
  [ZJNetworking downloadWithUrl:@"http://wiki.lbsyun.baidu.com/cms/iossdk/sdk/BaiduMap_IOSSDK_v2.10.2_All.zip" saveToPath:path progress:^(int64_t bytesRead, int64_t totalBytesRead) {
      
    } success:^(id response) {
      
    } failure:^(NSError *error) {
      
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
