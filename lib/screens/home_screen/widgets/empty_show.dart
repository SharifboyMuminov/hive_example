import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_example/utils/app_colors.dart';
import 'package:hive_example/utils/app_images.dart';
import 'package:hive_example/utils/app_size.dart';

class ShowEmptyImage extends StatelessWidget {
  const ShowEmptyImage({super.key, required this.isSearch});

  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            isSearch ? AppImages.emptySearche : AppImages.emptyImage,
            width: 350.we,
            height: 286.he,
          ),
        ),
        Text(
          isSearch
              ? "File not found. Try searching again."
              : "Create your first note !",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.c_FFFFFF,
            fontSize: 20.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
