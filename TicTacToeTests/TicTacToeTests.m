//
//  TicTacToeTests.m
//  TicTacToeTests
//
//  Created by id on 3/19/16.
//  Copyright © 2016 Brandon Gress. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TicTacToeBoard.h"

@interface TicTacToeTests : XCTestCase
@end

@implementation TicTacToeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGameState {
    // top row
    TicTacToeBoard *board = [[TicTacToeBoard alloc] initWithBoardSize:3 boardState:@"XXXOOOOOO"];
    board.playerTurn = @"X";
    XCTAssert([board currentGameState] == GameStateWon);

    // first column
    NSString *boardState = [NSString stringWithFormat:@"%@%@%@", @"XOX",
                                                                @"XOX",
                                                                @"XOO"
                  ];
    board = [[TicTacToeBoard alloc] initWithBoardSize:3 boardState:boardState];
    board.playerTurn = @"X";
    XCTAssert([board currentGameState] == GameStateWon);

    // game tied
    boardState = [NSString stringWithFormat:@"%@%@%@", @"XXO",
                                                         @"OOX",
                                                         @"XOX"
                            ];
    board = [[TicTacToeBoard alloc] initWithBoardSize:3 boardState:boardState];
    board.playerTurn = @"O";
    XCTAssert([board currentGameState] == GameStateTied);


    // down diagonal win
    boardState = [NSString stringWithFormat:@"%@%@%@", @"XOX",
                                                       @"OXX",
                                                       @"XOO"
                   ];
    board = [[TicTacToeBoard alloc] initWithBoardSize:3 boardState:boardState];
    board.playerTurn = @"X";
    XCTAssert([board currentGameState] == GameStateWon);

    // down diagonal win not full board
    boardState = [NSString stringWithFormat:@"%@%@%@", @"XOX",
                                                       @" XO",
                                                       @"XO "
                   ];
    board = [[TicTacToeBoard alloc] initWithBoardSize:3 boardState:boardState];
    board.playerTurn = @"X";
    XCTAssert([board currentGameState] == GameStateWon);

    // game empty
    boardState = [NSString stringWithFormat:@"%@%@%@", @"   ",
                                                       @"   ",
                                                       @"   "
                   ];
    board = [[TicTacToeBoard alloc] initWithBoardSize:3 boardState:boardState];
    board.playerTurn = @"X";
    XCTAssert([board currentGameState] == GameStateEmpty);
}

@end
