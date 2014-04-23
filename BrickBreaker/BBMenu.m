//
//  BBMenu.m
//  BrickBreaker
//
//  Created by J Hastwell on 23/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import "BBMenu.h"

@implementation BBMenu
{
    SKSpriteNode *_menuPanel;
    SKSpriteNode *_playButton;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _menuPanel = [SKSpriteNode spriteNodeWithImageNamed:@"MenuPanel"];
        _menuPanel.position = CGPointZero;
        [self addChild:_menuPanel];
        
        
        _playButton = [SKSpriteNode spriteNodeWithImageNamed:@"Button"];
        _playButton.position = CGPointMake(0, -((_menuPanel.size.height * 0.5) + (_playButton.size.height * 0.5) + 10));
        [self addChild:_playButton];
        
    }
    return self;
}


-(void)show
{
    
}

-(void)hide
{
    
}


@end
