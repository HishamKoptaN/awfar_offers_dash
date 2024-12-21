 //     Column(
                  // children: [
                  //   // if (selectedUserIds.isNotEmpty)
                  //   //   Padding(
                  //   //     padding: const EdgeInsets.all(10.0),
                  //   //     child: Row(
                  //   //       children: [
                  //   //         Expanded(
                  //   //           flex: 5,
                  //   //           child: CustomTextField(
                  //   //             label: "الاشعار",
                  //   //             enabled: true,
                  //   //             onChanged: (value) {
                  //   //               NotifyRequest().message = value;
                  //   //             },
                  //   //           ),
                  //   //         ),
                  //   //         Expanded(
                  //   //           flex: 1,
                  //   //           child: CustomButtonWidget(
                  //   //             width: 150.w,
                  //   //             widget: state.maybeWhen(
                  //   //               loading: () {
                  //   //                 return const CustomCircularProgress();
                  //   //               },
                  //   //               orElse: () {
                  //   //                 return CustomText(
                  //   //                   text: "أرسال أشعار",
                  //   //                   fontSize: 25.sp,
                  //   //                   color: Colors.blue,
                  //   //                   fontWeight: FontWeight.bold,
                  //   //                 );
                  //   //               },
                  //   //             ),
                  //   //             onPressed: () {
                  //   //               if (NotifyRequest().message!.isNotEmpty) {
                  //   //                 context.read<UsersBloc>().add(
                  //   //                       UsersEvent.notify(
                  //   //                         notifyRequest: NotifyRequest(),
                  //   //                       ),
                  //   //                     );
                  //   //               }
                  //   //             },
                  //   //           ),
                  //   //         ),
                  //   //       ],
                  //   //     ),
                  //   //   ),
                  //   SingleChildScrollView(
                  //     child:
                  //   ),
                  // ],
                  // );