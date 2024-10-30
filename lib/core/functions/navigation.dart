import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigation({
  required BuildContext context,
  required String path,
}) {
  GoRouter.of(context).push(path);
}
