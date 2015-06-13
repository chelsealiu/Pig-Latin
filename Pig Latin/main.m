//
//  main.m
//  Pig Latin
//
//  Created by Chelsea Liu on 6/12/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinCategory.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        while (TRUE) {
            NSLog(@"Please input your sentence (in lower case letters) to convert into pig latin! ");
            char str[100];
            fgets (str, 100, stdin);
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Your input is: %@", inputString);
            [inputString stringByPigLatinization];
            
        }
        }
    return 0;

}
