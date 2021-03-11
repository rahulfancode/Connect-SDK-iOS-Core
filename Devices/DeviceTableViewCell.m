//
//  DeviceTableViewCell.m
//  react-native-connect-sdk
//
//  Created by Shwet Solanki on 10/03/21.
//

#import "DeviceTableViewCell.h"
#import "DeviceHelper.h"

@implementation DeviceTableViewCell {
    UILabel * label;
    UIButton * button;
    UIStackView * containerView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupContainerView];
        [self setupLabel];
        [self setupButton];
    }
    return self;
}

- (void)setupContainerView {
    containerView = [[UIStackView alloc] initWithFrame:self.contentView.bounds];
    [containerView setTranslatesAutoresizingMaskIntoConstraints:false];
    [self.contentView addSubview:containerView];
    
    [containerView setLayoutMarginsRelativeArrangement:true];
    if (@available(iOS 11.0, *)) {
        [containerView setDirectionalLayoutMargins:NSDirectionalEdgeInsetsMake(0, 16, 0, 16)];
    } else {
        // Fallback on earlier versions
    }
    [containerView setAlignment:UIStackViewAlignmentCenter];
    [containerView setDistribution:UIStackViewDistributionEqualSpacing];
    [containerView setAxis:UILayoutConstraintAxisHorizontal];
    
    [containerView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = true;
    [containerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = true;
    [containerView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = true;
    [containerView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = true;
}

- (void)setupLabel {
    label = [[UILabel alloc] init];
    [label setFont: [UIFont fontWithName:@"NotoSansDisplay-Regular" size:16]];
    [containerView addArrangedSubview:label];
}

- (void)setupButton {
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"DISCONNECT" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"NotoSansDisplay-SemiBold" size:12]];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:80.0/255.0 blue:0/255 alpha:1.0]];
    [button.widthAnchor constraintEqualToConstant:122].active = true;
    [button.heightAnchor constraintEqualToConstant:32].active = true;
    [button.layer setCornerRadius:4];
    [button.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.12].CGColor];
    [button.layer setShadowRadius:4];
    [button setEnabled:false];
    [button.layer setShadowOffset:CGSizeMake(0, 2)];
    
    [containerView addArrangedSubview:button];
}

-(void)disconnectPressed {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCell: (ConnectableDevice *)device currentDevice: (ConnectableDevice *)currentDevice {
    NSString *deviceName = [DeviceHelper nameForDevice:device];
    [label setText:deviceName];
    [button setHidden:![currentDevice.serviceDescription.address isEqualToString:device.serviceDescription.address]];
}

/*
 NSString *deviceName = [self nameForDevice:device];
 [cell.textLabel setText:deviceName];

 #ifdef DEBUG
     [cell.detailTextLabel setText:[device connectedServiceNames]];
 #endif

     if (_showServiceLabel)
         [cell.detailTextLabel setText:[device connectedServiceNames]];

     if (self.currentDevice)
     {
         if ([self.currentDevice.serviceDescription.address isEqualToString:device.serviceDescription.address])
             [cell setAccessoryType: UITableViewCellAccessoryDetailButton];
         else
             [cell setAccessoryType:UITableViewCellAccessoryNone];
     }

 */

@end
