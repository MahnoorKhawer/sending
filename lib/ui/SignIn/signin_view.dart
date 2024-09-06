import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:starting_todo_app/generated/assets.dart';
import 'package:starting_todo_app/ui/SignIn/signin_logic.dart';
import 'package:starting_todo_app/utils/color.dart';

import '../../routes/app_routes.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/common_button.dart';
import '../Login/login_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text('Sign Up',style: TextStyle(color: AppColor.darkGreen,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppSizes.height_1,
                        ),
                        GetBuilder<SignInController>(
                            id: Constant.idNameInput,
                            builder: (logic) {
                               return  TextFormField(
                                controller: controller.nameController,
                                keyboardType: TextInputType.name,
                                 validator: (value){
                                   controller.isNameValid(value!);
                                 },
                                decoration: InputDecoration(
                                  labelText: '  Name',
                                  labelStyle: TextStyle(color: AppColor.gray),
                                  border: InputBorder.none,
                                ),
                              );
                            }),
                        SizedBox(
                          height: AppSizes.height_2,
                        ),
                        GetBuilder<SignInController>(
                            id: Constant.idEmailInput,
                            builder: (logic) {
                              return  TextFormField(
                                controller: controller.emailController,
                                keyboardType: TextInputType.name,
                                validator: (value){
                                  controller.isEmailValid(value!);
                                },
                                decoration: InputDecoration(
                                  labelText: '  Email',
                                  labelStyle: TextStyle(color: AppColor.gray),
                                  border: InputBorder.none,
                                ),
                              );
                            }),
                        GetBuilder<SignInController>(
                            id: Constant.idPasswordInput,
                            builder: (logic) {
                              return  TextFormField(
                                controller: controller.passwordController,
                                keyboardType: TextInputType.name,
                                validator: (value){
                                  controller.isPasswordValid(value!);
                                },
                                obscureText: logic.isShowPassword,

                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: logic.toggleShowHidePassword, // Toggles password visibility
                                    child: Icon(
                                      logic.isShowPassword ? Icons.visibility_off : Icons.visibility, // Changes the icon based on password visibility
                                      color: AppColor.colorGreen,
                                    ),
                                  ),
                                  labelText: '  Password',
                                  labelStyle: TextStyle(color: AppColor.gray),
                                  border: InputBorder.none,
                                ),
                              );
                            }),
                        SizedBox(
                          height: AppSizes.height_2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                                Text('Already have an account?',
                                  style: TextStyle(color: AppColor.darkGreen,fontSize: 14,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.darkGreen,
                                  ),),
                            SizedBox(width: 5,),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginInScreen()),
                                        (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text('SignIn',style: TextStyle(color: AppColor.colorGreen),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.height_6_6,
                        ),
                        GetBuilder<SignInController>(builder: (logic) {
                          return CommonButton(
                            onTap: controller.signUp,
                              text: 'Sign Up'.tr);
                        }),
                        SizedBox(
                          height: AppSizes.height_3,
                        ),
                        Divider(),
                        SizedBox(
                          height: AppSizes.height_2_5,
                        ),
                        Center(
                          child: Text(
                            'Or SignUp with social account?',
                            style: TextStyle(color: AppColor.darkGreen,fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height_2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await controller.signInWithGoogle();
                                Get.offAllNamed(AppRoutes.home);
                              },
                              child: Image.asset(Assets.imagesGoogle,
                                  height: AppSizes.height_7, width: AppSizes.height_7),
                            ),
                            SizedBox(
                              width: AppSizes.width_2,
                            ),
                            InkWell(
                              // onTap: () => logic.loginWithGoogle(context),
                              child: Image.asset(Assets.imagesFacebook,
                                  height: AppSizes.height_7, width: AppSizes.height_7),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),

    );
  }
}