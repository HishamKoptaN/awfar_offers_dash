import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../domain/use_cases/sign_up_use_case.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc(this.signUpUseCase)
      : super(
          const SignUpState.initial(),
        ) {
    on<SignUpEvent>(
      (event, emit) async {
        await event.when(
          signUp: (signUpRequestBody) async {
            final result = await signUpUseCase.signUp(
              signUpRequestBody: signUpRequestBody,
            );
            await result.when(
              success: (auth) async {
                await SharedPrefHelper.setSecuredString(
                  key: SharedPrefKeys.userToken,
                  value: auth.token!,
                );
                emit(
                  SignUpState.success(
                    auth: auth,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SignUpState.error(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );

    // on<CompleteSignUp>(
    //   (event, emit) async {
    //     emit(SignUpLoading());
    //     final Map<String, dynamic> response =
    //         await _authController.completeSignUp(
    //       event.password,
    //       event.passwordConfirmation,
    //       event.code,
    //     );
    //     if (response['status'] == true) {
    //       emit(SignUpCompleted());
    //     } else {
    //       emit(AuthErrors(message: response['error']));
    //     }
    //   },
    // );

    // on<ResetPassword>(
    //   (event, emit) async {
    //     final Map<String, dynamic> response =
    //         await _authController.resetPassword(event.email);

    //     if (response['status'] == true) {
    //       emit(
    //         ResetPassowrdEmailSent(
    //           message: response['message'],
    //         ),
    //       );
    //     } else {
    //       emit(
    //         AuthErrors(
    //           message: response['error'],
    //         ),
    //       );
    //     }
    //   },
    // );
    // on<SignInWithGoogle>(
    //   (event, emit) async {
    //     emit(AuthLoading());
    //     final Map<String, dynamic> response =
    //         await _authController.signInWithGoogle(
    //       event.email,
    //       event.name,
    //     );
    //     if (response['status'] == true) {
    //       // Storage.setString('auth_token', response['token']);
    //       emit(AuthLogedIn(createPassword: response['create_password']));
    //     } else {
    //       // emit(EmailVerified(verified: true, message: response['error']));
    //     }
    //   },
    // );
  }
}
