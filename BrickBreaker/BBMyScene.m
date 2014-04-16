//
//  BBMyScene.m
//  BrickBreaker
//
//  Created by J Hastwell on 16/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import "BBMyScene.h"

@implementation BBMyScene
{
    SKSpriteNode *_paddle;
    CGPoint _touchLocation;
}


static const uint32_t kBallCategory   = 0x1 << 0;
static const uint32_t kPaddleCategory = 0x1 << 1;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

        // Turn off gravity.
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
        // Set contact delgate.
        self.physicsWorld.contactDelegate = self;
        
        // Setup edge.
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        [self createBallWithLocation:CGPointMake(size.width * 0.5, size.height * 0.5)
                         andVelocity:CGVectorMake(40, 180)];
        
        
        _paddle = [SKSpriteNode spriteNodeWithImageNamed:@"Paddle"];
        _paddle.position = CGPointMake(self.size.width * 0.5, 90);
        _paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_paddle.size];
        _paddle.physicsBody.dynamic = NO;
        _paddle.physicsBody.categoryBitMask = kPaddleCategory;
        [self addChild:_paddle];
        
    }
    return self;
}

-(SKSpriteNode*)createBallWithLocation:(CGPoint)position andVelocity:(CGVector)velocity
{
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"BallBlue"];
    ball.name = @"ball";
    ball.position = position;
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
    ball.physicsBody.friction = 0.0;
    ball.physicsBody.linearDamping = 0.0;
    ball.physicsBody.restitution = 1.0;
    ball.physicsBody.velocity = velocity;
    ball.physicsBody.categoryBitMask = kBallCategory;
    ball.physicsBody.contactTestBitMask = kPaddleCategory;
    [self addChild:ball];
    return ball;
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        _touchLocation = [touch locationInNode:self];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        // Calculate how far touch has moved on x axis.
        CGFloat xMovement = [touch locationInNode:self].x - _touchLocation.x;
        // Move paddle distance of touch.
        _paddle.position = CGPointMake(_paddle.position.x + xMovement, _paddle.position.y);
        
        CGFloat paddleMinX = -_paddle.size.width * 0.25;
        CGFloat paddleMaxX = self.size.width + (_paddle.size.width * 0.25);
        
        // Cap paddle's position so it remains on screen.
        if (_paddle.position.x < paddleMinX) {
            _paddle.position = CGPointMake(paddleMinX, _paddle.position.y);
        }
        if (_paddle.position.x > paddleMaxX) {
            _paddle.position = CGPointMake(paddleMaxX, _paddle.position.y);
        }
        
        _touchLocation = [touch locationInNode:self];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

















