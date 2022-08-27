import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../items_feature/new_item_page.dart';

class ItemButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onItemPressed;
  const ItemButton({
    super.key,
    required this.title,

    /// Default value for the color
    this.color = Colors.blue,
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onItemPressed,
            child: Container(
              height: 56,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(16),
              child:  Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
           
            // () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(builder: (_) {
            //       return NewItemPage();
            //     }),
            //   );
            //   // .then((value) {
            //   //   if (value is String) {
            //   //     setState(() {
            //   //       posts.add(value);
            //   //     });
            //   //   }
            //   // });
            // },
          ),
        ),
      ],
    );
  }
}
