//
//  YLViewController.m
//  YLNetClient
//
//  Created by 2510479687@qq.com on 04/01/2019.
//  Copyright (c) 2019 2510479687@qq.com. All rights reserved.
//

#import "YLViewController.h"
#import "YLCustomNetConfig.h"
#import "YLNetworkTool.h"
#import "YLUserModel.h"
#import "YLRequestControl.h"



@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [YLRequestControl loginViewParamter:@{@"username":@"chaney",@"password":@"afdd0b4ad2ec172c586e2150770fbf9e"} inView:self.view ret:^(YLDataModel * _Nonnull result, YLUserModel *data, NSString * _Nullable errorMessage) {
        if ([YLDataModel handleResult:result]) {
            ;
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
