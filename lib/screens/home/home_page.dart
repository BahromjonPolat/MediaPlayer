import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:mediaplayer/components/colors.dart';
import 'package:mediaplayer/components/exporting_packages.dart';
import 'package:mediaplayer/screens/videoPlayer/video_player_page.dart';
import 'package:mediaplayer/widgets/buttons.dart';
import 'package:mediaplayer/widgets/text_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ConstColor.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _showBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: ConstColor.transparent,
        elevation: 0.0,
        leading: CustomIconButton(() {}, Icons.filter_list_sharp),
        actions: [
          CustomIconButton(() {}, CupertinoIcons.search),
        ],
      );

  SingleChildScrollView _buildBody() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setCategoryTitle("Recommended for you"),
            _showAudioList(),
            _setCategoryTitle("My Playlist"),
            _showAudioList(),
          ],
        ),
      );

  SizedBox _showAudioList() {
    return SizedBox(
            height: getProportionateScreenHeight(242.39),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _setAudioLayout();
                }),
          );
  }

  InkWell _setAudioLayout() {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPage()));
      },
      child: Container(
                    height: getProportionateScreenHeight(242.39),
                    width: getProportionateScreenWidth(190.0),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10.0),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          child: Image.network(
                            "https://source.unsplash.com/random/5",
                            width: getProportionateScreenWidth(190.0),
                            height: getProportionateScreenWidth(190.0),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        SetTextWidget(
                          "Monsters go bump",
                          size: getProportionateScreenWidth(16.0),
                        ),
                        SetTextWidget(
                          "ERICA RECINOS",
                          size: getProportionateScreenWidth(10.0),
                          weight: FontWeight.w400,
                          textColor: ConstColor.greyWithOpacity,
                        ),
                      ],
                    ),
                  ),
    );
  }

  Padding _setCategoryTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(28.0),
        vertical: getProportionateScreenHeight(20.0),
      ),
      child: SetTextWidget(
        title,
        weight: FontWeight.w700,
        size: 24.0,
      ),
    );
  }

  _showBottomNavigationBar() => SizedBox(
        height: getProportionateScreenHeight(75.22),
        child: Column(children: [
          _showSlider(),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.network(
              "https://source.unsplash.com/random/5",
              fit: BoxFit.cover,
              height: getProportionateScreenHeight(66.67),
              width: getProportionateScreenWidth(66.67),
            ),
            SizedBox(width: getProportionateScreenWidth(11.11)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SetTextWidget(
                  "Chaff & Dust",
                  size: getProportionateScreenWidth(18.75),
                ),
                SetTextWidget(
                  "Hymonna",
                  size: getProportionateScreenWidth(10.42),
                  textColor: ConstColor.greyWithOpacity,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                CustomIconButton(() {}, Icons.skip_previous_outlined),
                CustomIconButton(() {}, Icons.play_arrow_outlined),
                CustomIconButton(() {}, Icons.skip_next_outlined),
              ],
            ),
          ]),
        ]),
      );

  Positioned _showSlider() {
    return Positioned(
      top: getProportionateScreenHeight(0.0),
      left: 0.0,
      right: 0.0,
      child: SliderTheme(
        data: SliderThemeData(
            thumbShape: SliderComponentShape.noThumb,
            overlayShape: SliderComponentShape.noOverlay,
            showValueIndicator: ShowValueIndicator.onlyForContinuous),
        child: Slider(
          activeColor: ConstColor.white,
          inactiveColor: ConstColor.white.withOpacity(0.31),
          max: 100.0,
          min: 0.0,
          value: 5,
          onChanged: (v) {},
        ),
      ),
    );
  }
}
