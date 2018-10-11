//
//  ViewController.m
//  scrollTest
//
//  Created by iss on 2018/10/10.
//  Copyright © 2018年 yqy. All rights reserved.
//

#import "ViewController.h"
#import "CMWifiTransferScrollView2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CMWifiTransferScrollView2 *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.dataSource = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    [self.scrollView reloadData];
}

- (IBAction)test:(id)sender {
    self.scrollView.dataSource = @[@"a",@"b"];
    [self.scrollView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
