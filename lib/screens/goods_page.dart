import 'package:flutter/material.dart';

class GoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goods Details'),
      ),
      body: Center(
        child: Text('Details of the selected product will be shown here.'),
      ),
    );
  }
}
