import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/widgets/item_button.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../items_feature/item_details_page.dart';
import '../items_feature/new_item_page.dart';
import '../models/item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<ItemModel> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: ValueListenableBuilder(
                  valueListenable:  Hive.box('todo_items').listenable(),
                  builder: (context,box,widget) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < todoItems.length; i++) 
                          TodoItem(
                            title: todoItems[i].title,
                            description: todoItems[i].description,
                            date:todoItems[i].date,
                            onItemPressed: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (_){
                                return ItemDetail(
                                  itemModel: todoItems[i],
                                  onItemDeleted: () {
                                    setState(() {
                                      todoItems.removeAt(i);
                                    });
                                  },
                                );
                              })
                              );
                            },
                          ),
                      ],
                    );
                  }
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ItemButton(
                  title: 'New Item',
                  color: Colors.green,
                  onItemPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return  NewItemPage(itemModel: null, itemPageMode: ItemPageMode.add,);
                      }),
                    ).then((value) {
                      /// This checks if the value from the
                      /// previous route is an instance of
                      /// `ItemModel`. If so, read
                      /// the value accordingly.
                      if (value is ItemModel) {
                        /// `setState` notifies the Flutter
                        /// to rebuild the UI
                        /// 
                        final todoBox = Hive.box('todo_items');
                        todoBox.add(value);
                        // setState(() {
                        //   todoItems.add(value);
                        // });
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
