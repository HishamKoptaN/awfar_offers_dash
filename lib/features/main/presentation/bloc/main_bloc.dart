import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../domain/usecases/check_use_case.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CheckUseCase checkUseCase;
  MainBloc(this.checkUseCase)
      : super(
          const MainState.loading(),
        ) {
    on<MainEvent>(
      (event, emit) async {
        await event.when(
          check: () async {
            String? token = await SharedPrefHelper.getSecuredString(
              key: SharedPrefKeys.userToken,
            );
            if (token == null || token.isEmpty) {
              emit(const MainState.logedOut());
            } else {
              final result = await checkUseCase.check();
              await result.when(
                success: (response) async {
                  emit(
                    const MainState.logedIn(),
                  );
                },
                failure: (error) async {
                  emit(
                    const MainState.logedOut(),
                  );
                },
              );
            }
          },
          checkEmailVerification: () {},
        );
      },
    );
  }
}
// SharedPreferences prefs = await SharedPreferences.getInstance();
//  await saveUserToken(
//                     response.user.token,
//                   );
//                   final bool canAuthenticate = await auth.canCheckBiometrics &&
//                       await auth.isDeviceSupported() &&
//                       prefs.getBool("fingerprints")!;
//                   if (canAuthenticate) {
//                     final bool didAuth = await auth.authenticate(
//                       localizedReason:
//                           'First Please authenticate to show access account',
//                     );
//                     if (didAuth) {
//                       emit(const MainState.logedIn());
//                     } else {
//                       emit(
//                         const MainState.error(
//                           error: "",
//                         ),
//                       );
//                     }
//                   } else {
//                     emit(
//                       const MainState.logedIn(),
//                     );
//                   }