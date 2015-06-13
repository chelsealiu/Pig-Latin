//
//  NSString+PigLatinCategory.m
//  
//
//  Created by Chelsea Liu on 6/12/15.
//
//

#import "NSString+PigLatinCategory.h"

@implementation NSString (PigLatinCategory)

-(NSString *)stringByPigLatinization {
    
    
    NSArray *myArray = [self componentsSeparatedByString:@" "];
    NSMutableArray *commandWords = [[NSMutableArray alloc] initWithArray:myArray];
    
    for (int i = 0; i < commandWords.count; i++) {
        
        NSString *currentWord = commandWords[i];
        NSRange initialRange = NSMakeRange(0, [commandWords[i] length]);

        NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString: @"aeiou"];
        
        NSRange rangeUntilVowel = [currentWord rangeOfCharacterFromSet:vowels options:0 range:initialRange];
        
        if (rangeUntilVowel.location == NSNotFound) {
            currentWord = [currentWord stringByAppendingString:@"yay"];
            
        }
        
        else if (rangeUntilVowel.location == 0) {
            currentWord = [currentWord stringByAppendingString:@"yay"];
        }
        else {
            NSString *substringAfterVowel = [currentWord substringFromIndex:rangeUntilVowel.location];//first part of returned word
            NSString *substringBeforeVowel = [currentWord substringToIndex:rangeUntilVowel.location]; //second part of returned word
                 
            NSString *tempCurrentWord = [substringAfterVowel stringByAppendingString:substringBeforeVowel];
            currentWord = [tempCurrentWord stringByAppendingString:@"ay"];
        }
        
        //replacing element in mutable array with current word aka pig latin
        commandWords[i]=currentWord;
        
    }
    
    //out of for loop
    //updated commandwords array
    
    NSString *finalString = [[NSString alloc] init];
    for (int i = 0; i < commandWords.count; i++) {
        
        NSString *tempString = [finalString stringByAppendingString:commandWords[i]];
        finalString = [tempString stringByAppendingString:@" "];
    }
    
    NSLog(@"Your input in pig latin is: %@", finalString);

    return finalString;
    
}

@end

