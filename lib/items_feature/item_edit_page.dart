
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemEdit extends StatefulWidget {
  const ItemEdit({super.key});

  @override
  State<ItemEdit> createState() => _ItemEditState();
}

class _ItemEditState extends State<ItemEdit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Edit item'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6)
                            ),
                            height: 50,
                            child: Center(
                              child: Text('Update item',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context, '');
                        },
                      ) 
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                          child: TextFormField(
                            maxLength: 20,
                            decoration: InputDecoration(
                              labelText: 'Item',
                              labelStyle: TextStyle(
                                color: Color(0xFF6200EE),
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6200EE)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            maxLength: 20,
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: TextStyle(
                                color: Color(0xFF6200EE),
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6200EE)),
                              ),
                              
                            ),
                            
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                            child: TextField(
                          decoration: InputDecoration(
                             labelText: 'Date',
                              labelStyle: TextStyle(
                                color: Color(0xFF6200EE),
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6200EE)),
                              ),
                          ),
                        ))
                ],
              )
            ],
          ),
        ),
      )
    ));
  }
}