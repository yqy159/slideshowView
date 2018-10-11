//
//  CMWifiTransferScrollView2.m
//  AFNetworking
//
//  Created by iss on 2018/10/9.
//

#import "CMWifiTransferScrollView2.h"
#import "UIView+Frame.h"

@interface CMWifiTransferScrollView2 ()
@property (nonatomic, strong) UILabel *titleLabelOne;
@property (nonatomic, strong) UILabel *titleLabelTwo;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger index; //记录下次展示数组中的第几个元素
@end
@implementation CMWifiTransferScrollView2

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.clipsToBounds = YES;
}

- (UILabel *)titleLabelOne {
    if (!_titleLabelOne) {
        _titleLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _titleLabelOne.backgroundColor = [UIColor clearColor];
        _titleLabelOne.textColor = [UIColor redColor];
        _titleLabelOne.textAlignment = NSTextAlignmentCenter;
        _titleLabelOne.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabelOne];
    }
    return _titleLabelOne;
}

- (UILabel *)titleLabelTwo {
    if (!_titleLabelTwo) {
        _titleLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.width, self.height)];
        _titleLabelTwo.backgroundColor = [UIColor clearColor];
        _titleLabelTwo.textColor = [UIColor greenColor];
        _titleLabelTwo.textAlignment = NSTextAlignmentCenter;
        _titleLabelTwo.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabelTwo];
    }
    return _titleLabelTwo;
}

- (void)setDataSource:(NSArray<NSString *> *)dataSource {
    
    _dataSource = dataSource;
}

- (void)reloadData {
    [self reloadLabel];
    if (self.timer && [self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.titleLabelOne.text = self.dataSource[0];
    self.titleLabelTwo.text = self.dataSource[1];
    _index = 1;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)reloadLabel {
    [self.titleLabelOne.layer removeAllAnimations];
    [self.titleLabelTwo.layer removeAllAnimations];
    [self.titleLabelOne removeFromSuperview];
    self.titleLabelOne = nil;
    [self.titleLabelTwo removeFromSuperview];
    self.titleLabelTwo = nil;
    _index = 0;
}

- (void)startAnimation {
    
    [UIView animateWithDuration:0.5 delay:1 options:0 animations:^{
        if (self.titleLabelOne.top == 0) {
            self.titleLabelOne.top = -self.height;
            self.titleLabelTwo.top = 0;
        }else {
            self.titleLabelOne.top = 0;
            self.titleLabelTwo.top = -self.height;
        }
    } completion:^(BOOL finished) {
        if (finished) {
            self.index++;
            if (self.index > self.dataSource.count - 1) {
                self.index = 0;
            }
            if (self.titleLabelOne.top == -self.height) {
                self.titleLabelOne.top = self.height;
                self.titleLabelOne.text = self.dataSource[self.index];
            }
            if (self.titleLabelTwo.top == -self.height) {
                self.titleLabelTwo.top = self.height;
                self.titleLabelTwo.text = self.dataSource[self.index];
            }
        }
    }];
}

- (void)deallocView {
    if (self.timer && [self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
