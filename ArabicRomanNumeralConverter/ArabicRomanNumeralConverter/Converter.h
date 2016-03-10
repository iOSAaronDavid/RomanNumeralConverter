//
//  Converter.h
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Converter : NSObject

-(double)convertRomanNumeralToArabic:(NSString *)romanNumeral;
-(int)findHighNumeralWorth:(NSString *)romanNumeral;

@end
