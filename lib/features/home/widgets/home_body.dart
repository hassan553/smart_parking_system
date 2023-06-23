import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/functions/globle_functions.dart';
import '../../widgets/background_widget.dart';
import 'home/book_button.dart';
import 'home/build_right_side.dart';
import 'home/entry_text_box.dart';
import 'home/left_side.dart';
import 'home/rotated_text.dart';
import 'home/welcome_text_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 5, end: 5, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeTextWidget(),
              SizedBox(
                height: screenSize(context).height * .01,
              ),
              const EntryBoxTextWidget(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    LeftSideWidget(),
                    RotatedText(),
                    RightSideWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize(context).height * .02,
              ),
              //DetailsView()
              // const BookButton(),
            ],
          ),
        ),
      ),
    );
  }
}
