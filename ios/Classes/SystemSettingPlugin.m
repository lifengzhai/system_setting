#import "SystemSettingPlugin.h"

@implementation SystemSettingPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"system_setting" binaryMessenger:[registrar messenger]];
    UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    SystemSettingPlugin *instance = [[SystemSettingPlugin alloc] initWithViewController:viewController];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void) handelMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"gotoSetting" isEqualToString:call.method]) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            result(nil);
        }
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
