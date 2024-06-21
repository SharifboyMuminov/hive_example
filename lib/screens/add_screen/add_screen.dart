import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_example/blocs/notes/notes_bloc.dart';
import 'package:hive_example/blocs/notes/notes_event.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';
import 'package:hive_example/screens/color/color_screen.dart';
import 'package:hive_example/screens/dialogs/my_show_dialog.dart';
import 'package:hive_example/screens/widget/my_snacbar.dart';
import 'package:hive_example/screens/widget/top_button.dart';
import 'package:hive_example/utils/app_colors.dart';
import 'package:hive_example/utils/app_images.dart';
import 'package:hive_example/utils/app_size.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
    this.notesModel,
    this.isInfo = false,
  });

  final bool isInfo;
  final NotesModel? notesModel;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  NotesModel noteModel = NotesModel.defaultModel();

  bool isSave = true;
  bool isPop = false;
  bool isChane = false;

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerSubTitle = TextEditingController();

  @override
  void initState() {
    if (widget.notesModel != null) {
      noteModel = widget.notesModel!;
      controllerTitle.text = noteModel.fullName;

      controllerSubTitle.text = noteModel.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c_252525,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c_252525,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_252525,
        body: Column(
          children: [
            53.getH(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.we),
              child: Row(
                children: [
                  ButtonTop(
                    icon: AppImages.arrowBack,
                    onTab: _testMethodArrow,
                  ),
                  const Spacer(),
                  ButtonTop(
                    icon: AppImages.save,
                    onTab: _testMethodArrow,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.we, vertical: 30.he),
                child: Column(
                  children: [
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: controllerTitle,
                      maxLength: null,
                      maxLines: null,
                      onChanged: (v) {},
                      cursorColor: AppColors.c_CCCCCC,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                            color: AppColors.c_9A9A9A,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525))),
                    ),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: controllerSubTitle,
                      maxLength: null,
                      maxLines: null,
                      cursorColor: AppColors.c_CCCCCC,
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          hintText: "Type something...",
                          hintStyle: TextStyle(
                            color: AppColors.c_9A9A9A,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide:
                                  BorderSide(color: AppColors.c_252525))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _testMethodArrow() {
    String title = controllerTitle.text;
    String subTitle = controllerSubTitle.text;
    if (title.isNotEmpty && subTitle.isNotEmpty) {
      noteModel = noteModel.copyWith(
        fullName: controllerTitle.text,
        text: controllerSubTitle.text,
      );

      if (widget.notesModel != null) {
        if (title == widget.notesModel!.fullName &&
            subTitle == widget.notesModel!.text) {
          Navigator.pop(context);
        } else {
          showMyDialog(
              context: context,
              onTabSave: () {
                noteModel.copyWith(
                  fullName: title,
                  text: subTitle,
                );
                context.read<NotesBloc>().add(
                      NotesUpdateEvent(
                        newNotesModel: noteModel,
                        confirmNotesModel: widget.notesModel!,
                      ),
                    );
                muySnackBar(context, text: "Malumot yangilandi :)");
                Navigator.pop(context);
                Navigator.pop(context);
              },
              onTabExit: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }
      } else {
        showMyDialog(
            context: context,
            onTabSave: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ColorScreen(
                      noteModel: noteModel,
                    );
                  },
                ),
              );
            },
            onTabExit: () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
      }
    } else {
      Navigator.pop(context);
    }
  }
}
