import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spmgr/prodivders/spending_provider.dart';
class StatsWidget extends StatefulWidget{
  const StatsWidget({
    super.key,
    required this.currentSpending,
    this.targetSpending = -1
  });
  final int currentSpending;
  final int targetSpending;
  @override
  State<StatefulWidget> createState() => _StatsWidgetState();
}
class _StatsWidgetState extends State<StatsWidget> {
  var formatter = NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Consumer<SpendingProvider>(builder:(context, value, child) => 
    IntrinsicWidth(child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tổng chi tiêu"),
          Text("${formatter.format(value.totalSpending)}₫ ${widget.targetSpending != -1 ? "/ ${formatter.format(widget.targetSpending)}₫" : "/ Không giới hạn"}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
          const SizedBox(height: 10),
          widget.targetSpending != -1 ? LinearProgressIndicator(value: widget.currentSpending / widget.targetSpending) : const SizedBox(height: 0,)
        ],
      ),
    ))
    ); 
  }
}