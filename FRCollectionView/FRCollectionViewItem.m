//
//  FRCollectionViewItem.m
//  FRCollectionView
//
//  Created by Fan's iMac  on 2018/1/23.
//  Copyright © 2018年 Fan's iMac . All rights reserved.
//

#import "FRCollectionViewItem.h"
#import "FRCollectionViewItemView.h"

@interface FRCollectionViewItem ()

@end

@implementation FRCollectionViewItem

- (void)loadView {
    self.view = [[FRCollectionViewItemView alloc] init];
    

    self.iv = [[NSImageView alloc] initWithFrame:self.view.bounds];
    self.iv.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.view addSubview:self.iv];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
