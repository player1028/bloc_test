import 'package:bloc_test/app_bloc.dart';
import 'package:bloc_test/pages/screens/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_test/pages/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) {
        final app_bloc = AppBloc();
        final welcome_bloc = WelcomeBloc();
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => app_bloc,
            ),
            BlocProvider(
              create: (context) => welcome_bloc,
            ),
          ],
          child: MaterialApp(
            home: Welcome(welcome_bloc: welcome_bloc,),
          ),
        );
      },
    );
  }
}


class MyHomePage extends StatelessWidget {
  final AppBloc app_bloc;

  const MyHomePage({Key? key, required this.app_bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () {
            app_bloc.add(IncrementEvent());
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: () {
            app_bloc.add(DecrementEvent());
          }, icon: Icon(Icons.remove))
        ],
      ),
      body: Center(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Text(
              '${state.count}', style: TextStyle(
                fontSize: 24.w
            ),
            );
          },
        ),
      ),
    );
  }
}
