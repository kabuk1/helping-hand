import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    final services = Provider.of<QuerySnapshot>(context);
    // for (var doc in ServicesList().documents) {
    //   print(doc.data);
    // }

    print(services);
    return Container();
  }
}
