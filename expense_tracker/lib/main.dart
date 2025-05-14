import 'package:expense_tracker/screen/expense_list_Screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        body: ExpenseListScreen(),
      ),
    ),
  ));
}