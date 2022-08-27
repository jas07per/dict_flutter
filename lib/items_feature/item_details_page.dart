import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/items_feature/item_edit_page.dart';
import 'package:todo_app/models/item_model.dart';
import 'package:todo_app/widgets/item_button.dart';

import 'new_item_page.dart';

class ItemDetail extends StatefulWidget {
  final ItemModel itemModel;
  final VoidCallback? onItemDeleted;
  const ItemDetail({super.key, required this.itemModel, this.onItemDeleted});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {

  String? updatedTitle;
  String? updatedDescription;
  String? updatedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(updatedTitle ?? widget.itemModel.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(updatedDescription ?? widget.itemModel.description),
                      SizedBox(
                        height: 15,
                      ),
                      Text(updatedDate ?? widget.itemModel.date)
                    ],
                  )
                ],
              )),
              ItemButton(
                title: 'Edit',
                onItemPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return NewItemPage(
                        itemModel: updatedTitle != null ? ItemModel(title: updatedTitle!, description: updatedDescription!, date: updatedDate!) : widget.itemModel,
                        itemPageMode: ItemPageMode.edit,
                      );
                    }),
                  ).then((value) {
                    /// This checks if the value from the
                    /// previous route is an instance of
                    /// `ItemModel`. If so, read
                    /// the value accordingly.
                    if (value is ItemModel) {
                      /// `setState` notifies the Flutter
                      /// to rebuild the UI
                      setState(() {
                        updatedTitle =value.title;
                        updatedDescription = value.description;
                        updatedDate = value.date;
                      });
                    }
                  });
                },
              ),
              ItemButton(
                title: 'Delete',
                color: Colors.red,
                onItemPressed: () {
                  widget.onItemDeleted!();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
