import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/commen/button.dart';
import 'package:meesho/commen/textField.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../authenticatioin/profile_authentication.dart';
import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/strings.dart';
import '../../decoration/textstyle.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key, this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
    var editcontroller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: whiteColor,
        leading: IconButton(
          color: darkFontGrey,
          onPressed: () {
            print('click');
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: _width * 0.07,
          ),
        ),
      ),
      body: BackGround(
        widget: SingleChildScrollView(
          child: Center(
            child: Obx(
                ()=> Column(
                children: [
                  editcontroller.profileImagePath.isEmpty
                      ? GestureDetector(
                    onTap: () {
                      editcontroller.changeImage(context);
                      editcontroller.uploadProfileImage();
                    },
                    child: Image
                        .asset(
                      profilepic,
                      width: _height * 0.2,
                      height: _height * 0.2,
                      fit: BoxFit.contain,
                    )
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                  )
                      : GestureDetector(
                    onTap: () {
                      editcontroller.changeImage(context);
                      editcontroller.uploadProfileImage();

                    },
                    child: Image
                        .file(
                      File(
                        editcontroller.profileImagePath.value,
                      ),
                      width: _height * 0.2,
                      height: _height * 0.2,
                      fit: BoxFit.contain,
                    )
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                  ),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  customTextfield(
                      str: name,
                      hintstr: nameHint,
                      fontsize: _width * 0.035,
                      controller: editcontroller.namecontroller,
                      ispass: false),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  customTextfield(
                      str: oldpassword,
                      hintstr: passwordHint,
                      fontsize: _width * 0.035,
                      controller: editcontroller.oldpasswordcontroller,
                      ispass: false),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  customTextfield(
                      str: newpassword,
                      hintstr: passwordHint,
                      fontsize: _width * 0.035,
                      controller: editcontroller.newpasswordcontroller,
                      ispass: false),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  customTextfield(
                      str: retypepassword,
                      hintstr: passwordHint,
                      fontsize: _width * 0.035,
                      controller: editcontroller.retypepasswordcontroller,
                      ispass: false),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  customButton(
                        () async {
                      // editcontroller.isLoading(true);
                      //if image is not selected
                      if (editcontroller.profileImagePath.value.isNotEmpty) {
                        await editcontroller.uploadProfileImage();
                        print('first update...............');
                      } else {
                        // print('111second update...............');
                        // editcontroller.profileImageLinc = data['imageUrl'];
                        // print('second update...............${data['imageUrl'].toString()}');
                      }
                      //if old password is true
                      if ('123456' ==
                          editcontroller.oldpasswordcontroller.text &&
                          (editcontroller.newpasswordcontroller.text ==
                              editcontroller.retypepasswordcontroller.text)) {
                        print('datavalue:-------- $data');
                        await editcontroller.changeAuthPassword(
                          // email: data['email'],
                          email: 'abcd123@gmail.com',
                          password: editcontroller.oldpasswordcontroller.text,
                          newPassword: editcontroller.newpasswordcontroller.text,
                        );
                        await editcontroller.updateProfile(
                          imgUrl: editcontroller.profileImageLinc,
                          name: editcontroller.namecontroller.text,
                          password: editcontroller.newpasswordcontroller.text,
                        );

                        VxToast.show(context, msg: 'updated');
                        print('updateeeeeeeeeeeeeeeeeed');
                      } else {
                        if (!(editcontroller.newpasswordcontroller.text ==
                            editcontroller.retypepasswordcontroller.text)) {
                          VxToast.show(
                              context, msg: 'does not match retypw password');
                          print('miss match');
                        } else {
                          VxToast.show(
                              context, msg: 'wrong passsssssssssssssssss');
                        }
                        // editcontroller.isLoading(false);
                      }
                    },
                    'save',
                    pinkcolor,
                    stylemedium(_width * 0.035, darkFontGrey),
                  )
                ],
              )
                  .box
                  .padding(EdgeInsets.all(16))
                  .margin(EdgeInsets.only(
                  top: _height * 0.04,
                  left: _width * 0.05,
                  right: _width * 0.05))
                  .make(),
            ),
          ),
        ),
      ),
    );
  }
}