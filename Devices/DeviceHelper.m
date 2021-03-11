//
//  DeviceHelper.m
//  react-native-connect-sdk
//
//  Created by Shwet Solanki on 10/03/21.
//

#import "DeviceHelper.h"

@implementation DeviceHelper
+ (NSString *) nameForDevice:(ConnectableDevice *)device
{
    NSString *name;
    
    if (device.serviceDescription.friendlyName && device.serviceDescription.friendlyName.length > 0)
        name = device.serviceDescription.friendlyName;
    else if (device.serviceDescription.address && device.serviceDescription.address.length > 0)
        name = device.serviceDescription.address;
    else
        name = [[NSBundle mainBundle] localizedStringForKey:@"Connect_SDK_Unnamed_Device" value:@"Unnamed device" table:@"ConnectSDK"];
    
    return name;
}

@end
