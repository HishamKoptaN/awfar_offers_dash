import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_circular_progress.dart';
import '../../../../core/global/gobal_widgets/custom_data_cell.dart';
import '../../../../core/global/gobal_widgets/custom_data_column.dart';
import '../../../../core/global/gobal_widgets/image_preview.dart';
import '../../data/models/stores_response_model.dart';
import '../bloc/stores_bloc.dart';
import '../bloc/stores_event.dart';
import '../bloc/stores_state.dart';

class StoresView extends StatelessWidget {
  const StoresView({
    super.key,
  });

  @override
  Widget build(
    context,
  ) {
    final stores = StoresResponseModel().stores ?? [];
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: '',
      body: Center(
        child: BlocProvider(
          create: (context) => StoresBloc(
            getIt(),
            getIt(),
          ),
          child: BlocListener<StoresBloc, StoresState>(
            listener: (context, state) async {
              state.whenOrNull(
                failure: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        error.error!,
                      ),
                    ),
                  );
                },
              );
            },
            child: BlocBuilder<StoresBloc, StoresState>(
              builder: (context, state) {
                state.whenOrNull(
                  initial: () {
                    context.read<StoresBloc>().add(
                          const StoresEvent.getEvent(),
                        );
                  },
                );
                return state.maybeWhen(
                  orElse: () {
                    return SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columns: [
                            customDataColumn(
                              label: 'معرف الدوله',
                            ),
                            customDataColumn(
                              label: 'الاسم',
                            ),
                            customDataColumn(
                              label: 'صورة المتجر',
                            ),
                            DataColumn(
                              label: CustomTextButton(
                                onPressed: () {
                                  customNavigation(
                                    context: context,
                                    path: '/AddStoreView',
                                  );
                                },
                                text: 'أضافة متجر',
                              ),
                            ),
                          ],
                          rows: stores.map(
                            (store) {
                              return DataRow(
                                cells: [
                                  customDataCell(
                                    label: store.id.toString(),
                                  ),
                                  customDataCell(
                                    label: store.name!,
                                  ),
                                  DataCell(
                                    InkWell(
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ImageScreen(
                                              imageUrl: store.image!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: CachedNetworkImage(
                                        height: 100.h,
                                        width: 100.w,
                                        imageUrl: store.image!,
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  customDataCell(
                                    label: "",
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    );
                  },
                  loading: () => CustomCircularProgress(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
