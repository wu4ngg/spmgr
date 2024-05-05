import 'package:spmgr/models/info.dart';
import 'package:spmgr/models/purpose.dart';

class Spending{
  Spending({
    required this.id,
    required this.title,
    required this.moneyAmount,
    required this.purpose,
    this.additionalInfo
  });
  int id;
  String title;
  double moneyAmount;
  List<Info>? additionalInfo = List.empty();
  Purpose purpose;
}