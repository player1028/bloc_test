part of app_bloc;



class AppState{
  final int count;

  AppState({required this.count});
}



class InitState extends AppState{
  InitState() : super(count: 0);
}