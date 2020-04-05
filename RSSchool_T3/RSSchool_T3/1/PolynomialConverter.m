#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    NSMutableString *result = [@"" mutableCopy];
    
    int arrayLength = (int)numbers.count;
    
    if (arrayLength == 0) {
        return nil;
    }
    
    int Index = 1;
    
    for (NSNumber *number in numbers) {
        int intNumber = [number intValue];
        BOOL isPositive = (intNumber > 0);
        int absnumber = abs(intNumber);
        NSString *signAriphmetic;
        
        if (Index == 1) {
            signAriphmetic = isPositive ? @"" : @"- ";
        } else {
            signAriphmetic = isPositive ? @" + " : @" - ";
        }
        
        if (absnumber > 1) {
            if (Index < arrayLength - 1) {
                [result appendString:[NSString stringWithFormat:@"%@%ix^%i", signAriphmetic, absnumber, arrayLength - Index]];
            } else if (Index == arrayLength - 1) {
                [result appendString:[NSString stringWithFormat:@"%@%ix", signAriphmetic, absnumber]];
            } else {
                [result appendString:[NSString stringWithFormat:@"%@%i", signAriphmetic, absnumber]];
            }
        } else if (absnumber == 1 ) {
            if (Index < arrayLength - 1) {
                [result appendString:[NSString stringWithFormat:@"%@x^%i", signAriphmetic,  arrayLength - Index]];
            } else if (Index == arrayLength - 1) {
                [result appendString:[NSString stringWithFormat:@"%@x", signAriphmetic]];
            } else {
                [result appendString:[NSString stringWithFormat:@"%@%i", signAriphmetic, intNumber]];
            }
        }
        
        Index++;
    }
    
    
    return [result copy];
}
@end
