//
//  MASLayoutGuideAttribute.m
//  Masonry
//
//  Created by Felix Lapalme on 2017-12-11.
//  Copyright © 2017 Jonas Budelmann. All rights reserved.
//

#import "MASLayoutGuideAttribute.h"

@implementation MASLayoutGuideAttribute

- (id)initWithLayoutGuide:(MAS_LAYOUT_GUIDE *)layoutGuide layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    self = [self initWithLayoutGuide:layoutGuide item:layoutGuide layoutAttribute:layoutAttribute];
    return self;
}

- (id)initWithLayoutGuide:(MAS_LAYOUT_GUIDE *)layoutGuide item:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    self = [super init];
    if (!self) return nil;
    
    _layoutGuide = layoutGuide;
    _item = item;
    _layoutAttribute = layoutAttribute;
    
    return self;
}

- (BOOL)isSizeAttribute {
    return self.layoutAttribute == NSLayoutAttributeWidth
    || self.layoutAttribute == NSLayoutAttributeHeight;
}

- (BOOL)isEqual:(MASLayoutGuideAttribute *)viewAttribute {
    if ([viewAttribute isKindOfClass:self.class]) {
        return self.layoutGuide == viewAttribute.layoutGuide
        && self.layoutAttribute == viewAttribute.layoutAttribute;
    }
    return [super isEqual:viewAttribute];
}

- (NSUInteger)hash {
    return MAS_NSUINTROTATE([self.layoutGuide hash], MAS_NSUINT_BIT / 2) ^ self.layoutAttribute;
}

@synthesize view;

@end
