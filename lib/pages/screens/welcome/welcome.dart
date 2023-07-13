import 'package:bloc_test/pages/screens/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_test/pages/screens/welcome/bloc/welcome_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Welcome extends StatelessWidget {
  final welcome_bloc;

  const Welcome({Key? key, required this.welcome_bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      bloc: welcome_bloc,
      builder: (context, state) {
        double page = state.page.toDouble();
        return Scaffold(
          body: Container(
            width: 375.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  onPageChanged: (page) {
                    state.page = page;
                    welcome_bloc.add(WelcomeEvent());
                    print(page);
                  },
                  children: [
                    _page(
                        1,
                        'First See Learning',
                        'next'
                    ),
                    _page(
                        2,
                        'Forgrer',
                        'next'
                    ),
                    _page(
                        3,
                        'Get an app',
                        'get started'
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _page(int page, String title, String buttonName) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Text(
              'Image one'
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.w,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
          child: Text(
            'Forget a for a paper learning, all knowledge in your pocket',
            style: TextStyle(
                fontSize: 14.w,
                color: Colors.black.withOpacity(0.5)
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
          width: 320.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1)
                )
              ]
          ),
          child: Center(
            child: Text(
                buttonName
            ),
          ),
        )
      ],
    );
  }
}
