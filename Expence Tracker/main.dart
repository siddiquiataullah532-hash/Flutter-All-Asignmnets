import 'dart:io';

class Expense {
  String id;
  String category;
  double amount;
  String description;
  DateTime date;

  Expense({
    required this.id,
    required this.category,
    required this.amount,
    required this.description,
    required this.date
  });
}

List<Expense> expenses = [];
double monthlyLimit = 30000.0;
double monthlySpent = 0.0;
double balance = 50000.0;

void main() {
  while (true) {
    print("\nEXPENSE TRACKER SYSTEM");
    print("1) Set Monthly Spending Limit");
    print("2) Add Expense");
    print("3) View All Expenses");
    print("4) View Expense by Category");
    print("5) Delete Expense");
    print("6) View Summary");
    print("7) Daily Report & Analytics");
    print("8) Export Summary to File");
    print("9) Export Daily Report to File");
    print("10) View Monthly Expense Chart");
    print("0) Exit");
    stdout.write("Select Option: ");

    String? choice = stdin.readLineSync();
    if (choice == null || choice.trim().isEmpty) {
      print("Invalid input. Try again.");
      continue;
    }

    switch (choice) {
      case "1":
        setLimit();
        break;
      case "2":
        addExpense();
        break;
      case "3":
        viewAll();
        break;
      case "4":
        viewByCategory();
        break;
      case "5":
        deleteExpense();
        break;
      case "6":
        viewSummary();
        break;
      case "7":
        dailyReport();
        break;
      case "8":
        exportSummary();
        break;
      case "9":
        exportDailyReport();
        break;
      case "10":
        monthlyChart();
        break;
      case "0":
        print("Exiting...");
        return;
      default:
        print("Invalid selection");
    }
  }
}

void setLimit() {
  stdout.write("Enter Monthly Limit (1000 - 500000): ");
  double? limit = double.tryParse(stdin.readLineSync() ?? "");
  if (limit == null || limit < 1000 || limit > 500000) {
    print("Limit should be between 1000 and 500000.");
    return;
  }
  monthlyLimit = limit;
  print("Monthly limit updated.");
}

void addExpense() {
  if (monthlySpent >= monthlyLimit) {
    print("Monthly limit reached. Cannot add more expenses.");
    return;
  }

  stdout.write("Enter Expense ID (no spaces): ");
  String? id = stdin.readLineSync();
  if (id == null || id.trim().isEmpty || id.contains(" ")) {
    print("Invalid ID");
    return;
  }
  if (expenses.any((e) => e.id == id)) {
    print("Expense ID already exists.");
    return;
  }

  List<String> categories = ["Food", "Travel", "Shopping", "Bills", "Other"];
  print("Select Category:");
  for (int i = 0; i < categories.length; i++) {
    print("${i + 1}) ${categories[i]}");
  }
  stdout.write("Enter category number: ");
  int? catIndex = int.tryParse(stdin.readLineSync() ?? "");
  if (catIndex == null || catIndex < 1 || catIndex > categories.length) {
    print("Invalid category");
    return;
  }
  String category = categories[catIndex - 1];

  stdout.write("Enter Amount: ");
  double? amount = double.tryParse(stdin.readLineSync() ?? "");
  if (amount == null || amount <= 0) {
    print("Invalid amount");
    return;
  }

  if (category == "Food" && amount > 1000) {
    print("Food expense cannot exceed 1000");
    return;
  } else if (category == "Travel" && amount > 10000) {
    print("Travel expense cannot exceed 10000");
    return;
  } else if (category == "Bills" && amount < 500) {
    print("Bills expense must be at least 500");
    return;
  } else if (category == "Shopping") {
    double shoppingSpent = expenses.where((e) => e.category=="Shopping").fold(0.0, (sum, e) => sum + e.amount);
    if (shoppingSpent + amount > 50000) {
      print("Shopping monthly limit 50000 exceeded");
      return;
    }
  } else if (category == "Other") {
    stdout.write("Enter Description (min 10 chars): ");
    String? descCheck = stdin.readLineSync();
    if (descCheck == null || descCheck.trim().length < 10) {
      print("Description too short for Other category");
      return;
    }
  }

  DateTime today = DateTime.now();
  double todaySpent = expenses.where((e) => e.date.year == today.year && e.date.month == today.month && e.date.day == today.day).fold(0.0, (sum,e)=> sum+e.amount);
  if (todaySpent + amount > 2000) {
    print("Daily spending limit of 2000 exceeded");
    return;
  }

  if (amount > balance) {
    print("Insufficient balance");
    return;
  }
  if (monthlySpent + amount > monthlyLimit) {
    print("Monthly limit exceeded");
    return;
  }

  stdout.write("Enter Description: ");
  String? desc = stdin.readLineSync();
  if (desc == null || desc.trim().isEmpty) {
    print("Description cannot be empty");
    return;
  }

  expenses.add(Expense(id: id, category: category, amount: amount, description: desc, date: today));
  balance -= amount;
  monthlySpent += amount;

  if (monthlySpent >= 0.8*monthlyLimit && monthlySpent < monthlyLimit) {
    print("Warning: 80% of monthly limit used");
  }

  print("Expense added successfully");
}

void viewAll() {
  if (expenses.isEmpty) {
    print("No expenses found");
    return;
  }
  print("All Expenses:");
  for (var e in expenses) {
    print("ID: ${e.id}");
    print("Category: ${e.category}");
    print("Amount: Rs ${e.amount}");
    print("Description: ${e.description}");
    print("Date: ${e.date}");
    print("-------------------");
  }
}

void viewByCategory() {
  stdout.write("Enter Category name (Food/Travel/Shopping/Bills/Other): ");
  String? cat = stdin.readLineSync();
  if (cat == null || cat.trim().isEmpty) {
    print("Invalid category input");
    return;
  }
  var result = expenses.where((e) => e.category.toLowerCase() == cat.toLowerCase()).toList();
  if (result.isEmpty) {
    print("No expense record in this category");
    return;
  }
  print("Expenses in $cat:");
  for (var e in result) {
    print("ID: ${e.id}, Amount: Rs ${e.amount}, Description: ${e.description}, Date: ${e.date}");
  }
}

void deleteExpense() {
  stdout.write("Enter Expense ID to delete: ");
  String? id = stdin.readLineSync();
  var record = expenses.where((e) => e.id == id).toList();
  if (record.isEmpty) {
    print("No expense found with this ID");
    return;
  }
  double amt = record.first.amount;
  expenses.removeWhere((e) => e.id == id);
  balance += amt;
  monthlySpent -= amt;
  print("Expense deleted and amount refunded");
}

void viewSummary() {
  print("EXPENSE SUMMARY");
  print("Total Records: ${expenses.length}");
  print("Monthly Limit: Rs $monthlyLimit");
  print("Monthly Spent: Rs $monthlySpent");
  print("Remaining Limit: Rs ${monthlyLimit - monthlySpent}");
  print("Current Balance: Rs $balance");
  if (monthlySpent >= monthlyLimit) {
    print("Alert: Monthly limit fully used");
  } else if (monthlySpent >= 0.8*monthlyLimit) {
    print("Warning: 80% of monthly limit used");
  }
}

void dailyReport() {
  DateTime today = DateTime.now();
  var todayExpenses = expenses.where((e) => e.date.year == today.year && e.date.month == today.month && e.date.day == today.day).toList();
  double todayTotal = todayExpenses.fold(0.0, (sum, e) => sum + e.amount);

  print("DAILY REPORT (${today.year}-${today.month}-${today.day})");
  print("Total Expenses Today: Rs $todayTotal");
  if (todayExpenses.isEmpty) {
    print("No expenses today");
  } else {
    print("Today's Expenses:");
    for (var e in todayExpenses) {
      print("ID: ${e.id}, Category: ${e.category}, Amount: Rs ${e.amount}, Desc: ${e.description}");
    }
  }

  Map<String, double> categoryTotals = {};
  for (var e in expenses) {
    categoryTotals[e.category] = (categoryTotals[e.category] ?? 0) + e.amount;
  }
  if (categoryTotals.isNotEmpty) {
    var topCategory = categoryTotals.entries.reduce((a, b) => a.value > b.value ? a : b);
    print("Top Spending Category: ${topCategory.key} (Rs ${topCategory.value})");
  }

  if (expenses.isNotEmpty) {
    double avg = expenses.fold(0.0, (sum, e) => sum + e.amount) / expenses.length;
    print("Average Expense Amount: Rs ${avg.toStringAsFixed(2)}");
  }

  if (todayExpenses.isNotEmpty) {
    var maxExpense = todayExpenses.reduce((a, b) => a.amount > b.amount ? a : b);
    print("Highest Expense Today: Rs ${maxExpense.amount} in ${maxExpense.category} (ID: ${maxExpense.id})");
  }
}

void exportSummary() {
  File file = File('expense_summary.txt');
  var sink = file.openWrite();
  sink.writeln("EXPENSE SUMMARY");
  sink.writeln("Total Records: ${expenses.length}");
  sink.writeln("Monthly Limit: Rs $monthlyLimit");
  sink.writeln("Monthly Spent: Rs $monthlySpent");
  sink.writeln("Remaining Limit: Rs ${monthlyLimit - monthlySpent}");
  sink.writeln("Current Balance: Rs $balance");

  Map<String, double> categoryTotals = {};
  for (var e in expenses) {
    categoryTotals[e.category] = (categoryTotals[e.category] ?? 0) + e.amount;
  }
  if (categoryTotals.isNotEmpty) {
    var topCategory = categoryTotals.entries.reduce((a, b) => a.value > b.value ? a : b);
    sink.writeln("Top Spending Category: ${topCategory.key} (Rs ${topCategory.value})");
  }

  if (expenses.isNotEmpty) {
    double avg = expenses.fold(0.0, (sum, e) => sum + e.amount) / expenses.length;
    sink.writeln("Average Expense Amount: Rs ${avg.toStringAsFixed(2)}");
  }

  sink.close();
  print("Summary exported to expense_summary.txt");
}

void exportDailyReport() {
  DateTime today = DateTime.now();
  File file = File('daily_report.txt');
  var sink = file.openWrite();

  var todayExpenses = expenses.where((e) => e.date.year == today.year && e.date.month == today.month && e.date.day == today.day).toList();
  double todayTotal = todayExpenses.fold(0.0, (sum, e) => sum + e.amount);

  sink.writeln("DAILY REPORT (${today.year}-${today.month}-${today.day})");
  sink.writeln("Total Expenses Today: Rs $todayTotal");
  if (todayExpenses.isEmpty) {
    sink.writeln("No expenses today");
  } else {
    for (var e in todayExpenses) {
      sink.writeln("ID: ${e.id}, Category: ${e.category}, Amount: Rs ${e.amount}, Desc: ${e.description}");
    }
  }

  sink.close();
  print("Daily report exported to daily_report.txt");
}

// Monthly Expense Chart
void monthlyChart() {
  Map<String, double> categoryTotals = {};
  DateTime now = DateTime.now();

  for (var e in expenses.where((x) => x.date.month == now.month && x.date.year == now.year)) {
    categoryTotals[e.category] = (categoryTotals[e.category] ?? 0) + e.amount;
  }

  print("MONTHLY EXPENSE CHART (${now.year}-${now.month})");
  if (categoryTotals.isEmpty) {
    print("No expenses this month");
    return;
  }

  for (var entry in categoryTotals.entries) {
    int barLength = (entry.value / monthlyLimit * 50).toInt();
    String bar = '#' * barLength;
    print("${entry.key.padRight(10)} | ${bar} Rs ${entry.value}");
  }
  print("Monthly Limit: Rs $monthlyLimit, Spent: Rs $monthlySpent");
}
