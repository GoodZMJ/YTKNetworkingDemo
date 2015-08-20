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
    requestBean.tel = _phoneTF.text;
    
    [requestBean startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        ResponseSearchTel *response = (ResponseSearchTel *)request.responseBean;
        
        TelInfo *tel = response.retData;
        
        NSString *result = [NSString stringWithFormat:@"手机号码： %@\n省份：%@\n运营商：%@", tel.telString, tel.province, tel.carrier];
        
        _resultLabel.text = result;
        
    } failure:^(YTKBaseRequest *request) {
        
        NSLog(@"faild: %ld -- %@", request.responseStatusCode, request.responseString);
        
    }];
    
}
@end
