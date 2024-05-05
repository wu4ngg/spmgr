import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:spmgr/models/spending.dart';

class SpendingCard extends StatelessWidget{
    const SpendingCard({super.key, required this.spending, this.targetSpending = -1});
    final Spending spending;
    final int? targetSpending;
    @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("#,###.00");
    // TODO: implement build
    return Card(
      child: Padding(padding: const EdgeInsets.all(20), 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Icon(spending.purpose.icon),
        const SizedBox(width: 10),
        Expanded(
          child: 
          Text(spending.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w100
        ),),
        ),
        Text("${formatter.format(spending.moneyAmount)}₫", style: TextStyle(fontWeight: FontWeight.w900)),
        targetSpending != -1 ?
        Center(child: 
          SizedBox(
            width: 16,
            height: 16,
            child:
            CircularProgressIndicator(value: spending.moneyAmount / targetSpending!, strokeWidth: 5,),
          )
        ) : SizedBox(width: 0,),
        const SizedBox(width: 10),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],),
    ),);
  }
}