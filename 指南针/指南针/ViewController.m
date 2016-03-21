//
//  ViewController.m
//  指南针
//
//  Created by itheima on 16/3/20.
//  Copyright © 2016年 卢远立. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet UIImageView *compassImageView;

//位置管理器
@property (nonatomic, strong)  CLLocationManager *locManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //仅仅获取用户朝向,不用申请用户权限
    //开始更新用户朝向
    [self.locManager startUpdatingHeading];

}

//当更新用户的朝向的时候会调用该代理方法

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{

    //获取磁北方向,把角度值转化为弧度值
    CGFloat angle=newHeading.magneticHeading *(M_PI/180);
    
    //旋转图片
    self.compassImageView.transform=CGAffineTransformMakeRotation(-angle);

}

#pragma mark- 位置管理器懒加载
-(CLLocationManager *)locManager{
    if (_locManager == nil) {
        _locManager = [[CLLocationManager alloc] init];
        _locManager.delegate=self;
    }
    return _locManager;

}

@end
