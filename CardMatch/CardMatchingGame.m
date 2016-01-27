//
//  CardMatchingGame.m
//  CardMatch
//
//  Created by 王晴 on 16/1/26.
//  Copyright © 2016年 王晴. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; // of card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return  self;
}

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 1;
static const int COST_TO_CHOOSE = 1;

- (void)choosenCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
//            int cardIndex = 0;
            for (Card *otherCard in self.cards) {
//                cardIndex++;
                if (otherCard.isChosen && !otherCard.isMatched) {
                    BOOL findCard = NO;
                    for (Card *otherCard2 in self.cards){
                         if (otherCard2.isChosen && !otherCard2.isMatched && ![otherCard2.contents isEqualToString:otherCard.contents]) {
                             findCard = YES;
                             int matchScore = [card match:@[otherCard,otherCard2]];
                             if (matchScore) {
                                 self.score += matchScore * MATCH_BONUS;
                                 card.matched = YES;
                                 otherCard.matched = YES;
                                 otherCard2.matched = YES;
                             }else{
                                 self.score -= MISMATCH_PENALTY;
                                 otherCard.chosen = NO;
                                 otherCard2.chosen = NO;
                             }
                             break;
                         }
                    }
                    if (!findCard) {
                        int matchScore = [card match:@[otherCard]];
                        if (!matchScore) {
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                        }
                        break;
                    }
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
