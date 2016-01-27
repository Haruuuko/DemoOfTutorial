//
//  PlayingCard.h
//  CardMatch
//
//  Created by 王晴 on 16/1/26.
//  Copyright © 2016年 王晴. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger)maxRank;
@end
