import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var  expenseList  = [
      Expense(title: 'Flutter course', amount: 20.21, date: DateTime.now(), category: Category.work),
      Expense(title: 'Spring boot course', amount: 20.21, date: DateTime.now(), category: Category.work),
      Expense(title: 'Angular course', amount: 20.21, date: DateTime.now(), category: Category.work),
    ];

    return Center(
      child: Column(
        children: [...expenseList.map((expense) {
          return ExpenseItem(expense: expense);
        })],
      ),
    );
  }
}