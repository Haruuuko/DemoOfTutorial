//
//  Deck.h
//  CardMatch
//
//  Created by 王晴 on 16/1/23.
//  Copyright © 2016年 王晴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
