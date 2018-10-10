//
//  TableViewController.h
//  KVCKVOHW
//
//  Created by Kozaderov Ivan on 03/10/2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController
- (IBAction)firstNameTextField:(UITextField *)sender;
- (IBAction)lastNameTextField:(UITextField *)sender;
- (IBAction)dateOfBirthTextField:(UITextField *)sender;
- (IBAction)genderSegmentedControl:(UISegmentedControl *)sender;
- (IBAction)gradeSegmentedControl:(UISegmentedControl *)sender;
- (IBAction)cleanFormButton:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
