import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/app_pages/splesh_screen/signUp_screen.dart';
import 'package:meesho/authenticatioin/auth_controller.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/commen/button.dart';
import 'package:meesho/commen/logo_meesho.dart';
import 'package:meesho/commen/textField.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/strings.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:meesho/list/lists.dart';
import 'package:velocity_x/velocity_x.dart';
import '../homepage/new_homepage.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var authcontroller = Get.put(AuthController());
  var isloggedin = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return Scaffold(
      body: BackGround(
        widget: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: _height * 0.1,
                ),
                Logo(),
                SizedBox(
                  height: _height * 0.001,
                ),
                Black037(data: 'Log In to $appname'),
                SizedBox(
                  height: _height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        customTextfield(
                          ispass: false,
                          str: email,
                          hintstr: emailHint,
                          controller: authcontroller.emailcontroller,
                          fontsize: _width * 0.04,
                        ),
                        customTextfield(
                          ispass: true,
                          str: password,
                          hintstr: passwordHint,
                          controller: authcontroller.passwordcontroller,
                          fontsize: _width * 0.04,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              forgetpass,
                              style: styleregular(
                                _width * 0.03,
                                bluecolor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.001,
                        ),
                       customButton(() async {
                            await authcontroller
                                .loginMethod(
                              context: context,
                              email: authcontroller.emailcontroller.text
                                  .toLowerCase()
                                  .trim(),
                              password: authcontroller.passwordcontroller.text,
                            )
                                .then((value) {
                              if (value == null) {
                                VxToast.show(context, msg: login);
                                isloggedin= true;
                                Get.offAll(() => Meesho());
                              }
                            });
                          }, login, pinkcolor,
                                  stylebold(_width * 0.05, blackcolor))
                              .box
                              .width(context.screenWidth - _width * 0.05)
                              .make(),
                        SizedBox(
                          height: _height * 0.005,
                        ),
                        Text(
                          createNewAccount,
                          style: stylemedium(_width * 0.03, fontGrey),
                        ),
                        SizedBox(
                          height: _height * 0.005,
                        ),
                        customButton(
                          () {
                           Get.to(SignUp());
                          },
                          signup,
                          lightgolden,
                          stylebold(_width * 0.05, blackcolor),
                        ).box.width(context.screenWidth - _width * 0.05).make(),
                        SizedBox(
                          height: _height * 0.01,
                        ),
                        customButton(
                              () {
                           Get.to(Meesho());
                          },
                          'continue as guest',
                          lightgolden,
                          stylebold(_width * 0.05, blackcolor),
                        ).box.width(context.screenWidth - _width * 0.05).make(),
                        SizedBox(
                          height: _height * 0.01,
                        ),
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(EdgeInsets.all(16))
                        .width(context.screenWidth - _width * 0.001)
                        .make(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
