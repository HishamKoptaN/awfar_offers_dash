import 'package:flutter/material.dart';

class GenericTableView<T> extends StatelessWidget {
  final String routeName;
  final List<DataColumn> columns;
  final List<T> items;
  final void Function(BuildContext context, T item)? onDelete;
  final DataRow Function(T item) buildRow;

  const GenericTableView({
    super.key,
    required this.routeName,
    required this.columns,
    required this.items,
    required this.buildRow,
    this.onDelete,
  });

  @override
  Widget build(context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: columns,
            rows: items.map(buildRow).toList(),
          ),
        ),
      ),
    );
  }
}
// return GenericTableView<Coupon>(
//                   routeName: "الكوبونات",
//                   columns: [
//                     customDataColumn(
//                       label: ' ',
//                     ),
//                     customDataColumn(
//                       label: '',
//                     ),
//                     customDataColumn(
//                       label: '',
//                     ),
//                     customDataColumn(
//                       label: '',
//                     ),
//                     customDataColumn(
//                       label: '',
//                     ),
//                   ],
//                   items: CouponsResponseModel().coupons!,
//                   buildRow: (coupon) => DataRow(
//                     cells: [
//                       customDataCell(
//                         label: coupon.id.toString(),
//                       ),
//                       customDataCell(
//                         label: coupon.code ?? "",
//                       ),
//                       customDataCell(
//                         label: coupon.store?.name ?? "",
//                       ),
//                       customDataCell(
//                         label: coupon.description ?? "",
//                       ),
//                       DataCell(
//                         IconButton(
//                           icon: Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                             size: 35.sp,
//                           ),
//                           onPressed: () => context.read<CouponsBloc>().add(
//                                 CouponsEvent.deleteCoupons(id: coupon.id!),
//                               ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );