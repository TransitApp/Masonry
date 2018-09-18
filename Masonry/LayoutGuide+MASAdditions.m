//
//  LayoutGuide+MASAdditions.m
//  Masonry iOS
//
//  Created by Felix Lapalme on 2017-12-11.
//  Copyright © 2017 Jonas Budelmann. All rights reserved.
//

#import "LayoutGuide+MASAdditions.h"
#import <objc/runtime.h>

@implementation MAS_LAYOUT_GUIDE (MASAdditions)

- (MASLayoutGuideAttribute *)mas_left {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeLeft];
}

- (MASLayoutGuideAttribute *)mas_top {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeTop];
}

- (MASLayoutGuideAttribute *)mas_right {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeRight];
}

- (MASLayoutGuideAttribute *)mas_bottom {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeBottom];
}

- (MASLayoutGuideAttribute *)mas_leading {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeLeading];
}

- (MASLayoutGuideAttribute *)mas_trailing {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeTrailing];
}

- (MASLayoutGuideAttribute *)mas_width {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeWidth];
}

- (MASLayoutGuideAttribute *)mas_height {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeHeight];
}

- (MASLayoutGuideAttribute *)mas_centerX {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeCenterX];
}

- (MASLayoutGuideAttribute *)mas_centerY {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeCenterY];
}

- (MASLayoutGuideAttribute *)mas_baseline {
    return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:NSLayoutAttributeBaseline];
}

- (MASLayoutGuideAttribute *(^)(NSLayoutAttribute))mas_attribute
{
    return ^(NSLayoutAttribute attr) {
        return [[MASLayoutGuideAttribute alloc] initWithLayoutGuide:self layoutAttribute:attr];
    };
}

- (NSArray *)mas_makeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithLayoutGuide:self];
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_updateConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithLayoutGuide:self];
    constraintMaker.updateExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_remakeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithLayoutGuide:self];
    constraintMaker.removeExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

#pragma mark - associated properties

- (id)mas_key {
    return objc_getAssociatedObject(self, @selector(mas_key));
}

- (void)setMas_key:(id)key {
    objc_setAssociatedObject(self, @selector(mas_key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - heirachy

- (MAS_VIEW *)mas_closestCommonSuperview:(MAS_VIEW *)view {
    MAS_VIEW *closestCommonSuperview = nil;
    
    MAS_VIEW *secondViewSuperview = view;
    while (!closestCommonSuperview && secondViewSuperview) {
        MAS_VIEW *firstViewSuperview = self.owningView;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}

@end
