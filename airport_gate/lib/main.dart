import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/colors.dart';
import 'core/router/route_constants.dart';
import 'core/router/app_router.dart';
import 'cubit/debug/app_bloc_observer.dart';
import 'cubit/gate/gate_info_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer =  AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GateInfoCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Gate Boarding",
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: primaryColor,
            cardColor: nightBlueColor,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            // Define the default brightness and colors.
            colorScheme: ColorScheme.fromSeed(
              primary: primaryColor,
              seedColor: Colors.purple,
              brightness: Brightness.dark,
            ),

          ),
          initialRoute: RouteConstants.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
