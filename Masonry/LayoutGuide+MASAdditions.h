//
//  LayoutGuide+MASAdditions.h
//  Masonry iOS
//
//  Created by Felix Lapalme on 2017-12-11.
//  Copyright © 2017 Jonas Budelmann. All rights reserved.
//

#import "Masonry.h"
#import "MASLayoutGuideAttribute.h"

@interface MAS_LAYOUT_GUIDE (MASAdditions)

@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_left;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_top;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_right;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_bottom;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_leading;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_trailing;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_width;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_height;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_centerX;
@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *mas_centerY;

@property (nonatomic, strong, readonly) MASLayoutGuideAttribute *(^mas_attribute)(NSLayoutAttribute attr);

/**
 *    a key to associate with this view
 */
@property (nonatomic, strong) id mas_key;

/**
 *    Finds the closest common superview between this view and another view
 *
 *    @param    view    other view
 *
 *    @return    returns nil if common superview could not be found
 */
- (MAS_VIEW *)mas_closestCommonSuperview:(MAS_VIEW *)view;

/**
 *  Creates a MASConstraintMaker with the callee view.
 *  Any constraints defined are added to the view or the appropriate superview once the block has finished executing
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the view.
 *
 *  @return Array of created MASConstraints
 */
- (NSArray *)mas_makeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with the callee view.
 *  Any constraints defined are added to the view or the appropriate superview once the block has finished executing.
 *  If an existing constraint exists then it will be updated instead.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the view.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_updateConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with the callee view.
 *  Any constraints defined are added to the view or the appropriate superview once the block has finished executing.
 *  All constraints previously installed for the view will be removed.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the view.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_remakeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

@end
