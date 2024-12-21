import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(
    this.loginUseCase,
  ) : super(
          const LoginState.initial(),
        ) {
    on<LoginEvent>(
      (event, emit) async {
        await event.when(
          login: (loginRequestBody) async {
            emit(
              const LoginState.loading(),
            );
            final response = await loginUseCase.login(
              loginRequestBody: loginRequestBody,
            );
            await response.when(
              success: (response) async {
                await SharedPrefHelper.setSecuredString(
                  key: SharedPrefKeys.userToken,
                  value: response.token!,
                );
                UserSingleton.instance.user = response.user;
                emit(
                  const LoginState.success(),
                );
              },
              failure: (
                error,
              ) async {
                emit(
                  LoginState.error(
                    apiErrorModel: error,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
