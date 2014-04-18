//
//  BBBrick.h
//  BrickBreaker
//
//  Created by J Hastwell on 17/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum : NSUInteger {
    Green = 1,
    Blue = 2,
    Grey = 3,
} BrickType;

static const uint32_t kBrickCategory = 0x1 << 2;


@interface BBBrick : SKSpriteNode

@property (nonatomic) BrickType type;
@property (nonatomic) BOOL indestructible;

-(instancetype)initWithType:(BrickType)type;
-(void)hit;


@end
