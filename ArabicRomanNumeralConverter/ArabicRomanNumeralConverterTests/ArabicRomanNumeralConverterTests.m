//
//  ArabicRomanNumeralConverterTests.m
//  ArabicRomanNumeralConverterTests
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Converter.h"

@interface ArabicRomanNumeralConverterTests : XCTestCase

@end

@implementation ArabicRomanNumeralConverterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Converter *converter = [[Converter alloc] init];
    [self testConvertRomanNumeraltoArabic:converter];
    [self testConvertArabicToRomanNumeral:converter];
}

-(void)testConvertRomanNumeraltoArabic:(Converter *)converter
{
    XCTAssertEqual(10, [converter findHighNumeralWorth:@"XXXIV"]);
    
    XCTAssertEqual(1, [converter convertRomanNumeralToArabic:@"I"]);
    XCTAssertEqual(5 , [converter convertRomanNumeralToArabic:@"V"]);
    XCTAssertEqual(10, [converter convertRomanNumeralToArabic:@"X"]);
    XCTAssertEqual(50, [converter convertRomanNumeralToArabic:@"L"]);
//    XCTAssertEqual(100, [converter convertRomanNumeralToArabic:@"CC"]);
    
    XCTAssertEqual(34, [converter convertRomanNumeralToArabic:@"XXXIV"]);
    XCTAssertEqual(44, [converter convertRomanNumeralToArabic:@"XLIV"]);
    
    // 'L' meaning '50', 'C' meaning '100', 'D' meaning '500', and 'M' meaning '1000'
    
    
}

-(void)testConvertArabicToRomanNumeral:(Converter *)converter
{
    
}




- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
