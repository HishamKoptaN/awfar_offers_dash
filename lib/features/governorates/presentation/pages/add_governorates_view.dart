import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/circular_progress.dart';
import '../../../../core/global/custom_text_form_field.dart';
import '../../../../core/global/gobal_widgets/global_widgets.dart';
import '../../../countries/data/models/countries_response_model.dart';
import '../../data/models/add_governorate_request_model.dart';
import '../bloc/governorates_bloc.dart';
import '../bloc/governorates_event.dart';
import '../bloc/governorates_state.dart';

class AddGovernorateView extends StatefulWidget {
  const AddGovernorateView({
    super.key,
  });

  @override
  State<AddGovernorateView> createState() => _AddGovernorateViewState();
}

Country? selectedCountry;
AddGovernorateRequestModel addGovernorateRequestModel =
    AddGovernorateRequestModel();
final countries = CountriesResponseModel().countries;

class _AddGovernorateViewState extends State<AddGovernorateView> {
  @override
  Widget build(context) {
    return MainLayout(
      showAppBar: true,
      route: 'أضافة محافظة',
      // onPressed: () {
      //   customNavigation(
      //     context: context,
      //     path: '/',
      //   );
      // },
      body: BlocProvider(
        create: (_) => getIt<GovernoratesBloc>(),
        child: BlocConsumer<GovernoratesBloc, GovernoratesState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (governoratesResponseModel) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "نجاح",
                    ),
                  ),
                );
                customNavigation(
                  context: context,
                  path: '/GovernoratesView',
                );
              },
              failure: (error) async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error,
                    ),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const CustomCircularProgress();
              },
              orElse: () {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hintText: 'اسم المحافظه',
                        textInputType: TextInputType.text,
                        onChanged: (value) {
                          addGovernorateRequestModel.name = value;
                        },
                      ),
                      Gap(
                        10.h,
                      ),
                      SizedBox(
                        height: 75.h,
                        width: 450.w,
                        child: DropdownButton<Country>(
                          isExpanded: true,
                          value: selectedCountry,
                          onChanged: (value) {
                            setState(
                              () {
                                selectedCountry = value;
                                addGovernorateRequestModel.countryId =
                                    value!.id!;
                              },
                            );
                          },
                          items: countries!.map(
                            (country) {
                              return DropdownMenuItem<Country>(
                                value: country,
                                child: Center(
                                  child: Flag.fromString(
                                    country.code!,
                                    height: 50.h,
                                    width: 100.w,
                                    fit: BoxFit.fill,
                                    replacement: Flag.fromString(
                                      country.code!,
                                      height: 50.h,
                                      width: 100.w,
                                      fit: BoxFit.fill,
                                      replacement: Text(
                                        country.code ?? 'أختر الدوله',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Gap(
                        10.h,
                      ),
                      CustomTextButton(
                        text: 'أضافة',
                        onPressed: () async {
                          context.read<GovernoratesBloc>().add(
                                GovernoratesEvent.addGovernorate(
                                  addGovernorateRequestModel:
                                      addGovernorateRequestModel,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
