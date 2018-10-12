//
//  TableViewController.m
//  KVCKVOHW
//
//  Created by Kozaderov Ivan on 03/10/2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "TableViewController.h"
#import "Student.h"
#import "Group.h"

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
   
    Student *student1 = [[Student alloc] init];
    Student *student2 = [[Student alloc] init];
    Student *student3 = [[Student alloc] init];
    Student *student4 = [[Student alloc] init];
  
    student1.friend = student2;
    student2.friend = student3;
    student3.friend = student4;
    student4.friend = self.student ;
    self.student.friend = student1;
    
    //Grade
    student1.grade = GradeTypeLow;
    student2.grade = GradeTypeHigh;
    student3.grade = GradeTypeLow;
    student4.grade = GradeTypeMiddle;
    self.student.grade = GradeTypeMiddle;
    
    //Birth Date
    student1.birthDate = [NSDate dateWithTimeIntervalSinceNow: - arc4random_uniform(10000)];
    student2.birthDate = [NSDate dateWithTimeIntervalSinceNow: - arc4random_uniform(10000)];
    student3.birthDate = [NSDate dateWithTimeIntervalSinceNow: - arc4random_uniform(10000)];
    student4.birthDate = [NSDate dateWithTimeIntervalSinceNow: - arc4random_uniform(10000)];
    self.student.birthDate = [NSDate dateWithTimeIntervalSinceNow: - arc4random_uniform(10000)];
    
    Group *group = [[Group alloc]init];
    group.students = @[student1,student2,student3,student4,self.student];

    [group addObserver:self
                   forKeyPath:@"students"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    
    [self setValue:@"Vasia" forKeyPath:@"student.friend.firstName"];
    [self setValue:@"Vasia" forKeyPath:@"student.friend.friend.firstName"];
    [self setValue:@"Vasia" forKeyPath:@"student.friend.friend.friend.firstName"];
    [self setValue:@"Vasia" forKeyPath:@"student.friend.friend.friend.friend.firstName"];
    [self setValue:@"Vasia" forKeyPath:@"student.friend.friend.friend.friend.friend.firstName"];

    NSLog(@"%@",[group valueForKeyPath:@"students.@count"]);

    //Массив имен
    NSArray *namesArray = [group valueForKeyPath:@"students.@unionOfObjects.firstName"];
    NSLog(@"Names Array:%@",namesArray);
    //Саммый поздний и саммый ранний годы рождения
    NSLog(@"Birth Date MIN:%@",[group valueForKeyPath:@"students.@min.birthDate"]);
    NSLog(@"Birth Date MAX:%@",[group valueForKeyPath:@"students.@max.birthDate"]);
    
    //Сумма всех баллов студентов и средний бал всех студентов
    NSLog(@"Average grage:%@",[group valueForKeyPath:@"students.@avg.grade"]);
    NSLog(@"Sum grage:%@",[group valueForKeyPath:@"students.@sum.grade"]);
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
