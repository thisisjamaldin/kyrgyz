import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mColor.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mStyles.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  static void shared(var name, var mood, var gender, var startNotification,
      var endNotification, var timesNotification, var first) async {
    var prefs = await SharedPreferences.getInstance();
    if (name != null) await prefs.setString("name", name);
    if (mood != null) await prefs.setInt("mood", mood);
    if (gender != null) await prefs.setInt("gender", gender);
    if (first != null) await prefs.setBool("firstLaunch", first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Material(
            elevation: 2,
            child: Image.asset(
              "assets/images/4.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "10+ Million",
            textAlign: TextAlign.center,
            style: mStyles.boldText,
          ),
          const Text(
            "Positive motivation",
            textAlign: TextAlign.center,
            style: mStyles.normalText,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Take a moment each day to read\n"
            "positive and inspiring quotes and rewire\n"
            "your brain to reward optimism.",
            textAlign: TextAlign.center,
            style: mStyles.normalText,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(14),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(_nextPage(1));
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Get started',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  static var name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Material(
            elevation: 2,
            child: Image.asset(
              "assets/images/2.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Whats your name?",
            style: mStyles.boldText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: TextField(
              onChanged: (txt) {
                setState(() {
                  name = txt;
                });
              },
              style: mStyles.normalText,
              decoration: const InputDecoration(
                isDense: true,
                hintStyle: mStyles.normalText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.all(12),
                hintText: "Your name",
              ),
              keyboardType: TextInputType.name,
              controller: name.isEmpty ? TextEditingController(text: "") : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: TextButton(
              onPressed: () {
                if (name.isEmpty) return;
                Navigator.of(context).push(_nextPage(2));
                Page1.shared(name, null, null, null, null, null, null);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor:
                    name.isEmpty ? mColor.light_grey : mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Get started',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_nextPage(2));
              setState(() {
                name = "";
              });
            },
            child: const Text(
              "Skip for now",
              style: mStyles.normalText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: mColor.black_btn,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                const Text(
                  "~~",
                  style: mStyles.boldTextWhite,
                ),
                _Page2.name.isEmpty
                    ? Text(
                        "Do more of what makes you\nhappy",
                        style: mStyles.normalTextWhite,
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Don't be afraid to start over "
                        "${_Page2.name}. This time you're not starting"
                        "from scratch. You're starting from experience.",
                        style: mStyles.normalTextWhite,
                        textAlign: TextAlign.center,
                      )
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 30),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(_nextPage(3));
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Get started',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Material(
            elevation: 2,
            child: Image.asset(
              "assets/images/1.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: const Text(
              "Which is your current gender identity?",
              style: mStyles.boldText,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(_nextPage(4));
                Page1.shared(null, null, 0, null, null, null, null);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Female',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(_nextPage(4));
                Page1.shared(null, null, 1, null, null, null, null);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Male',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(_nextPage(4));
                Page1.shared(null, null, 2, null, null, null, null);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Others',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(_nextPage(4));
                Page1.shared(null, null, 3, null, null, null, null);
              },
              child: const Text(
                "Prefer not to say",
                style: mStyles.normalText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5();
}

class _Page5 extends State<Page5> {
  int _currentSliderValue = 10;
  var startAt = "09:00";
  var endAt = "22:00";
  TimeOfDay timeOfDay = const TimeOfDay(hour: 9, minute: 00);

  void displayTimer(BuildContext context, var start) async {
    var time = await showTimePicker(
        context: context,

        initialTime: timeOfDay,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (time != null) {
      var h = time.hour.toString();
      var m = time.minute.toString();
      if (h.length < 2) h = "0$h";
      if (m.length < 2) m = "0$m";
      setState(() {
        if (start) {
          startAt = "$h:$m";
        } else {
          endAt = "$h:$m";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Material(
            elevation: 2,
            child: Image.asset(
              "assets/images/3.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: const Text(
              "Personalize your reminder experience!",
              style: mStyles.boldText,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: const Text(
              "Empower your habits through daily reminders that keep you focused and motivated.",
              style: mStyles.normalText,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            decoration: BoxDecoration(
                color: mColor.light_grey,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Row(
              children: [
                const Text(
                  "Start at",
                  style: mStyles.normalText,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => {
                    _currentSliderValue > 0 ? displayTimer(context, true) : null,
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: mColor.white_bg,
                        borderRadius: const BorderRadius.all(Radius.circular(8))),
                    child: Text(
                      _currentSliderValue > 0 ? startAt : "-",
                      style: mStyles.normalText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 1, 24, 0),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            decoration: BoxDecoration(
                color: mColor.light_grey,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Row(
              children: [
                const Text(
                  "End at",
                  style: mStyles.normalText,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => {
                    _currentSliderValue > 1 ? displayTimer(context, false) : null,
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: mColor.white_bg,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text(
                      _currentSliderValue > 1 ? endAt : "-",
                      style: mStyles.normalText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            decoration: BoxDecoration(
                color: mColor.light_grey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "How many",
                      style: mStyles.normalText,
                    ),
                    const Spacer(),
                    Text(
                      "${_currentSliderValue}X",
                      style: mStyles.normalText,
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  child: CupertinoSlider(
                    value: _currentSliderValue.toDouble(),
                    max: 20,
                    min: 0,
                    activeColor: mColor.black_btn,
                    thumbColor: mColor.white,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14, 20, 14, 20),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(_nextPage(5));
                Page1.shared(null, null, null, startAt, endAt, _currentSliderValue, null);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Next',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  State<Page6> createState() => _Page6();
}

class _Page6 extends State<Page6> {
  int moodIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Material(
            elevation: 2,
            child: Image.asset(
              "assets/images/3.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const Text(
              "How are you feeling lately?",
              style: mStyles.boldText,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: const Text(
              "Select the mood that best reflects how you feel at this moment.",
              style: mStyles.normalText,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      moodIndex = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 20, 6, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color:
                            moodIndex == 0 ? mColor.black_btn : mColor.white_bg,
                        border: Border.all(width: 1, color: mColor.black_btn),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/awesome.png",
                          width: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Awesome",
                          textAlign: TextAlign.center,
                          style: moodIndex == 0
                              ? mStyles.normalTextWhite
                              : mStyles.normalText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      moodIndex = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(6, 20, 6, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color:
                            moodIndex == 1 ? mColor.black_btn : mColor.white_bg,
                        border: Border.all(width: 1, color: mColor.black_btn),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/good.png",
                          width: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Good",
                          textAlign: TextAlign.center,
                          style: moodIndex == 1
                              ? mStyles.normalTextWhite
                              : mStyles.normalText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      moodIndex = 2;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(6, 20, 12, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color:
                            moodIndex == 2 ? mColor.black_btn : mColor.white_bg,
                        border: Border.all(width: 1, color: mColor.black_btn),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/ok.png",
                          width: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ok",
                          textAlign: TextAlign.center,
                          style: moodIndex == 2
                              ? mStyles.normalTextWhite
                              : mStyles.normalText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      moodIndex = 3;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 20, 6, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color:
                            moodIndex == 3 ? mColor.black_btn : mColor.white_bg,
                        border: Border.all(width: 1, color: mColor.black_btn),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/bad.png",
                          width: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bad",
                          textAlign: TextAlign.center,
                          style: moodIndex == 3
                              ? mStyles.normalTextWhite
                              : mStyles.normalText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      moodIndex = 4;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(6, 20, 6, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color:
                            moodIndex == 4 ? mColor.black_btn : mColor.white_bg,
                        border: Border.all(width: 1, color: mColor.black_btn),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/terrible.png",
                          width: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Terrible",
                          textAlign: TextAlign.center,
                          style: moodIndex == 4
                              ? mStyles.normalTextWhite
                              : mStyles.normalText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      moodIndex = 5;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(6, 20, 12, 0),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color:
                            moodIndex == 5 ? mColor.black_btn : mColor.white_bg,
                        border: Border.all(width: 1, color: mColor.black_btn),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/other.png",
                          width: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Other",
                          textAlign: TextAlign.center,
                          style: moodIndex == 5
                              ? mStyles.normalTextWhite
                              : mStyles.normalText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(14),
            child: TextButton(
              onPressed: () {
                Page1.shared(null, null, null, null, null, null, true);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (_) => false);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: mColor.black_btn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                'Start',
                style: mStyles.normalTextWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _nextPage(int index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (index) {
        case 1:
          return const Page2();
        case 2:
          return Page3();
        case 3:
          return const Page4();
        case 4:
          return const Page5();
        case 5:
          return const Page6();
        default:
          return const Page1();
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
