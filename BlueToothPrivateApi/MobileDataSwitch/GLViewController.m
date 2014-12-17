//
//  ViewController.m
//  MobileDataSwitch
//
//  Created by gongliang on 14/10/8.
//  Copyright (c) 2014年 GL. All rights reserved.
//

#import "GLViewController.h"
#import <BluetoothManager/BluetoothManager.h>
#import <MobileWiFi/MobileWiFi.h>
#import <objc/runtime.h>
//#import <SpringBoard/SBCCWiFiSetting.h>
#include <math.h>


extern BOOL CTCellularDataPlanGetIsEnabled();
extern void CTCellularDataPlanSetIsEnabled(BOOL enabled);

@interface GLViewController ()

@property (nonatomic, strong) BluetoothManager *btCont;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end






@implementation GLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //蜂窝数据
    self.mobileSwitch.on = CTCellularDataPlanGetIsEnabled();
    
    
    
    
    
//    WiFiManagerRef manager = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
//    if (!manager)
//        NSLog(@"ERROR: Couldn't create WiFiManagerClient!");
//    
//    CFArrayRef devices = WiFiManagerClientCopyDevices(manager);
//    if (!devices)
//        NSLog(@"ERROR: devices is NULL");
//    
//    CFArrayRef networks = WiFiManagerClientCopyNetworks(manager);
//    if (!networks)
//        NSLog(@"ERROR: networks is NULL");
//    
//    NSLog(@"manager: %@", manager);
//    NSLog(@"%d devices: %@", (int)CFArrayGetCount(devices), devices);
//    NSLog(@"%d networks: %@",(int)CFArrayGetCount(networks), networks);
//    
//    
//    //http://iphonedevwiki.net/index.php/MobileWiFi.framework
////    WiFiManagerRef manager = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
////    CFArrayRef devices = WiFiManagerClientCopyDevices(manager);
//    
//    WiFiDeviceClientRef client = (WiFiDeviceClientRef)CFArrayGetValueAtIndex(devices, 0);
//    CFDictionaryRef data = (CFDictionaryRef)WiFiDeviceClientCopyProperty(client, CFSTR("RSSI"));
//    CFNumberRef scaled = (CFNumberRef)WiFiDeviceClientCopyProperty(client, kWiFiScaledRSSIKey);
//    
//    CFNumberRef RSSI = (CFNumberRef)CFDictionaryGetValue(data, CFSTR("RSSI_CTL_AGR"));
//    
//    int raw;
//    CFNumberGetValue(RSSI, kCFNumberIntType, &raw);
//    
//    float strength;
//    CFNumberGetValue(scaled, kCFNumberFloatType, &strength);
//    CFRelease(scaled);
//    
//    strength *= -1;
//    
//    // Apple uses -3.0.
//    int bars = (int)ceilf(strength * -3.0f);
//    bars = MAX(1, MIN(bars, 3));
//    
//    
//    printf("WiFi signal strength: %d dBm\n\t Bars: %d\n", raw,  bars);
//    
//    CFRelease(data);
//    CFRelease(scaled);
//    CFRelease(devices);
//    CFRelease(manager);
    
    
    //蓝牙
    _btCont = [BluetoothManager sharedInstance];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _bluetooth.on = _btCont.enabled;
        NSLog(@"_bluetooth.on = %d", _bluetooth.on);
    });
    
}

- (IBAction)switchMobileData:(UISwitch *)sender {
    CTCellularDataPlanSetIsEnabled(sender.on);
    NSLog(@"蜂窝数据 %d", CTCellularDataPlanGetIsEnabled());
}


- (IBAction)switchBlueTooth:(UISwitch *)sender {
    [_btCont setEnabled:sender.on];
    [_btCont setPowered:sender.on];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
