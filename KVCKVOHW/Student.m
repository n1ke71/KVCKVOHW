//
//  Student.m
//  KVCKVOHW
//
//  Created by Kozaderov Ivan on 03/10/2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void) cleanForm{
    
    [self willChangeValueForKey:@"firstName"];
    _firstName = @"";
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = @"";
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = @"";
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"grade"];
    _grade = 0;
    [self didChangeValueForKey:@"grade"];
    
    [self willChangeValueForKey:@"gender"];
    _gender = 0;
    [self didChangeValueForKey:@"gender"];
}
@end
