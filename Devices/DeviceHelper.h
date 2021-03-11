//
//  DeviceHelper.h
//  react-native-connect-sdk
//
//  Created by Shwet Solanki on 10/03/21.
//

#import <Foundation/Foundation.h>
#import "ConnectableDevice.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeviceHelper : NSObject
+ (NSString *) nameForDevice:(ConnectableDevice *)device;
@end

NS_ASSUME_NONNULL_END
