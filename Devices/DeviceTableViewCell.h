//
//  DeviceTableViewCell.h
//  react-native-connect-sdk
//
//  Created by Shwet Solanki on 10/03/21.
//

#import <UIKit/UIKit.h>
#import "ConnectableDevice.h"


NS_ASSUME_NONNULL_BEGIN

@interface DeviceTableViewCell : UITableViewCell
-(void)configureCell: (ConnectableDevice *)device currentDevice: (ConnectableDevice *)currentDevice;
@end

NS_ASSUME_NONNULL_END
