import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:kyrgyz/mStyles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //iOS
  String appGroupId = 'group.motivation_app_group';
  static String iOSWidgetName = 'home_widget';

  var name = "";
  var showTutorial = false;
  static var quotes = [];
  static var currentQuoteIndex = 0;

  var startAnim = true;
  var animateF = false;

  void getNextQuotes() async {
    var prefs = await SharedPreferences.getInstance();
    var lastIndex = prefs.getInt('index') ?? -1;
    var db = FirebaseFirestore.instance;
    final docRef = db.collection("Quotes");
    docRef
        .orderBy('index')
        .where('index', isGreaterThan: lastIndex)
        .limit(10)
        .get()
        .then(
      (querySnapshot) {
        setState(() {
          quotes.addAll(querySnapshot.docs);
          prefs.setInt('index',
              querySnapshot.docs.length < 10 ? -1 : quotes.last['index']);
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  void shared() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "[your name]";
      showTutorial = prefs.getBool("showTutorial") ?? true;
    });
  }

  @override
  void initState() {
    HomeWidget.setAppGroupId(appGroupId);
    shared();
    getNextQuotes();
    super.initState();
  }

  void saveShowTutorial() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("showTutorial", false);
  }

  void _showTutorial() async {
    await Future.delayed(const Duration(seconds: 1));
    _dialogTutorial();
  }

  void anim(StateSetter setState) async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      animateF = !animateF;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showTutorial) {
      showTutorial = false;
      _showTutorial();
    }

    HomeWidget.updateWidget(
      iOSName: iOSWidgetName,
      name: "${iOSWidgetName}Provider",
      androidName: 'HomeWidgetProvider',
      qualifiedAndroidName: 'com.joma.kyrgyz.HomeWidgetProvider',);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            color: mColor.black_btn.withAlpha(100),
            width: double.infinity,
            height: double.infinity,
          ),
          PageView(
            scrollDirection: Axis.vertical,
            controller: PageController(),
            onPageChanged: (index) {
              currentQuoteIndex = quotes[index]['index'];
              if (index == quotes.length - 2) {
                getNextQuotes();
              }
            },
            children: <Widget>[
              for (var quote in quotes)
                Container(
                  margin: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        quote['text'].replaceFirst('~~name~~', name),
                        style: mStyles.bigMotivationTextWhite,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        quote['by'],
                        style: mStyles.normalQuotTextWhite,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: mColor.black_btn,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/crown.png",
                    width: 16,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/share.png",
                      width: 30,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      "assets/icons/like.png",
                      width: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: mColor.black_btn,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // <-- Radius
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/menu.png",
                              width: 16,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "General",
                              style: mStyles.normalTextWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: mColor.black_btn,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // <-- Radius
                          ),
                        ),
                        child: Image.asset(
                          "assets/icons/customize.png",
                          width: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: mColor.black_btn,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // <-- Radius
                          ),
                        ),
                        child: Image.asset(
                          "assets/icons/profile.png",
                          width: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogTutorial() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: mColor.black_btn,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              if (startAnim) {
                startAnim = false;
                anim(setState);
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: AnimatedAlign(
                      alignment: animateF
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      duration: animateF
                          ? const Duration(seconds: 2)
                          : const Duration(seconds: 0),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      child: Image.asset(
                        "assets/icons/finger.png",
                        width: 30,
                      ),
                      onEnd: () {
                        setState(() {
                          animateF = !animateF;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "Swipe to read quotes",
                    style: mStyles.normalTextWhite,
                  ),
                  Container(
                    margin: const EdgeInsets.all(14),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        saveShowTutorial();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: mColor.white_bg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // <-- Radius
                        ),
                      ),
                      child: const Text(
                        'Got it!',
                        style: mStyles.normalText,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class AppLifecycleObserver with WidgetsBindingObserver{
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if (state == AppLifecycleState.paused){
      var index = _HomePageState.currentQuoteIndex > 0 ? _HomePageState.currentQuoteIndex - 1 : _HomePageState.currentQuoteIndex;
      if (_HomePageState.quotes.isNotEmpty) {
        HomeWidget.saveWidgetData<String>('title',
            _HomePageState.quotes[index -
                1]['title']);
        HomeWidget.saveWidgetData<String>('description',
            _HomePageState.quotes[index -
                1]['description']);
      }
      HomeWidget.saveWidgetData<String>('imageUrl', 'https://firebasestorage.googleapis.com/v0/b/kyrgyz-1.appspot.com/o/bg.png?alt=media&token=df2836ce-9a5c-4035-b059-18b2ec45feeb');
      saveCurrentQuote();
    }
  }

  void saveCurrentQuote() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('index', _HomePageState.currentQuoteIndex-1);
  }
}
