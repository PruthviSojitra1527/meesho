import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/authenticatioin/auth_controller.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

import '../../commen/button.dart';
import '../../commen/logo_meesho.dart';
import '../../commen/textField.dart';
import '../../consts/firebase_consts.dart';
import '../../decoration/color.dart';
import '../../decoration/strings.dart';
import '../../decoration/textstyle.dart';
import '../homepage/new_homepage.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var retypepasswordcontroller = TextEditingController();
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    return Scaffold(
      body: ChangeNotifierProvider<CheckValue>(
        create: (BuildContext context) {
          return CheckValue();
        },
        child: Consumer<CheckValue>(
          builder: (context, provider, child) {
            return BackGround(
              widget: SingleChildScrollView(
                //call receive kr okk
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: _height * 0.1,
                    ),
                    Logo(),
                    SizedBox(
                      height: _height * 0.001,
                    ),
                    Black037(
                        data: 'Join With $appname and enjoy shooping Online'),
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
                              str: name,
                              hintstr: nameHint,
                              controller: namecontroller,
                              fontsize: _width * 0.04,
                            ),
                            customTextfield(
                              ispass: false,
                              str: email,
                              hintstr: emailHint,
                              controller: emailcontroller,
                              fontsize: _width * 0.04,
                            ),
                            customTextfield(
                              ispass: true,
                              str: password,
                              hintstr: passwordHint,
                              controller: passwordcontroller,
                              fontsize: _width * 0.04,
                            ),
                            customTextfield(
                              ispass: true,
                              str: retypepassword,
                              hintstr: passwordHint,
                              controller: retypepasswordcontroller,
                              fontsize: _width * 0.04,
                            ),
                            SizedBox(
                              height: _height * 0.001,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: provider.isCheck == null
                                      ? false
                                      : provider.isCheck,
                                  onChanged: (newVal) {
                                    provider.checkValue(newVal);
                                  },
                                ),
                                SizedBox(
                                  height: _width * 0.005,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'I agree to the ',
                                            style: styleregular(
                                                _width * 0.025, fontGrey)),
                                        TextSpan(
                                            text: termAndConditon,
                                            style: stylemedium(
                                                _width * 0.025, pinkcolor)),
                                        TextSpan(
                                            text: ' & ',
                                            style: styleregular(
                                                _width * 0.025, fontGrey)),
                                        TextSpan(
                                            text: privacyPolicy,
                                            style: stylemedium(
                                                _width * 0.025, pinkcolor)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            customButton(() async {
                              if (provider.isCheck != false) {
                                try {
                                  await controller
                                      .signUpMethod(
                                          context: context,
                                          email: emailcontroller.text.trim(),
                                          password: passwordcontroller.text)
                                      .then((value) => controller.storeUserData(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text,
                                          name: namecontroller.text))
                                      .then((value) {
                                    VxToast.show(
                                      context,
                                      msg: 'logged in successfully',
                                      position: VxToastPosition.center,
                                      showTime: 2000,
                                    );
                                    Get.offAll(() => Meesho());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  print('error:----------------- $e');
                                }
                              }
                            },
                                    signup,
                                    provider.isCheck == true
                                        ? pinkcolor
                                        : lightGrey,
                                    stylebold(
                                        _width * 0.05,
                                        provider.isCheck == true
                                            ? blackcolor
                                            : fontGrey))
                                .box
                                .width(context.screenWidth - _width * 0.05)
                                .make(),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            GestureDetector(
                              onTap: () {
                               Get.to(LogIn());
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: alreadyHaveAccount,
                                    style:
                                        stylemedium(_width * 0.03, fontGrey)),
                                TextSpan(text: ' '),
                                TextSpan(
                                  text: login,
                                  style: stylebold(_width * 0.035, pinkcolor),
                                )
                              ])),
                            )
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
              ),
            );
          },
        ),
      ),
    );
  }
}

class CheckValue extends ChangeNotifier {
  bool? isCheck;

  checkValue(newVal) {
    if (newVal == false) {
      met1();
    } else {
      met2();
      notifyListeners();
    }
  }

  met1() {
    isCheck = false;
    notifyListeners();
  }

  met2() {
    isCheck = true;
  }
}
