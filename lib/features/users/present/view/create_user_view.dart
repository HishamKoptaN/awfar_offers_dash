// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/widgets/app_layout.dart';
// import '../../data/model/getRolesApiRes.dart';
// import '../bloc/users_bloc.dart';
// import '../bloc/users_event.dart';
// import '../../data/model/users_res_model.dart';

// class CreateUserView extends StatefulWidget {
//   const CreateUserView({super.key});

//   @override
//   State<CreateUserView> createState() => _CreateUserViewState();
// }

// class _CreateUserViewState extends State<CreateUserView> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String statusController = 'active';
//   TextEditingController roleController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();

//   final List<String> statuses = ['active', 'inactive'];
//   Role? selectedRole;

//   @override
//   Widget build(BuildContext context) {
//     return AppLayout(
//       route: 'Create Plan',
//       showAppBar: true,
//       body: BlocProvider(
//         create: (_) => UsersBloc()..add(FetchRolesAndPermissons()),
//         child: BlocConsumer<UsersBloc, UsersState>(
//           listener: (context, state) {
//             if (state is UserCreatedSuccessfully) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('User created successfully')),
//               );
//             } else if (state is UserCreationFailed) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text(
//                     'Failed to create User',
//                   ),
//                 ),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is RolesAndPermissonsLoadSuccess) {
//               return Center(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // SizedBox(
//                         //   width: 125.w,
//                         //   height: 50.h,
//                         //   child: DropdownButtonFormField<String>(
//                         //     value: statusController,
//                         //     onChanged: (String? newValue) {
//                         //       setState(() {
//                         //         statusController = newValue!;
//                         //       });
//                         //     },
//                         //     decoration: const InputDecoration(
//                         //       labelText: 'Status',
//                         //       border: OutlineInputBorder(),
//                         //     ),
//                         //     items: statuses
//                         //         .map<DropdownMenuItem<String>>((String value) {
//                         //       return DropdownMenuItem<String>(
//                         //         value: value,
//                         //         child: Text(value),
//                         //       );
//                         //     }).toList(),
//                         //   ),
//                         // ),
//                         SizedBox(
//                           width: 125.w,
//                           height: 50.h,
//                           child: DropdownButtonFormField<Role>(
//                             value: selectedRole,
//                             onChanged: (Role? newValue) {
//                               setState(() {
//                                 selectedRole = newValue;
//                               });
//                             },
//                             decoration: const InputDecoration(
//                               labelText: 'Role',
//                               border: OutlineInputBorder(),
//                             ),
//                             items: state.role
//                                 .map<DropdownMenuItem<Role>>((Role role) {
//                               return DropdownMenuItem<Role>(
//                                 value: role,
//                                 child: Text(role.name!),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                         // MyTextInput(
//                         //   textEditingController: nameController,
//                         //   label: 'Name',
//                         //   enabled: true,
//                         // ),
//                         // MyTextInput(
//                         //   textEditingController: usernameController,
//                         //   label: 'User Name',
//                         //   enabled: true,
//                         // ),
//                         // MyTextInput(
//                         //   textEditingController: emailController,
//                         //   label: 'Email',
//                         //   enabled: true,
//                         // ),
//                         // MyTextInput(
//                         //   textEditingController: passwordController,
//                         //   label: 'password',
//                         //   enabled: true,
//                         //   isNumeric: true,
//                         // ),
//                         // MyTextInput(
//                         //   textEditingController: addressController,
//                         //   label: 'address',
//                         //   enabled: true,
//                         // ),
//                         // MyTextInput(
//                         //   textEditingController: phoneController,
//                         //   label: 'Phone',
//                         //   enabled: true,
//                         // ),
//                         InkWell(
//                           onTap: () async {
//                             // UserCreateModel userCreateModel = UserCreateModel(
//                             //   role: roleController.text,
//                             //   name: nameController.text,
//                             //   username: usernameController.text,
//                             //   email: emailController.text,
//                             //   password: passwordController.text,
//                             //   passwordConfirmation: passwordController.text,
//                             // );

//                             // context.read<UsersBloc>().add(
//                             //       CreateUserEvent(
//                             //           userCreateModel: userCreateModel),
//                             //     );
//                           },
//                           child: Container(
//                             height: 50.h,
//                             width: 100.w,
//                             decoration: BoxDecoration(
//                               color: Colors.amber,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "Create",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontSize: 10.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
