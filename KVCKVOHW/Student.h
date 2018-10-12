//
//  Student.h
//  KVCKVOHW
//
//  Created by Kozaderov Ivan on 03/10/2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    GradeTypeLow = 3,
    GradeTypeMiddle = 4,
    GradeTypeHigh = 5,
} GradeType;

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong,nonatomic) NSString *firstName;
@property (strong,nonatomic) NSString *lastName;
@property (strong,nonatomic) NSString *dateOfBirth;
@property (strong,nonatomic) NSDate *birthDate;
@property (assign,nonatomic) NSInteger gender;
@property (assign,nonatomic) GradeType grade;
@property (weak,nonatomic)   Student   *friend;

- (void) cleanForm;

@end

NS_ASSUME_NONNULL_END
