import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meesho/app_pages/homepage/home%20tab%20page.dart';
import 'package:meesho/app_pages/homepage/new_homepage.dart';
import 'package:meesho/authenticatioin/category_authentication.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/decoration/color.dart';
import 'package:meesho/decoration/size.dart';
import 'package:meesho/decoration/textstyle.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/strings.dart';
import '../../list/lists.dart';
import '../cart/cart_page.dart';
import 'category_over_view.dart';
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Media_size media_size = Media_size();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;
var catcontroller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: whiteColor,
        title: Text(
          category,
          style: stylemain(_width*0.07, pinkcolor),
        ),
        leading: IconButton(
          color: darkFontGrey,
          onPressed: () {
            Get.to(Meesho());
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size:_width*0.07,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border,
              color: fontGrey,
              size: _width * 0.06,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: fontGrey,
                size: _width*0.07,
              ), onPressed: () {
              Get.to(Cart());
            },
            ),
          ),
          SizedBox(width: _width * 0.06,)
        ],
      ),
      body: BackGround(
          widget: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: _height * 0.25,
            mainAxisSpacing: _width * 0.015,
            crossAxisSpacing: _width * 0.015,
          ),
          itemCount: categoryImageList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(
                  categoryImageList[index],
                  height: _height * 0.15,
                  width: _width * 0.3,
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
                Text(
                  categoryTitleList[index],
                  style: stylemedium(_width * 0.04, darkFontGrey),
                ),
              ],
            )
                .box
                .white
                .rounded
                .clip(Clip.antiAlias)
                .outerShadow2Xl
                .make()
                .onTap(() {
                  catcontroller.getsubcategories(categoryTitleList[index]);
              Get.to(() => CategoryOverView(title: categoryTitleList[index], index: index,));
            });
          },
        ),
      )),
    );
  }
}
