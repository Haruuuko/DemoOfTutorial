//
//  PlayingCardDeck.m
//  CardMatch
//
//  Created by 王晴 on 16/1/26.
//  Copyright © 2016年 王晴. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init{
    self = [super init];
    if (self) {
        for (NSString * suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
        
    }
    return self; 
}


@end
