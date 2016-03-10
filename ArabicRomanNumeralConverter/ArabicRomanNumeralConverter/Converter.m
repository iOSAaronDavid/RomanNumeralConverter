//
//  Converter.m
//  ArabicRomanNumeralConverter
//
//  Created by User on 3/9/16.
//  Copyright © 2016 tgm. All rights reserved.
//

#import "Converter.h"

@implementation Converter

-(double)convertRomanNumeralToArabic:(NSString *)romanNumeral
{
    if ([romanNumeral isEqualToString:@"V"])
    {
        return 5;
    }
    return 0;
}



@end
