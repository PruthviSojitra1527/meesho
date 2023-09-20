import 'package:flutter/material.dart';
import 'package:meesho/decoration/strings.dart';

import '../decoration/color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: lightGrey),
            shape: BoxShape.rectangle),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: pinkcolor)),
            prefixIcon: Icon(
                Icons.search,
                color:lightGrey,
              ),
              fillColor: whiteColor,
              filled: true,
              hintText: searchbarText,
              hintStyle: TextStyle(fontSize: _width*0.04),
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: InkWell(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: lightGrey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.mic,
                            color: fontGrey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: fontGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}