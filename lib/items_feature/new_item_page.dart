import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/widgets/item_button.dart';

import '../models/item_model.dart';

enum ItemPageMode { add, edit }

class NewItemPage extends StatefulWidget {
  final ItemModel? itemModel;
  final ItemPageMode itemPageMode;

  const NewItemPage(
      {super.key,this.itemModel, this.itemPageMode = ItemPageMode.add});

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();


  @override
  // called only on first time
  void initState() {
    // TODO: implement initState
  if (widget.itemPageMode == ItemPageMode.edit) {
    if (widget.itemModel != null) {
        _title.text = widget.itemModel!.title;
        _description.text = widget.itemModel!.description;
        _date.text = widget.itemModel!.date;
    }
  }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.itemPageMode == ItemPageMode.add ? 'Add new Item' : 'Edit Item'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ItemButton(
                        title: widget.itemPageMode == ItemPageMode.add ? 'Save Item' : 'Save Edit',
                        color: Colors.blue,
                        onItemPressed: () {
                          if (_title.text.isNotEmpty &&
                              _description.text.isNotEmpty &&
                              _date.text.isNotEmpty) {
                            Navigator.pop(
                              context,

                              /// This is where you pass the a `dynamic`
                              /// item.
                              ItemModel(
                                title: _title.text,
                                description: _description.text,
                                date: _date.text,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: _title,
                            maxLength: 20,
                            decoration: const InputDecoration(
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
                            controller: _description,
                            maxLines: 5,
                            decoration: const InputDecoration(
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
                          controller: _date,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            suffixIcon: Icon(
                              Icons.check_circle,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
