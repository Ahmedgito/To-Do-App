import 'package:flutter/material.dart';
import 'package:to_do_app_ahmed/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius : BorderRadius.circular(20) ,
                ),
                hintText: 'Add a new Task',

              ),
             
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  text: 'Add',
                  onPressed: onSave,
                ),
                SizedBox(width: 20),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
