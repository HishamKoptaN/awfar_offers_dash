import 'package:awfar_offers_dash/core/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_event.dart';
import '../bloc/main_state.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(
    context,
  ) {
    return MainLayout(
      showAppBar: false,
      body: BlocProvider(
        create: (context) => MainBloc(
          getIt(),
        )..add(
            const MainEvent.check(),
          ),
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            state.whenOrNull(
              logedIn: () {
                customNavigation(
                  context: context,
                  path: '/ControlPanelView',
                );
              },
              logedOut: () {
                customNavigation(
                  context: context,
                  path: '/LoginView',
                );
              },
            );
          },
          builder: (context, state) {
            return Center(
              child: CustomCircularProgress(),
            );
          },
        ),
      ),
    );
  }
}
