//
//  BBBrick.m
//  BrickBreaker
//
//  Created by J Hastwell on 17/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import "BBBrick.h"

@implementation BBBrick


-(instancetype)initWithType:(BrickType)type
{
    
    switch (type) {
        case Green:
            self = [super initWithImageNamed:@"BrickGreen"];
            break;
        case Blue:
            self = [super initWithImageNamed:@"BrickBlue"];
            break;
        default:
            self = nil;
            break;
    }
    
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.categoryBitMask = kBrickCategory;
        self.physicsBody.dynamic = NO;
    }
    
    
    return self;
}


@end
