//
//  BBMenu.h
//  BrickBreaker
//
//  Created by J Hastwell on 23/04/2014.
//  Copyright (c) 2014 J Hastwell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BBMenu : SKNode

@property (nonatomic) int levelNumber;

-(void)hide;
-(void)show;

@end
