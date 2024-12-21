import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class PickImageWidget extends StatefulWidget {
  PickImageWidget({
    super.key,
    required this.label,
    required this.onImagePicked,
  });
  final Function(
    Uint8List? imageBytes,
  ) onImagePicked;

  String label;

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: 300.w,
      child: InkWell(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            final file = result.files.single;
            setState(
              () {
                imageBytes = file.bytes;
                widget.onImagePicked(
                  imageBytes, // يتم إرسال الصورة بصيغة Uint8List
                );
              },
            );
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: imageBytes == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.cloudArrowUp,
                    ),
                    Text(widget.label),
                    Gap(
                      20.h,
                    ),
                  ],
                )
              : Image.memory(
                  imageBytes!,
                ),
        ),
      ),
    );
  }
}
