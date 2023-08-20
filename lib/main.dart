import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:marvix/modules/login/login.dart';
import 'package:marvix/modules/login/loginCubit/loginCubit.dart';
import 'package:marvix/modules/onBoardingScreen/onboardingscreen.dart';
import 'package:marvix/shared/Components/themes.dart';
import 'package:marvix/shared/network/local/cacheHelper.dart';
import 'package:marvix/shared/network/remote/dioHelper.dart';
import 'layout/layout.dart';



void main() async {



  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  late Widget startUpScreen;
  if(CacheHelper.getData("onBoarding") ?? true)
  {
    bool isOnBoarding = CacheHelper.getData("onBoarding") ?? false;
    dynamic token = CacheHelper.getData("token") ?? "empty";
    if (isOnBoarding)
    {
      if(token == null || token == "empty")
      {
        startUpScreen = const Login();
      }
      else
      {
        startUpScreen = const Layout();
      }
    }
    else
    {
      startUpScreen = const OnBoardingScreen();
    }
  }

  runApp(MyApp(home: startUpScreen,));
}

// bloc observer
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onChange -- ${bloc.runtimeType}, $change');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print('onClose -- ${bloc.runtimeType}');
    }
  }
}

class MyApp extends StatelessWidget {
  final Widget? home;
  const MyApp({super.key, required this.home});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(create: (BuildContext context) => ShopCubit()
      ..receiveProductsData()..receiveCategoriesData()..receiveUserData()..receiveCategoriesData()..startupTheme()),
      BlocProvider(create: (BuildContext context) => LoginCubit()),

    ],
        child: BlocConsumer<ShopCubit, ShopCubitStates>(builder: (context, state)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mavix',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ShopCubit.of(context).theme,
          home: home,
        ),
            listener:(context, state)=>{} ));
  }
}
