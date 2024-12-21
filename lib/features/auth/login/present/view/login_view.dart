import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/app_layout.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/global_widgets.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../forgot_password/forget_password.dart';
import '../../../sign_up/present/view/sign_up_view.dart';
import '../../data/models/login_request_body.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginView extends StatefulWidget {
  LoginView({
    super.key,
  });
  static const String routeName = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    validator(String? value) {
      if (value == null) {
        return "مطلوب";
      }
      if (value.isEmpty) {
        return "مطلوب";
      }
      return null;
    }

    return AppLayout(
      showAppBar: false,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          getIt(),
        ),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            state.mapOrNull(
              success: (data) {
                customNavigation(
                  context: context,
                  path: '/ControlPanelView',
                );
              },
              error: (error) {
                ToastNotifier().showFailure(
                  context: context,
                  message: "t.error",
                );
              },
            );
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(
                        16.h,
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/icons/launcher_icon.jpg',
                          height: 125.h,
                          width: 125.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Gap(
                              30.h,
                            ),
                            TextFormField(
                              controller: _email,
                              validator: validator,
                              decoration: InputDecoration(
                                hintText: "البريد الإلكتروني",
                                suffixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Color(0xffC9CECF),
                                ),
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color(0xff949D9E),
                                ),
                                filled: true,
                                fillColor: const Color(0xffF9FAFA),
                                border: buildBorder(),
                                enabledBorder: buildBorder(),
                                focusedBorder: buildBorder(),
                              ),
                            ),
                            Gap(
                              16.h,
                            ),
                            TextFormField(
                              controller: _password,
                              validator: validator,
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                hintText: "كلمة المرور",
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        showPassword = !showPassword;
                                      },
                                    );
                                  },
                                  child: Icon(
                                    showPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: const Color(0xffC9CECF),
                                  ),
                                ),
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color(0xff949D9E)),
                                filled: true,
                                fillColor: const Color(0xffF9FAFA),
                                border: buildBorder(),
                                enabledBorder: buildBorder(),
                                focusedBorder: buildBorder(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordScreen(),
                                    ),
                                  );
                                },
                                child: const Text("نسيت كلمة المرور؟",
                                    style: TextStyles.bold13),
                              ),
                            ),
                            Gap(
                              16.h,
                            ),
                            CustomTextButtonWidget(
                              widget: state.maybeWhen(
                                loading: () {
                                  return CustomCircularProgress();
                                },
                                orElse: () {
                                  return CustomText(
                                    text: "تسجيل الدخول",
                                    color: Colors.white,
                                    fontFamily: "Arial",
                                    fontSize: 25.sp,
                                  );
                                },
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(
                                        LoginEvent.login(
                                          loginRequestBody: LoginRequestBody(
                                            email: _email.text,
                                            password: _password.text,
                                          ),
                                        ),
                                      );
                                }
                              },
                            ),
                            Gap(
                              16.h,
                            ),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    "أو",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Gap(
                              16.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpView(),
                                  ),
                                );
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: " ليس لديك حساب ؟",
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "أنشئ",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.lightPrimaryColor,
                                        decorationThickness: 2.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Color(0xffE6E9E9),
        width: 1,
      ),
    );
  }
}
