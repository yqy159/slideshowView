//
//  CMWifiTransferScrollView2.h
//  AFNetworking
//
//  Created by iss on 2018/10/9.
//

#import <UIKit/UIKit.h>

@interface CMWifiTransferScrollView2 : UIView

/**
 数据源
 */
@property (nonatomic, strong) NSArray <NSString *> *dataSource;

- (void)reloadData;

- (void)deallocView;
@end
