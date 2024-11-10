import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_layout.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/global/gobal_widgets/custom_button.dart';
import '../../../../core/global/gobal_widgets/custom_data_cell.dart';
import '../../../../core/global/gobal_widgets/custom_data_column.dart';
import '../../../../core/global/gobal_widgets/generic_table_view.dart';
import '../../../../core/global/gobal_widgets/image_preview.dart';
import '../../data/models/stores_response_model.dart';
import '../bloc/stores_bloc.dart';
import '../bloc/stores_event.dart';
import '../bloc/stores_state.dart';

class StoresView extends StatefulWidget {
  const StoresView({
    super.key,
  });
  @override
  State<StoresView> createState() => _StoresViewState();
}

class _StoresViewState extends State<StoresView> {
  @override
  Widget build(
    context,
  ) {
    return MainLayout(
      showAppBar: false,
      backArow: false,
      route: '',
      body: BlocConsumer<StoresBloc, StoresState>(
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
        builder: (context, state) {
          return data(
            state: state,
          );
        },
      ),
    );
  }
}

class data extends StatefulWidget {
  data({
    super.key,
    required this.state,
  });
  StoresState state;

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  Widget build(
    context,
  ) {
    return GenericTableView<Store>(
      routeName: "الكوبونات",
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
      items: StoresResponseModel().stores!,
      buildRow: (store) => DataRow(
        cells: [
          customDataCell(
            label: store.id.toString(),
          ),
          customDataCell(
            label: store.name,
          ),
          DataCell(
            InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageScreen(
                      imageUrl: store.image,
                    ),
                  ),
                );
              },
              child: CachedNetworkImage(
                height: 100.h,
                width: 100.w,
                imageUrl: store.image,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: CustomTextButton(
                onPressed: () {
                  customNavigation(
                    context: context,
                    path: '/EditStoreView',
                    extra: store,
                  );
                },
                text: 'تعديل',
              ),
            ),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: CustomTextButton(
                widget: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 35.sp,
                ),
                onPressed: () {
                  context.read<StoresBloc>().add(
                        StoresEvent.delete(
                          id: store.id,
                        ),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
