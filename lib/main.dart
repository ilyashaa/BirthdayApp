import 'package:birthday_app/bloc/guest_bloc.dart';
import 'package:birthday_app/screens/guest_screen/guest_home.dart';
import 'package:birthday_app/screens/guest_screen/new_guest_add.dart';
import 'package:birthday_app/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GuestBloc(context))],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              appBarTheme: AppBarTheme(color: Colors.white),
            ),
            home: MainScreen(),
            routes: <String, WidgetBuilder>{
              '/a': (context) => const MainScreen(),
              '/b': (context) => const GuestHome(),
              '/c': (context) => const NewGuest(),
            },
          );
        },
      ),
    );
  }
}
