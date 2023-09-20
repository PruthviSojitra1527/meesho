import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meesho/commen/background_Container.dart';
import 'package:meesho/commen/textField.dart';

import '../../decoration/color.dart';
import '../../decoration/imageurl.dart';
import '../../decoration/textstyle.dart';

class AddDeliveryAdd extends StatefulWidget {
  const AddDeliveryAdd({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAdd> createState() => _AddDeliveryAddState();
}

class _AddDeliveryAddState extends State<AddDeliveryAdd> {
  var addresscontroller = TextEditingController();

  late String lat;

  String? lan;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location service is enabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('location service is enabled');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'location permissions are permanently denied,we cannot request permission ');
    }
    return await Geolocator.getCurrentPosition();
  }

  Location location = Location();
  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var _width = mediaQueryData.size.width;
    var _height = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        flexibleSpace: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
        backgroundColor: whiteColor,
        title: Text(
          'Review your Order',
          style: stylemain(_width * 0.07, pinkcolor),
        ),
        leading: IconButton(
          color: darkFontGrey,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: _width * 0.07,
          ),
        ),
      ),
      body: BackGround(
          widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: darkFontGrey,
                  size: _width * 0.07,
                ),
                SizedBox(
                  width: _width * 0.03,
                ),
                Row(
                  children: [
                    Text('Address',
                        style: stylebold(_width * 0.04, darkFontGrey)),
                    SizedBox(
                      width: _width * 0.2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: _height * 0.045,
                      decoration: BoxDecoration(
                          border: Border.all(color: pinkcolor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.my_location_outlined,
                              color: pinkcolor,
                              size: _width * 0.05,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              getCurrentLocation().then((value) {
                                lat = '${value.latitude}';
                                lan = '${value.longitude}';
                                Get.to(
                                  Scaffold(
                                    body: GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                          target: LatLng(
                                              value.latitude, value.longitude),
                                          zoom: 70),
                                      mapType: MapType.normal,
                                      onMapCreated: _onMapCreated,
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Text('Use My Location',
                                style: stylebold(_width * 0.035, pinkcolor)),
                          ),
                          SizedBox(
                            width: _width * 0.02,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextfield(
                str: 'adreess',
                hintstr: 'write your adrees here....',
                fontsize: _width * 0.04,
                controller: addresscontroller,
                ispass: false),
          ),
        ],
      )),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
    location.onLocationChanged.listen((event) {
      this.controller!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                  event.latitude!,
                  event.longitude!,
                ),
              ),
            ),
          );
    });
  }
}
