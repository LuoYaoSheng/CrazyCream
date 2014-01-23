//
//  CICGameButton.m
//  CrazyIceCream
//
//  Created by 郭历成 ( titm@tom.com ) on 14-1-9.
//  Copyright (c) 2014年 Wuxiantai Developer ( http://www.wuxiantai.com ). All rights reserved.
//

#import "CICGameButton.h"
#import "CICGameSoundManager.h"

@implementation CICGameButton

- (SPDisplayObject*)hitTestPoint:(SPPoint*)localPoint forTouch:(BOOL)isTouch
{
    // when the user touches the screen, this method is used to find out if it hit an object.
    // by default, this method uses the bounding box.
    // by overriding this method, we can change the box (rectangle) to a circle (or whatever
    // necessary).
    
    // when the hit test is done to check if a touch is hitting the object, invisible or
    // untouchable objects must cause the hit test to fail.
    if (isTouch && (!self.visible || !self.touchable))
        return nil;
    
    // get center of button
    SPRectangle *bounds = self.bounds;
    float centerX = bounds.width / 2;
    float centerY = bounds.height / 2;
    
    // calculate distance of localPoint to center.
    // we keep it squared, since we want to avoid the 'sqrt()'-call.
    float sqDist = (localPoint.x - centerX) * (localPoint.x - centerX) +
    (localPoint.y - centerY) * (localPoint.y - centerY);
    
    // when the squared distance is smaller than the squared radius, the point is inside
    // the circle
    float radius = bounds.width / 2 * 0.9;
    if (sqDist < radius * radius) return self;
    else return nil;
}

@end