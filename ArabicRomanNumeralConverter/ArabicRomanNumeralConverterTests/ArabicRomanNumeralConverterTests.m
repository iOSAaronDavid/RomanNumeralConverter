//
//  ArabicRomanNumeralConverterTests.m
//  ArabicRomanNumeralConverterTests
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Converter.h"
#import "ViewController.h"

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
    XCTAssertEqual(100, [converter convertRomanNumeralToArabic:@"C"]);
    XCTAssertEqual(500, [converter convertRomanNumeralToArabic:@"D"]);
    XCTAssertEqual(1000, [converter convertRomanNumeralToArabic: @"M"]);
    
    XCTAssertEqual(90, [converter convertRomanNumeralToArabic:@"XC"]);
    XCTAssertEqual(44, [converter convertRomanNumeralToArabic:@"XLIV"]);
    XCTAssertEqual(490, [converter convertRomanNumeralToArabic:@"CDXC"]);
    XCTAssertEqual(946, [converter convertRomanNumeralToArabic:@"CMXLVI"]);
    XCTAssertEqual(1234, [converter convertRomanNumeralToArabic:@"MCCXXXIV"]);
    XCTAssertEqual(1526, [converter convertRomanNumeralToArabic:@"MDXXVI"]);
    
    // 'L' meaning '50', 'C' meaning '100', 'D' meaning '500', and 'M' meaning '1000'
    
    // 'XC', 'CD' and 'CM'
}

-(void)testConvertArabicToRomanNumeral:(Converter *)converter
{
    XCTAssertEqualObjects(@"M", [converter convertArabicToRomanNumeral:1000]);
    XCTAssertEqualObjects(@"CM", [converter convertArabicToRomanNumeral:900]);
    XCTAssertEqualObjects(@"D", [converter convertArabicToRomanNumeral:500]);
    XCTAssertEqualObjects(@"C", [converter convertArabicToRomanNumeral:100]);
    XCTAssertEqualObjects(@"XC", [converter convertArabicToRomanNumeral:90]);
    XCTAssertEqualObjects(@"L", [converter convertArabicToRomanNumeral:50]);
    XCTAssertEqualObjects(@"XL", [converter convertArabicToRomanNumeral:40]);
    XCTAssertEqualObjects(@"X", [converter convertArabicToRomanNumeral:10]);
    XCTAssertEqualObjects(@"IX", [converter convertArabicToRomanNumeral:9]);
    XCTAssertEqualObjects(@"V", [converter convertArabicToRomanNumeral:5]);
    XCTAssertEqualObjects(@"IV", [converter convertArabicToRomanNumeral:4]);
    XCTAssertEqualObjects(@"I", [converter convertArabicToRomanNumeral:1]);
    XCTAssertEqualObjects(@"MD", [converter convertArabicToRomanNumeral:1500]);
    XCTAssertEqualObjects(@"MDC", [converter convertArabicToRomanNumeral:1600]);
    XCTAssertEqualObjects(@"MDCL", [converter convertArabicToRomanNumeral:1650]);
    XCTAssertEqualObjects(@"MDCLX", [converter convertArabicToRomanNumeral:1660]);
    XCTAssertEqualObjects(@"MDCLXVI", [converter convertArabicToRomanNumeral:1666]);
    
    XCTAssertEqualObjects(@"XC", [converter convertArabicToRomanNumeral:90]);
    XCTAssertEqualObjects(@"CD", [converter convertArabicToRomanNumeral:400]);
    XCTAssertEqualObjects(@"CM", [converter convertArabicToRomanNumeral:900]);
    
    XCTAssertEqualObjects(@"MDCXL", [converter convertArabicToRomanNumeral:1640]);
    XCTAssertEqualObjects(@"MMDVII", [converter convertArabicToRomanNumeral:2507]);
    XCTAssertEqualObjects(@"CCCXXIII", [converter convertArabicToRomanNumeral:323]);
    XCTAssertEqualObjects(@"CMXCIV", [converter convertArabicToRomanNumeral:994]);
    XCTAssertEqualObjects(@"CDVII", [converter convertArabicToRomanNumeral:407]);
    XCTAssertEqualObjects(@"LIX", [converter convertArabicToRomanNumeral:59]);

}

-(void)testViewController
{
    ViewController *vc = [[ViewController alloc] init];
    vc.symbolTextField = [[UITextField alloc] init];
    vc.validNumerals = [[NSArray alloc] initWithObjects:@"I", @"V", @"X", @"L", @"C", @"M", nil];
    vc.errorLabel.text = @"";
    
    vc.symbolTextField.text = @"343";
    XCTAssertEqual(YES, [vc labelTextIsNumeric]);
    vc.symbolTextField.text = @"dsf";
    XCTAssertEqual(NO, [vc labelTextIsNumeric]);
    vc.symbolTextField.text = @"VI";
    XCTAssertEqual(NO, [vc labelTextIsNumeric]);
    vc.symbolTextField.text = @"343fdf";
    XCTAssertEqual(NO, [vc labelTextIsNumeric]);
    
    vc.symbolTextField.text = @"VII";
    XCTAssertEqual(YES, [vc inputIsValidNumeral]);
    vc.symbolTextField.text = @"DF";
    XCTAssertEqual(NO, [vc inputIsValidNumeral]);
    vc.symbolTextField.text = @"VIIfd";
    XCTAssertEqual(NO, [vc inputIsValidNumeral]);
    vc.symbolTextField.text = @"43";
    XCTAssertEqual(NO, [vc inputIsValidNumeral]);
    vc.symbolTextField.text = @"43fd";
    XCTAssertEqual(NO, [vc inputIsValidNumeral]);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
