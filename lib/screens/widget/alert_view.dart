import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_example/screens/widget/alert_item.dart';
import 'package:hive_example/utils/app_colors.dart';
import 'package:hive_example/utils/app_images.dart';
import 'package:hive_example/utils/app_size.dart';

class AlertView extends StatelessWidget {
  const AlertView({
    super.key,
    required this.onTabSave,
    required this.onTabDiscard,
    required this.title,
    this.titleSaveButton = "Save",
  });

  final VoidCallback onTabSave;
  final VoidCallback onTabDiscard;
  final String title;
  final String titleSaveButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.symmetric(vertical: 20.he),
      backgroundColor: AppColors.c_252525,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.c_CFCFCF,
          fontSize: 15.sp,
        ),
      ),
      icon: SvgPicture.asset(
        AppImages.undovBlackSvg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.we),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DialogButton(
                  title: "Discard",
                  onTab: onTabDiscard,
                  backgroundColor: AppColors.c_FF0000),
              DialogButton(
                title: titleSaveButton,
                onTab: onTabSave,
                backgroundColor: AppColors.c_30BE71,
              ),
            ],
          ),
        ),
      ],
      actionsPadding: EdgeInsets.symmetric(
        vertical: 30.he,
      ),
    );
  }
}
