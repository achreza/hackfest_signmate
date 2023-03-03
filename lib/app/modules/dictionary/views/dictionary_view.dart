import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/dictionary/views/emoticon.dart';
import 'package:hackfest_signmate/app/modules/dictionary/views/number.dart';
import 'package:hackfest_signmate/constant.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/dictionary_controller.dart';
import 'alphabet.dart';

class DictionaryView extends GetView<DictionaryController> {
  const DictionaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Dictionary',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Heading(),
            SizedBox(
              height: 30.h,
            ),
            //categories
            Container(
              width: Get.width,
              child: Text(
                'Categories',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Categories(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: Get.width,
              child: Text(
                'Video Tutorials',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            VideoTutorials()
          ],
        ),
      ),
    );
  }
}

class VideoTutorials extends StatelessWidget {
  const VideoTutorials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DictionaryController>();
    return Expanded(
      child: Obx(() => controller.isLoadingYoutubeTutorials.value == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.youtubeTutorials.length,
              itemBuilder: (context, index) {
                var thumbnail = controller.getYoutubeThumbnail(
                    controller.youtubeTutorials[index]['url']);
                return GestureDetector(
                  onTap: () {
                    launchUrl(
                        Uri.parse(controller.youtubeTutorials[index]['url']));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    width: Get.width,
                    height: 215.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            )),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 20,
      children: [
        CategoryItem(context, 'Alphabet', 'abc.png'),
        CategoryItem(context, 'Emoticon', 'emot.png'),
        CategoryItem(context, 'Number', 'number.png'),
      ],
    );
  }

  GestureDetector CategoryItem(context, text, image) {
    return GestureDetector(
      onTap: () {
        if (text == 'Alphabet') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Alphabet(),
            ),
          );
        } else if (text == 'Emoticon') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Emoticon(),
            ),
          );
        } else if (text == 'Number') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Number(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor,
            width: 2,
          ),
          color: lightColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: darkColor,
              ),
              child: Image.asset('assets/images/categories/${image}'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: darkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 140.h,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: HexColor("#BFDCA6"),
          width: 2,
        ),
        color: HexColor('#ecf5e4'),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (Get.width * 0.5).w,
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        fontSize: 16.sp),
                    children: <TextSpan>[
                  TextSpan(
                    text:
                        'The more you memories the language, the more people will ',
                  ),
                  TextSpan(
                      text: 'Be Helped', style: TextStyle(color: primaryColor)),
                ])),
          ),
          Container(
            width: (Get.width * 0.2).w,
            child: Image.asset('assets/images/white_skin_hand_raised.png'),
          ),
        ],
      ),
    );
  }
}
