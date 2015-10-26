//
//  ViewController.m
//  YTKDemo
//
//  Created by 钟宝健 on 15/8/14.
//  Copyright © 2015年 joiway. All rights reserved.
//

#import "ViewController.h"
#import "RequestSearchTel.h"
#import "ResponseSearchTel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)searchBtnClick:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchBtnClick:(id)sender
{
    
    RequestSearchTel *requestBean = [[RequestSearchTel alloc] init];
    requestBean.tel_local = _phoneTF.text;
    
    // 忽略测试
    requestBean.telNum = 1008611;
    
    [requestBean startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        ResponseSearchTel *response = (ResponseSearchTel *)request.responseBean;
        
        TelInfo *tel = response.retData;
        
        NSLog(@"返回结果:%@", [tel description]);
        NSString *result = [NSString stringWithFormat:@"手机号码： %@\n省份：%@\n运营商：%@\n城市：%@\n%@\n%@", tel.phone, tel.province, tel.supplier, tel.city, tel.suit, tel.prefix];
        
        _resultLabel.text = result;
        
    } failure:^(YTKBaseRequest *request) {
        
        NSLog(@"faild: %ld -- %@", request.responseStatusCode, request.responseString);
        
    }];
    
}
@end
