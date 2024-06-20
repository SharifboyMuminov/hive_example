import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_example/blocs/notes/notes_bloc.dart';
import 'package:hive_example/blocs/notes/notes_event.dart';
import 'package:hive_example/blocs/notes/notes_state.dart';
import 'package:hive_example/data/models/from_status/from_status.dart';
import 'package:hive_example/screens/add_screen/add_screen.dart';
import 'package:hive_example/screens/home_screen/widgets/empty_show.dart';
import 'package:hive_example/screens/home_screen/widgets/item_note.dart';
import 'package:hive_example/screens/home_screen/widgets/text_fild.dart';
import 'package:hive_example/screens/widget/top_button.dart';
import 'package:hive_example/utils/app_colors.dart';
import 'package:hive_example/utils/app_images.dart';
import 'package:hive_example/utils/app_size.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
            !showSearch ? 50.getH() : const SizedBox(),
            if (!showSearch)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.we),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notes",
                      style: TextStyle(
                        color: AppColors.c_FFFFFF,
                        fontSize: 43.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ButtonTop(
                      icon: AppImages.searcheSvg,
                      onTab: () {
                        setState(
                          () {
                            showSearch = true;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            showSearch ? 65.getH() : const SizedBox(),
            if (showSearch)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.we),
                child: SearchTextField(
                  onChge: (v) {
                    context.read<NotesBloc>().add(NotesSearchEvent(title: v));
                  },
                  onTabXmark: () {
                    showSearch = false;
                    setState(() {});
                  },
                ),
              ),
            15.getH(),
            BlocBuilder<NotesBloc, NotesState>(
              builder: (BuildContext context, NotesState state) {
                if (state.fromStatus == FromStatus.loading) {
                  return Center(
                    child: Text(
                      state.errorText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  );
                }

                if (state.fromStatus == FromStatus.success) {
                  if (state.allNotes.isEmpty) {
                    return Column(
                      children: [
                        182.getH(),
                        ShowEmptyImage(
                          isSearch: showSearch,
                        ),
                      ],
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24.we),
                        itemCount: state.allNotes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemNoteButton(
                            isActiveRemove: state.allNotes[index].isRemove,
                            onTab: () async {
                              if (state.allNotes[index].isRemove &&
                                  state.allNotes[index].id != null) {
                                context.read<NotesBloc>().add(NotesDeleteEvent(
                                    noteModel: state.allNotes[index]));

                                showSearch = false;
                                setState(() {});
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddScreen(
                                        isInfo: true,
                                        personModul: state.allNotes[index],
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            onLongPress: () {
                              setState(
                                () {
                                  state.allNotes[index].isRemove =
                                      !state.allNotes[index].isRemove;
                                },
                              );
                            },
                            noteModel: state.allNotes[index],
                            backgroundColor: state.allNotes[index].color,
                          );
                        },
                      ),
                    );
                  }
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white10,
                            Colors.white,
                            Colors.white10,
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.we, vertical: 5.he),
                          width: width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: SizedBox(
          height: 70.we,
          width: 70.we,
          child: FloatingActionButton(
            backgroundColor: AppColors.c_3B3B3B,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddScreen();
                  },
                ),
              );
            },
            child: Icon(
              Icons.add,
              size: 35.we,
            ),
          ),
        ),
      ),
    );
  }
}
