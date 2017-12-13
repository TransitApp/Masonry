//
//  MASLayoutGuideAttribute.h
//  Masonry
//
//  Created by Felix Lapalme on 2017-12-11.
//  Copyright © 2017 Jonas Budelmann. All rights reserved.
//

#import "MASUtilities.h"
#import "MASAttribute.h"

@interface MASLayoutGuideAttribute : NSObject <MASAttribute>

/**
 *  The view which the reciever relates to. Can be nil if item is not a view.
 */
@property (nonatomic, weak, readonly) MAS_LAYOUT_GUIDE *layoutGuide;

/**
 *  The item which the reciever relates to.
 */
@property (nonatomic, weak, readonly) id item;

/**
 *  The attribute which the receiver relates to
 */
@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttribute;

/**
 *  Convenience initializer.
 */
- (id)initWithLayoutGuide:(MAS_LAYOUT_GUIDE *)layoutGuide layoutAttribute:(NSLayoutAttribute)layoutAttribute;

/**
 *  The designated initializer.
 */
- (id)initWithLayoutGuide:(MAS_LAYOUT_GUIDE *)layoutGuide item:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute;

/**
 *    Determine whether the layoutAttribute is a size attribute
 *
 *    @return    YES if layoutAttribute is equal to NSLayoutAttributeWidth or NSLayoutAttributeHeight
 */
- (BOOL)isSizeAttribute;

@end
