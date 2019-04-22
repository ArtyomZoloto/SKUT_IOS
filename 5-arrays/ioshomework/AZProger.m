//
//  AZProger.m
//  ioshomework
//
//  Created by Zolotoverkhov Artem on 19/03/2019.
//  Copyright © 2019 Zolotoverkhov Artem. All rights reserved.
//

#import "AZProger.h"

@implementation AZProger
    @synthesize salary;
    @synthesize language;
    
-(void) move {
    [super move];
    NSLog(@"шевелю пальцами");
}
    
-(NSString*) getProgramLanguageString{
    switch(language){
        case C:
        return @"C";
        break;
        case Cpp:
        return @"C++";
        break;
        case Java:
        return @"Java";
        break;
        case Swift:
        return @"Swift";
        break;
        default:
        break;
    }
}
    
-(void) work {
    NSLog(@"я прогер и пишу код");
}
    @end
