//
//  TableViewController.m
//  KVCKVOHW
//
//  Created by Kozaderov Ivan on 03/10/2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "TableViewController.h"
#import "Student.h"

@interface TableViewController ()

@property (strong,nonatomic) Student *student;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.student = [[Student alloc] init];
    [self.student addObserver:self
                   forKeyPath:@"firstName"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [self.student addObserver:self
                   forKeyPath:@"lastName"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [self.student addObserver:self
                   forKeyPath:@"dateOfBirth"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [self.student addObserver:self
                   forKeyPath:@"gender"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [self.student addObserver:self
                   forKeyPath:@"grade"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
}

- (void)dealloc{
    
    [self.student removeObserver:self forKeyPath:@"firstName"];
    [self.student removeObserver:self forKeyPath:@"lastName"];
    [self.student removeObserver:self forKeyPath:@"dateOfBirth"];
    [self.student removeObserver:self forKeyPath:@"gender"];
    [self.student removeObserver:self forKeyPath:@"grade"];
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    
    NSLog(@"\nkeyPath:%@\n object:%@\n change:%@\n",keyPath,object,change);
  
}

#pragma mark - Actions

- (IBAction)firstNameTextField:(UITextField *)sender {
    
    self.student.firstName = sender.text;
}

- (IBAction)lastNameTextField:(UITextField *)sender {
    
    self.student.lastName = sender.text;
}

- (IBAction)dateOfBirthTextField:(UITextField *)sender {
    
     self.student.dateOfBirth = sender.text;
}

- (IBAction)genderSegmentedControl:(UISegmentedControl *)sender {
    
        self.student.gender = sender.selectedSegmentIndex;
}

- (IBAction)gradeSegmentedControl:(UISegmentedControl *)sender {
    
    self.student.grade = (GradeType)sender.selectedSegmentIndex;
}

- (IBAction)cleanFormButton:(UIButton *)sender {
    
    [self.student cleanForm];
}
@end
