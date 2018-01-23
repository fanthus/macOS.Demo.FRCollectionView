//
//  FRCollectionViewItemView.m
//  FRCollectionView
//
//  Created by Fan's iMac  on 2018/1/23.
//  Copyright © 2018年 Fan's iMac . All rights reserved.
//

#import "FRCollectionViewItemView.h"

@interface FRCollectionViewItemView () {
    BOOL clicked;
}
@end

@implementation FRCollectionViewItemView

- (void)mouseDown:(NSEvent *)event {
    clicked = YES;
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)event {
    clicked = NO;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (clicked) {
        NSBezierPath *path = [NSBezierPath bezierPathWithRect:dirtyRect];
        [[NSColor greenColor] setStroke];
        [path stroke];
        [[NSColor colorWithCalibratedRed: 0.851 green: 0.851 blue: 0.851 alpha: 1] setFill];
        [path fill];

    }
}

@end
