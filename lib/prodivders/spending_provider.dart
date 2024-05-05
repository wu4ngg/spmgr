import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spmgr/models/purpose.dart';
import 'package:spmgr/models/spending.dart';

class SpendingProvider extends ChangeNotifier{
  List<Spending> _spendingList = List.generate(5, (index) => Spending(id: index, title: "Test", moneyAmount: index * Random().nextDouble() * index * 1000, purpose: Purpose(id: index * 10, name: "Test", icon: Icons.two_wheeler)));
  set spendingList(List<Spending> newList){
    _spendingList = newList;
    notifyListeners();
  }
  List<Spending> get spendingList{
    return _spendingList;
  }
  double _totalSpending = 0;
  double get totalSpending {
    _totalSpending = 0;
    for(final spending in _spendingList){
      _totalSpending += spending.moneyAmount;
    }
    return _totalSpending;
  }
  double _spendingLimit = -1;
  double get spendingLimit => _spendingLimit;
  set spendingLimit(double newLimit){
    _spendingLimit = newLimit;
    notifyListeners();
  }
  void insert(int i, Spending spending){
    _spendingList.insert(i, spending);
    notifyListeners();
  }
  void add(Spending spending){
    _spendingList.add(spending);
    notifyListeners();
  }
  void remove(Spending spending){
    _spendingList.remove(spending);
    notifyListeners();
  }
  void generateList(int length){
    _spendingList.addAll(List.generate(length, (index) => Spending(id: index, title: "Test", moneyAmount: Random().nextDouble() * 100000, purpose: Purpose(id: index * 10, name: "Test", icon: Icons.two_wheeler))));
    notifyListeners();
  }
}