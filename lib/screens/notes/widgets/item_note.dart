import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';
import 'package:hive_example/utils/app_size.dart';

class ItemNoteButton extends StatelessWidget {
  const ItemNoteButton({
    super.key,
    required this.onTab,
    required this.onLongPress,
    required this.noteModel,
  });

  final NotesModel noteModel;
  final VoidCallback onTab;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13.he),
      width: double.infinity,
      decoration: BoxDecoration(
        color: noteModel.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.we, vertical: 27.he),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onLongPress: onLongPress,
        onPressed: onTab,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              noteModel.fullName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
              ),
            ),
            10.getH(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                noteModel.createDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
