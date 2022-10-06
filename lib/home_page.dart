import 'package:dating_app_ui/gradient_page.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_circular_text/circular_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageURL =
      'https://techcrunch.com/wp-content/uploads/2018/01/snapchat-bitmoji-deluxe-sticker.png?w=680';
  String text = 'Funny';
  Color theme = const Color(0xffF6A6FF);
  Color rotateButtoncolor = const Color(0xff9781C5);
  Color textcolor = const Color(0xffC65AD3);
  double startAnglemood = 242;

  void imageRotateright() {
    if (text == 'Funny') {
      imageURL =
          'https://cdn.pixabay.com/photo/2020/02/12/22/35/silhouette-4844082_1280.png';
      text = 'Banter';
      theme = const Color(0xffF8ED99);
      rotateButtoncolor = const Color(0xff4E7A4E);
      textcolor = const Color(0xff939F68);
      startAnglemood = 234;
    } else if (text == 'Banter') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const GradientPage()));
    }
  }

  void imageRotateleft() {
    if (text == 'Funny') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const GradientPage()));
    } else if (text == 'Banter') {
      imageURL =
          'https://techcrunch.com/wp-content/uploads/2018/01/snapchat-bitmoji-deluxe-sticker.png?w=680';
      text = 'Funny';
      theme = const Color(0xffF6A6FF);
      rotateButtoncolor = const Color(0xff9781C5);
      textcolor = const Color(0xffC65AD3);
      startAnglemood = 236;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 10),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, top: 10),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'She/Her',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'UX Designer,25',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: rotateButtoncolor,
                        ),
                        onPressed: () {
                          setState(() {
                            imageRotateleft();
                          });
                        },
                      ),
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: imageURL,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          cacheManager: CacheManager(Config(
                            imageURL,
                            stalePeriod: const Duration(days: 7),
                            //one week cache period
                          )),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: rotateButtoncolor,
                        ),
                        onPressed: () {
                          setState(() {
                            imageRotateright();
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'How Are you feeling?',
                    style: TextStyle(
                      color: textcolor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: CircularText(
                          backgroundPaint: Paint()..color = Colors.transparent,
                          radius: 30,
                          position: CircularTextPosition.outside,
                          children: [
                            TextItem(
                              text: Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              space: 15,
                              direction: CircularTextDirection.clockwise,
                              startAngle: startAnglemood,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80.0),
                              topRight: Radius.circular(80.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: EdgeInsets.zero,
                              trailing: const SizedBox(),
                              title: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Your ice breaker!',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFF8382),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.mic,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Card(
                                            shadowColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: const Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '\'|\'|\'|\'|\'|\'|\'|\'|\'|\'|\'|\'|',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Why i am here?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: const Color(0xffD6F1F2)
                                            .withOpacity(0.5),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          '"I want to know your favourite song,\nbut in order to tell me,you have to\nsing it to me."',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Interests',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Chip(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            label: Text(
                                              'Music',
                                              style: TextStyle(
                                                color: Color(0xff8A7FE8),
                                                fontSize: 15,
                                              ),
                                            ),
                                            backgroundColor: Color(0xffDFDDFA),
                                            avatar: Icon(
                                              Icons.audiotrack,
                                              color: Color(0xff8A7FE8),
                                            ),
                                          ),
                                          Chip(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            label: Text(
                                              'Coffee',
                                              style: TextStyle(
                                                color: Color(0xffBC8B27),
                                                fontSize: 15,
                                              ),
                                            ),
                                            backgroundColor: Color(0xffF8EDD7),
                                            avatar: Icon(
                                              Icons.coffee,
                                              color: Color(0xffBC8B27),
                                            ),
                                          ),
                                          Chip(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            label: Text(
                                              'Design',
                                              style: TextStyle(
                                                color: Color(0xffCB607B),
                                                fontSize: 15,
                                              ),
                                            ),
                                            backgroundColor: Color(0xffFAE9EF),
                                            avatar: Icon(
                                              Icons.draw,
                                              color: Color(0xffCB607B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Chip(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          label: Text(
                                            'Photography',
                                            style: TextStyle(
                                              color: Color(0xffDF5B51),
                                              fontSize: 15,
                                            ),
                                          ),
                                          backgroundColor: Color(0xffFECAC6),
                                          avatar: Icon(
                                            Icons.camera_alt,
                                            color: Color(0xffDF5B51),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Chip(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          label: Text(
                                            'Trekking',
                                            style: TextStyle(
                                              color: Color(0xffDA625E),
                                              fontSize: 15,
                                            ),
                                          ),
                                          backgroundColor: Color(0xffFEE5E2),
                                          avatar: Icon(
                                            Icons.hiking,
                                            color: Color(0xffDA625E),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Which character is your spirit\nanimal vibe...',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(8.0),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            color: Color(0xffFEFECF),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Joey from F.R.I.E.N.D.S',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff71573C),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'because',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(8.0),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            color: Color(0xffDFDDFA),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'JOEY DON\'T SHARE\nHIS FOOD!!',
                                              style: TextStyle(
                                                  color: Color(0xff5B4CDF),
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
