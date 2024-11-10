import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigation({
  required BuildContext context,
  required String path,
  Map<String, String>? params,
  Object? extra, // إضافة extra لدعم تمرير النموذج
}) {
  final uri = Uri(
    path: path,
    queryParameters: params,
  );
  GoRouter.of(context).push(
    uri.toString(),
    extra: extra, // تمرير extra إلى GoRouter
  );
}

// استدعاء customNavigation وتمرير coupon
