//
//  ViewController.m
//  AMap.TEST
//
//  Created by Chris on 2017/4/18.
//  Copyright © 2017年 chris. All rights reserved.
//

#import "ViewController.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface ViewController ()

/** mapView */
@property (nonatomic, weak) MAMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化地图
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView = mapView;
    
    //把地图添加至view
    [self.view addSubview:mapView];
    
    //地图显示时,自动定位到当前位置
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    MAUserLocationRepresentation *locationRepresentation = [MAUserLocationRepresentation new];
    //精度圈是否显示，默认YES
    locationRepresentation.showsAccuracyRing = YES;
    //是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
    locationRepresentation.showsHeadingIndicator = YES;
    //精度圈默认颜色
    locationRepresentation.fillColor = kAccuracyCircleDefaultColor;
    //精度圈 边线颜色, 默认 kAccuracyCircleDefaultColor
    locationRepresentation.strokeColor = [UIColor purpleColor];
    //精度圈 边线宽度，默认0
    locationRepresentation.lineWidth = 2;
    //内部蓝色圆点是否使用律动效果, 默认YES
    locationRepresentation.enablePulseAnnimation = NO;
    //定位点背景色，不设置默认白色
    locationRepresentation.locationDotBgColor = [UIColor greenColor];
    //定位点蓝色圆点颜色，不设置默认蓝色
    locationRepresentation.locationDotFillColor = [UIColor grayColor];
    //定位图标, 与蓝色原点互斥
    locationRepresentation.image = [UIImage imageNamed:@"icon"];
    
    [_mapView updateUserLocationRepresentation:locationRepresentation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
