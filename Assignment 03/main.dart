void main() {
  // Q1: Create a list of names and print all names
  print('Q1: Create a list of names and print all names');
  List<String> names = ['Ali', 'Sara', 'Ahmed', 'Fatima', 'Usman'];
  for (var name in names) {
    print(name);
  }



  // Q2: Create a list of Days and print only Sunday
  print('Q2: Create a list of Days and print only Sunday');
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  print('Only Sunday: ${days.last}');



  // Q3: Create a list of name, class, roll no, grade, percentage
  print('Q3: Create a list of name, class, roll no, grade, percentage');
  List student = [
    'Name: Ali',
    'Class: 10',
    'Roll No: 12',
    'Grade: A',
    'Percentage: 88%'
  ];
  for (var detail in student) {
    print(detail);
  }



  // Q4: Get smallest & greatest number from a list
  print('Q4: Get smallest & greatest number from a list');
  List<int> numbers = [10, 5, 45, 2, 90, 23];
  numbers.sort();
  print('Smallest: ${numbers.first}');
  print('Greatest: ${numbers.last}');



  // Q5: Return maximum value from a list
  print('Q5: Return maximum value from a list');
  List<int> values = [12, 34, 7, 56, 89, 23];
  int maxValue = values.reduce((a, b) => a > b ? a : b);
  print('Maximum Value: $maxValue');


  // Q6: Reverse a list of strings (without changing original list)
  print('Q6: Reverse a list of strings (without changing original list)');
  List<String> fruits = ['Apple', 'Banana', 'Cherry', 'Mango'];
  List<String> reversedList = fruits.reversed.toList();
  print('Original List: $fruits');
  print('Reversed List: $reversedList');



  // Q7: Filter out negative numbers using where()
  print('Q7: Filter out negative numbers using where()');
  List<int> nums = [10, -3, 5, -8, 12, -1];
  List<int> positive = nums.where((n) => n > 0).toList();
  print('Original List: $nums');
  print('Positive Numbers: $positive');


  // Q8: Remove all false values using removeWhere
  print('Q8: Remove all false values using removeWhere');
  List<String> usersEligibility = [
    'John',
    'Alice',
    'eligible',
    'Mike',
    'Sarah',
    'Tom'
  ];
  usersEligibility.removeWhere((user) => user != 'eligible');
  print('Filtered List: $usersEligibility');


  // SELF TASK: Use any 10 List methods
  print('SELF TASK: Using 10 List Methods');
  List<int> list = [5, 2, 9, 1, 7];

  list.add(10); // 1. add()
  list.addAll([12, 14]); // 2. addAll()
  print('1. After adding: $list');

  list.insert(1, 99); // 3. insert()
  print('2. After insert: $list');

  list.remove(9); // 4. remove()
  print('3. After remove: $list');

  list.removeAt(0); // 5. removeAt()
  print('4. After removeAt: $list');

  list.sort(); // 6. sort()
  print('5. After sort: $list');

  print('6. First element: ${list.first}'); // 7. first
  print('7. Last element: ${list.last}'); // 8. last

  print('8. Reversed list: ${list.reversed.toList()}'); // 9. reversed
  print('9. Length of list: ${list.length}'); // 10. length

}
