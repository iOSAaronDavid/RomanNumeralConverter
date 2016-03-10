//
//  Converter.h
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Converter : NSObject

-(int)convertRomanNumeralToArabic:(NSString *)romanNumeral;
-(int)findHighNumeralWorth:(NSString *)romanNumeral;
-(NSString *)convertArabicToRomanNumeral:(int)arabic;

@end
