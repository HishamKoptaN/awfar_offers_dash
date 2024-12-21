import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awfar_offers_dash/features/notifications/present/bloc/notifications_bloc.dart';
import 'core/app_observer.dart';
import 'core/di/dependency_injection.dart';
import 'core/routes/app_router.dart';
import 'core/services/local_notifications_services.dart';
import 'core/services/push_notifications_services.dart';
import 'features/categories/presentation/bloc/categories_bloc.dart';
import 'features/categories/presentation/bloc/categories_event.dart';
import 'features/countries/presentation/bloc/countries_bloc.dart';
import 'features/countries/presentation/bloc/countries_event.dart';
import 'features/coupons/presentation/bloc/coupons_bloc.dart';
import 'features/coupons/presentation/bloc/coupons_event.dart';
import 'features/governorates/presentation/bloc/governorates_bloc.dart';
import 'features/governorates/presentation/bloc/governorates_event.dart';
import 'features/main/present/bloc/main_bloc.dart';
import 'features/main/present/bloc/main_event.dart';
import 'features/notifications/present/bloc/notifications_event.dart';
import 'features/offer_groups/presentation/bloc/offer_groups_bloc.dart';
import 'features/offers/presentation/bloc/offers_bloc.dart';
import 'features/stores/present/bloc/stores_bloc.dart';
import 'features/stores/present/bloc/stores_event.dart';
import 'features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import 'features/sub_categories/presentation/bloc/sub_categories_event.dart';
import 'features/sub_categories_items/presentation/bloc/markas_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future.wait(
    [
      PushNotificationsServices.init(),
      LocalNotificationsServices.init(),
    ],
  );
  await Injection.inject();
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountriesBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => GovernoratesBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => StoresBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => OfferGroupsBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => OffersBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => SubCategoriesBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => MarkasBloc(
            getMarkasUseCase: getIt(),
            addMarkaUseCase: getIt(),
            editUseCase: getIt(),
            deleteUseCase: getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => CouponsBloc(
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => NotificationsBloc(
            getNotificationsUseCase: getIt(),
            editNotificationsUseCase: getIt(),
            addNotificationUseCase: getIt(),
            deleteNotificationUseCase: getIt(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(),
    // ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool error = false;

  Future<Null> newMethod() async {
    await Future.microtask(
      () {
        context.read<CountriesBloc>().add(
              const CountriesEvent.get(),
            );
        context.read<GovernoratesBloc>().add(
              const GovernoratesEvent.get(),
            );
        context.read<StoresBloc>().add(
              const StoresEvent.get(),
            );
        context.read<CategoriesBloc>().add(
              const CategoriesEvent.get(),
            );
        context.read<SubCategoriesBloc>().add(
              const SubCategoriesEvent.get(),
            );

        context.read<CouponsBloc>().add(
              const CouponsEvent.get(),
            );
        context.read<NotificationsBloc>().add(
              const NotificationsEvent.get(),
            );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    newMethod();
  }

  @override
  Widget build(context) {
    double heiht = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(
          width,
          heiht,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocProvider(
          create: (context) => MainBloc(
            getIt(),
          )..add(
              const MainEvent.check(),
            ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar'),
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Awfer offers',
            color: Colors.white,
            theme: ThemeData(
              primaryColor: Colors.amber,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Theme.of(context).primaryColor,
              ),
              fontFamily: "Arial",
              useMaterial3: true,
            ),
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
