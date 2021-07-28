import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:senior_project/core/util/generate_screen.dart';
import 'package:senior_project/features/login/presentation/bloc/login_bloc.dart';
import 'package:senior_project/features/login/presentation/bloc/login_state.dart';
import 'package:senior_project/features/login/presentation/widgets/custom_text_field_widget.dart';
import 'package:senior_project/features/sign_up/presentation/widgets/sign_up_error.dart';
import 'package:senior_project/injection.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bloc = sl<LoginBloc>();

  @override
  void initState() {
    bloc.checkToken();
    super.initState();
  }

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
          "تسجيل الدخول",
          style: TextStyle(
            color: Color(0xFFF6964C),
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocListener(
        listener: (BuildContext context, LoginState state) {
          if (state.tokenExist) {
            Navigator.pushNamed(context, NameScreen.VOLUNTEER_MAIN_PAGE);
          }
        },
        bloc: bloc,
        child: BlocBuilder(
            bloc: bloc,
            builder: (context, LoginState state) {
              return ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 100),
                  // SvgPicture.asset(
                  //   "assets/icons/login.svg",
                  //   height: 150,
                  // ),
                  Image.asset('assets/images/oyooni.png', scale: 7,),
                  SizedBox(height: 60),
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
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, NameScreen.VOLUNTEER_MAIN_PAGE);
                            bloc.onLoginInitiated();
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
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                                state.isLoading
                                    ? Container(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ))
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
                        SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, NameScreen.SIGNUP_PAGE);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFF6964C).withOpacity(0.3),
                            ),
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                            child: Text(
                              "ما زلت لا تملك حسابا؟",
                              style: TextStyle(
                                color: Color(0xFF313F58),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
