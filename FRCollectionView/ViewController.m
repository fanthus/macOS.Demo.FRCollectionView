//
//  ViewController.m
//  FRCollectionView
//
//  Created by Fan's iMac  on 1/23/18.
//  Copyright © 2018 Fan's iMac . All rights reserved.
//

#import "ViewController.h"
#import "FRCollectionViewItem.h"
#import "AppDelegate.h"

@interface ViewController()<NSCollectionViewDelegate,NSCollectionViewDataSource> {
    NSCollectionView *colView;
    NSMutableArray *images;
    NSScrollView *scrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    images = [NSMutableArray arrayWithCapacity:0];
    //
    [self prepareData];
    //
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.wantsLayer = YES;
    [self.collectionView registerClass:[FRCollectionViewItem class] forItemWithIdentifier:@"fr_item"];
    //
    NSCollectionViewFlowLayout *flowLayout = [[NSCollectionViewFlowLayout alloc]  init];
    flowLayout.itemSize = NSMakeSize(100, 100);
    flowLayout.sectionInset = NSEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.minimumInteritemSpacing = 20.0;
    flowLayout.minimumLineSpacing = 20.0;
    self.collectionView.collectionViewLayout = flowLayout;
    [self.collectionView reloadData];
}

- (void)viewDidAppear {
    NSWindow *window = self.view.window;
    self.view.frame = NSMakeRect(0, 0, window.frame.size.width, window.frame.size.height);
}

- (void)prepareData {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *rootPath = @"/Library/Desktop Pictures";
    NSError *error = nil;
    NSArray *paths = [fileManager contentsOfDirectoryAtPath:rootPath error:&error];
    for (NSString *path in paths) {
        NSString *imagePath = [rootPath stringByAppendingFormat:@"/%@",path];
        NSLog(@"imagepath = %@",imagePath);
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:imagePath];
        if (image) {
            [images addObject:image];
        }
    }
}

#pragma mark - NSCollectionViewDelegate


- (NSSet<NSIndexPath *> *)collectionView:(NSCollectionView *)collectionView shouldChangeItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths toHighlightState:(NSCollectionViewItemHighlightState)highlightState {
    return indexPaths;
}

#pragma mark - NSCollectionViewDataSource

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView {
    return 1;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    FRCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"fr_item" forIndexPath:indexPath];
    item.iv.image = [images objectAtIndex:indexPath.item];
    item.view.menu  = [self rightMenu];
    return item;
}

- (NSMenu *)rightMenu {
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Right"];
    NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:@"ClickMe" action:@selector(click:) keyEquivalent:@"\r"];
    [menu addItem:menuItem];
    return  menu;
}

- (void)click:(id)sender {
    NSLog(@"click me");
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
