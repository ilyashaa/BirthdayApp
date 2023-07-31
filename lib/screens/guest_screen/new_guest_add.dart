import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewGuest extends StatelessWidget {
  const NewGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(242, 248, 239, 1),
                    label: Text('Name')),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true, fillColor: Color.fromRGBO(242, 248, 239, 1)),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true, fillColor: Color.fromRGBO(242, 248, 239, 1)),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true, fillColor: Color.fromRGBO(242, 248, 239, 1)),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true, fillColor: Color.fromRGBO(242, 248, 239, 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
