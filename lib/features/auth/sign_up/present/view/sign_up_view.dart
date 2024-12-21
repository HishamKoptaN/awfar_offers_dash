import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../login/present/view/login_view.dart';
import '../../bloc/sign_up_bloc.dart';
import '../../bloc/sign_up_event.dart';
import '../../bloc/sign_up_state.dart';
import '../../data/models/sign_up_request_body.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _name = TextEditingController(
    text: !kReleaseMode ? "hesham" : "",
  );
  final TextEditingController _address = TextEditingController(
    text: !kReleaseMode ? "aiat" : "",
  );
  final TextEditingController _phone = TextEditingController(
    text: !kReleaseMode ? "01120332361" : "",
  );
  final TextEditingController _email = TextEditingController(
    text: !kReleaseMode ? "heshamkoptan@gmail.com" : "",
  );
  final TextEditingController _password = TextEditingController(
    text: !kReleaseMode ? "admin" : "",
  );
  final TextEditingController _passwordConfirmation = TextEditingController(
    text: !kReleaseMode ? "admin" : "",
  );
  final TextEditingController _code = TextEditingController(
    text: !kReleaseMode ? "test" : "",
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _isoCode = "MA";
  bool isLoading = false;
  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    _passwordConfirmation.dispose();
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    validator(String? value) {
      if (value == null) {
        return " t?.required";
      }
      if (value.isEmpty) {
        return "t?.required";
      }
      return null;
    }

    return BlocProvider<SignUpBloc>(
      create: (context) => getIt<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (apiErrorModel) {
              ToastNotifier().showSuccess(
                context: context,
                message: " t!.success",
              );
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NavigateBarView(),
              //   ),
              //   (route) => false,
              // );
            },
            error: (error) async {
              ToastNotifier().showFailure(
                context: context,
                message: "t!.error",
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          // List<DropdownMenuItem<String>>? countriesList = [];
          // for (var country in countries) {
          //   countriesList.add(
          //     DropdownMenuItem(
          //       value: country['code'],
          //       alignment: AlignmentDirectional.center,
          //       child: Text(
          //         country['name']!,
          //         overflow: TextOverflow.visible,
          //         style: const TextStyle(
          //           fontSize: 20,
          //         ),
          //       ),
          //     ),
          //   );
          // }
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "AQUAN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              elevation: 2,
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.center,
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Gap(20),
                    const Text(
                      "أنشاء حساب",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: " t.name",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.account_box,
                        ),
                      ),
                    ),
                    const Gap(30),
                    // DropdownButtonFormField<String>(
                    //   value: "EG",
                    //   isExpanded: true,
                    //   decoration: InputDecoration(
                    //     contentPadding: const EdgeInsets.symmetric(
                    //       vertical: 20,
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(2),
                    //     ),
                    //   ),
                    //   items: countriesList,
                    //   onChanged: (value) => {
                    //     WidgetsBinding.instance.addPostFrameCallback(
                    //       (_) => setState(
                    //         () {
                    //           _address.text = value!;
                    //           _isoCode = value;
                    //         },
                    //       ),
                    //     )
                    //   },
                    // ),
                    Gap(
                      30.h,
                    ),
                    // InternationalPhoneNumberInput(
                    //   onInputChanged: (number) {},
                    //   selectorConfig: const SelectorConfig(
                    //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    //     useBottomSheetSafeArea: true,
                    //     trailingSpace: false,
                    //   ),
                    //   ignoreBlank: false,
                    //   // locale: Storage.getString('language') ?? 'en',
                    //   autoValidateMode: AutovalidateMode.disabled,
                    //   selectorTextStyle: const TextStyle(color: Colors.black),
                    //   initialValue: PhoneNumber(isoCode: _isoCode),
                    //   textFieldController: _phone,
                    //   hintText: t.phoneNumber,
                    //   formatInput: true,
                    //   keyboardType: const TextInputType.numberWithOptions(
                    //     signed: true,
                    //     decimal: true,
                    //   ),
                    //   inputBorder: const OutlineInputBorder(),
                    // ),
                    const Gap(30),
                    TextFormField(
                      controller: _email,
                      validator: validator,
                      decoration: const InputDecoration(
                        // labelText: t.email,
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        // labelText: t.password,
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.password,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _passwordConfirmation,
                      obscureText: true,
                      decoration: const InputDecoration(
                        // labelText: t.passwordConfirmation,
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.password,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _code,
                      obscureText: true,
                      decoration: const InputDecoration(
                        // labelText: t.invitationCode,
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.abc,
                        ),
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () async {
                          context.read<SignUpBloc>().add(
                                SignUpEvent.signUp(
                                  signUpRequestBody: SignUpRequestBody(
                                    email: _email.text,
                                    password: _password.text,
                                    name: _name.text,
                                    address: _address.text,
                                    phone: _phone.text,
                                    passwordConfirmation:
                                        _passwordConfirmation.text,
                                  ),
                                ),
                              );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child:
                            //  (state is SignUpLoading)
                            //     ? const CircularProgressIndicator(
                            //         color: Colors.white,
                            //       )
                            //     :
                            const Text(
                          "t.signUp",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Arial",
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      alignment: Alignment.center,
                      // child: Text(t.or),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: const Text(
                          "t.login",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Arial",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
