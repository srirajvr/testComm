import 'package:commercial/Models/assets.dart';
import 'package:flutter/material.dart';

class assetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Asset asset = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(asset.dococost.toString()),),
      
    );
  }
}