void main() {
  // Q1: Check Pass or Fail
  int marks = 55;
  int attendance = 80;

  if (marks > 40 && attendance > 75) {
    print("Result: Pass");
  } else {
    print("Result: Fail");
  }


  // Q2: Check both & one condition
  int a = 30;
  int b = 50;

  if (a < 50 && a < b) {
    print("Both conditions are TRUE");
  } else {
    print("Both conditions are FALSE");
  }

  if (a < 50 || a < b) {
    print("At least one condition is TRUE");
  } else {
    print("No condition is TRUE");
  }


  // Q3: Robert's total and percentage
  String name = "Robert";
  int sub1 = 78;
  int sub2 = 45;
  int sub3 = 62;

  int total = sub1 + sub2 + sub3;
  double percentage = total / 3;

  print("Name: $name");
  print("Subject 1: $sub1");
  print("Subject 2: $sub2");
  print("Subject 3: $sub3");
  print("Total Marks: $total");
  print("Percentage: $percentage%");


  // Q4: Marksheet with grade
  String studentName = "Ata";
  int eng = 80;
  int math = 70;
  int sci = 60;
  int urdu = 75;

  int totalMarks = eng + math + sci + urdu;
  double percent = totalMarks / 4;

  print("Student Name: $studentName");
  print("English: $eng");
  print("Math: $math");
  print("Science: $sci");
  print("Urdu: $urdu");
  print("Total Marks: $totalMarks");
  print("Percentage: $percent%");

  if (percent >= 80) {
    print("Grade: A+");
  } else if (percent >= 70) {
    print("Grade: A");
  } else if (percent >= 60) {
    print("Grade: B");
  } else if (percent >= 50) {
    print("Grade: C");
  } else {
    print("Grade: Fail");
  }

  // Q5: Find oldest & youngest
  int age1 = 25;
  int age2 = 30;

  if (age1 > age2) {
    print("Person 1 is older");
  } else if (age1 < age2) {
    print("Person 2 is older");
  } else {
    print("Both are of same age");
  }

  // Q6: Check number is +ve, -ve or 0
  int num1 = -8;

  if (num1 > 0) {
    print("$num1 is Positive");
  } else if (num1 < 0) {
    print("$num1 is Negative");
  } else {
    print("Number is Zero");
  }


  // Q7: Check Square or Rectangle
  int length = 20;
  int breadth = 20;

  if (length == breadth) {
    print("It is a Square");
  } else {
    print("It is a Rectangle");
  }


  // Q8: Temperature message
  num temperature = 42;

  if (temperature < 0) {
    print("Freezing weather");
  } else if (temperature >= 0 && temperature < 10) {
    print("Very Cold weather");
  } else if (temperature >= 10 && temperature < 20) {
    print("Cold weather");
  } else if (temperature >= 20 && temperature < 30) {
    print("Normal in Temp");
  } else if (temperature >= 30 && temperature < 40) {
    print("Its Hot");
  } else if (temperature >= 40) {
    print("Its Very Hot");
  }
}
