import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:senior_project/features/login/presentation/widgets/custom_text_field_widget.dart';
import 'package:senior_project/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:senior_project/features/sign_up/presentation/bloc/sign_up_state.dart';
import 'package:senior_project/features/sign_up/presentation/widgets/sign_up_error.dart';
import 'package:senior_project/injection.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final bloc = sl<SignUpBloc>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF313F58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20),),
        ),
        // backgroundColor: Colors.blue[300],
        title: Text(
          "انشاء حساب",
          style: TextStyle(
            color: Color(0xFFF6964C),
            // fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF313F58),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(-1, -1)),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 1)),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xFFF6964C),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, SignUpState state) {
            if (state.error != null) {
              Fluttertoast.showToast(
                msg: "حدث خطأ ما",
                backgroundColor: Colors.orange[100],
                textColor: Color(0xFF145577),
                fontSize: 15,
              );
              bloc.resetErrors();
            }
            return ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 60),
                Image.asset('assets/images/oyooni.png', scale: 7,),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextFieldWidget(
                    controller: firstNameController,
                    hint: "الاسم",
                    onChanged: (x) {
                      bloc.onChangeFirstName(x);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextFieldWidget(
                    controller: lastNameController,
                    hint: "الكناية",
                    onChanged: (x) {
                      bloc.onChangeLastName(x);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextFieldWidget(
                    controller: emailController,
                    hint: "البريد الالكتروني",
                    onChanged: (x) {
                      bloc.onChangeEmail(x);
                    },
                  ),
                ),
                if (!(state.isEmailValid ?? true))
                  SignUpError(
                    title: "البريد الالكتروني غير صحيح",
                  ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextFieldWidget(
                    controller: passwordController,
                    hint: "كلمة المرور",
                    obscureText: true,
                    onChanged: (x) {
                      bloc.onChangePassword(x);
                    },
                  ),
                ),
                if (!(state.isPasswordValid ?? true))
                  SignUpError(
                    title: "كلمة المرور يجب ان نكون أكثر من 6 أحرف",
                  ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomTextFieldWidget(
                    controller: confirmPasswordController,
                    hint: "تأكيد كلمة المرور",
                    obscureText: true,
                    onChanged: (x) {
                      bloc.onChangeConfirmationPassword(x);
                    },
                  ),
                ),
                if (!(state.isConfirmationPasswordValid ?? true))
                  SignUpError(
                    title: "لا تساوي كلمة المرور",
                  ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacementNamed(context, NameScreen.VOLUNTEER_MAIN_PAGE);
                      if (firstNameController.text == '' ||
                          lastNameController.text == '' ||
                          emailController.text == '' ||
                          passwordController.text == '' ||
                          confirmPasswordController.text == '') {
                        Fluttertoast.showToast(
                          msg: "يرجى ملئ جميع الحقول",
                          backgroundColor: Colors.orange[100],
                          textColor: Color(0xFF145577),
                          fontSize: 15,
                        );
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController.text)) {
                        Fluttertoast.showToast(
                          msg: "البريد الاكتروني ليس صحيح",
                          backgroundColor: Colors.orange[100],
                          textColor: Color(0xFF145577),
                          fontSize: 15,
                        );
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        Fluttertoast.showToast(
                          msg: "كلمات المرور غير متساويان",
                          backgroundColor: Colors.orange[100],
                          textColor: Color(0xFF145577),
                          fontSize: 15,
                        );
                      } else {
                        bloc.onSignUpInitiated();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 1),
                          ),
                          // BoxShadow(
                          //   color: Colors.white,
                          //   spreadRadius: 1,
                          //   blurRadius: 3,
                          //   offset: Offset(-1,-1),
                          // ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF313F58),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "تأكيد",
                            style: TextStyle(
                                color: Color(0xFFF6964C),
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          state.isLoading
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : RotatedBox(
                                  quarterTurns: 2,
                                  child: SvgPicture.asset(
                                    "assets/icons/login_button.svg",
                                    height: 20,
                                    color: Color(0xFFF6964C),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
