void main() {
  printFibonacci(10);
  print("");
  findLargest([3, 9, 1, 6, 4, 2, 8, 5, 7]);
  print("");
  multiplicationTable(5);
  print("");
  checkPalindrome("radar");
  print("");
  numberTriangle();
  print("");
  printGreaterThanFive([1, 3, 7, 2, 9, 5, 8, 4]);
  print("");
  countVowels("hello world");
}

// Q1: Fibonacci sequence
void printFibonacci(int n) {
  int a = 0;
  int b = 1;

  print(a);
  print(b);

  for (int i = 2; i < n; i++) {
    int c = a + b;
    print(c);
    a = b;
    b = c;
  }
}

// Q2: Largest element
void findLargest(List<int> nums) {
  int largest = nums[0];

  for (int i = 1; i < nums.length; i++) {
    if (nums[i] > largest) {
      largest = nums[i];
    }
  }

  print("Largest element: $largest");
}

// Q3: Multiplication table
void multiplicationTable(int n) {
  for (int i = 1; i <= 10; i++) {
    print("$n x $i = ${n * i}");
  }
}

// Q4: Palindrome check
void checkPalindrome(String text) {
  String reversed = "";

  for (int i = text.length - 1; i >= 0; i--) {
    reversed += text[i];
  }

  if (text == reversed) {
    print("$text is a palindrome.");
  } else {
    print("$text is not a palindrome.");
  }
}

// Q5: Pattern triangle
void numberTriangle() {
  for (int i = 1; i <= 4; i++) {
    String row = "";
    for (int j = 1; j <= i; j++) {
      row += "$i";
    }
    print(row);
  }
}

// Q6: Numbers greater than 5
void printGreaterThanFive(List<int> nums) {
  for (var num in nums) {
    if (num > 5) {
      print(num);
    }
  }
}

// Q7: Count vowels
void countVowels(String text) {
  int count = 0;
  String vowels = "aeiou";

  for (int i = 0; i < text.length; i++) {
    String ch = text[i].toLowerCase();
    if (vowels.contains(ch)) {
      count++;
    }
  }

  print("Number of vowels: $count");
}
