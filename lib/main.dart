import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalc(),
    ),
  );
}

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> with TickerProviderStateMixin {
  int sliderVal = 100;
  int _weight = 50;
  int _age = 20;
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  bool isWeightIncreased = true;
  bool isWeightDecreased = false;
  bool isAgeIncreased = true;
  bool isAgeDecreased = false;

  late AnimationController maleAnimationController;
  late AnimationController femaleAnimationController;
  late AnimationController sliderAnimationController;
  late AnimationController boxAnimationController;

  late Animation maleBoxHeightAnimation;
  late Animation maleBoxWidthAnimation;
  late Animation femaleBoxHeightAnimation;
  late Animation femaleBoxWidthAnimation;
  late Animation sliderBoxHeightAnimation;
  late Animation sliderBoxWidthAnimation;
  late Animation boxSizeAnimation;

  @override
  void initState() {
    super.initState();

    maleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    femaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    sliderAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    boxAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    maleBoxHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 250, end: 260), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 260, end: 250), weight: 1),
    ]).animate(maleAnimationController);
    femaleBoxHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 250, end: 260), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 260, end: 250), weight: 1),
    ]).animate(femaleAnimationController);
    maleBoxWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 170, end: 180), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 170), weight: 1),
    ]).animate(maleAnimationController);
    femaleBoxWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 170, end: 180), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 170), weight: 1),
    ]).animate(femaleAnimationController);

    sliderBoxWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 365, end: 380), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 380, end: 365), weight: 1),
    ]).animate(sliderAnimationController);
    sliderBoxHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 195), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 195, end: 180), weight: 1),
    ]).animate(sliderAnimationController);

    boxSizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 170, end: 190), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 170, end: 170), weight: 1),
    ]).animate(boxAnimationController);

    maleAnimationController.forward();
    femaleAnimationController.forward();
    sliderAnimationController.forward();
    boxAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090E21),
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: const Color(0xff090E21),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const Spacer(flex: 1),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFemaleSelected = true;
                      isMaleSelected = false;
                      femaleAnimationController.reverse();
                    });
                  },
                  child: AnimatedBuilder(
                    animation: femaleAnimationController,
                    builder: (context, widget) {
                      return Container(
                        height: femaleBoxHeightAnimation.value,
                        width: femaleBoxWidthAnimation.value,
                        decoration: BoxDecoration(
                          color: (isFemaleSelected)
                              ? const Color(0xff3B3C4D)
                              : const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 130,
                              color: (isFemaleSelected)
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                color: (isFemaleSelected)
                                    ? Colors.red
                                    : Colors.white,
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(flex: 1),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFemaleSelected = false;
                      isMaleSelected = true;
                      maleAnimationController.reverse();
                    });
                  },
                  child: AnimatedBuilder(
                    animation: maleAnimationController,
                    builder: (context, widget) {
                      return Container(
                        height: maleBoxHeightAnimation.value,
                        width: maleBoxWidthAnimation.value,
                        decoration: BoxDecoration(
                          color: (isMaleSelected)
                              ? const Color(0xff3B3C4D)
                              : const Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 130,
                              color:
                                  (isMaleSelected) ? Colors.red : Colors.white,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                color: (isMaleSelected)
                                    ? Colors.red
                                    : Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
            const SizedBox(height: 42),
            AnimatedBuilder(
              animation: sliderAnimationController,
              builder: (context, widget) {
                return Container(
                  height: sliderBoxHeightAnimation.value,
                  width: sliderBoxWidthAnimation.value,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                          color: Color(0xff626473),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$sliderVal',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 52,
                            ),
                          ),
                          Container(
                            height: 100,
                            alignment: const Alignment(0, 0.2),
                            child: const Text(
                              "cm",
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      Slider(
                        value: sliderVal.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            sliderVal = val.toInt();
                          });
                        },
                        min: 100,
                        max: 300,
                        thumbColor: const Color(0xffeb1555),
                        activeColor: const Color(0xfff5c1d1),
                        inactiveColor: const Color(0xff555555),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Spacer(flex: 1),
                Container(
                  height: boxSizeAnimation.value, //170,
                  width: boxSizeAnimation.value, //170,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$_weight',
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Spacer(flex: 2),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _weight--;

                                isWeightIncreased = false;
                                isWeightDecreased = true;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (isWeightDecreased)
                                    ? const Color(0xff6E6F7A)
                                    : const Color(0xff4C4F5E),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                color: (isWeightDecreased)
                                    ? const Color(0xffF67FA4)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _weight++;
                                isWeightIncreased = true;
                                isWeightDecreased = false;
                              });
                            },
                            child: Ink(
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (isWeightIncreased)
                                      ? const Color(0xff6E6F7A)
                                      : const Color(0xff4C4F5E),
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.add,
                                    color: (isWeightIncreased)
                                        ? const Color(0xffF67FA4)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                Container(
                  height: boxSizeAnimation.value,
                  width: boxSizeAnimation.value,
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1E33),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$_age',
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Spacer(flex: 2),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _age--;

                                isAgeDecreased = true;
                                isAgeIncreased = false;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (isAgeDecreased)
                                    ? const Color(0xff6E6F7A)
                                    : const Color(0xff4C4F5E),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                color: (isAgeDecreased)
                                    ? const Color(0xffF67FA4)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _age++;

                                isAgeDecreased = false;
                                isAgeIncreased = true;
                              });
                            },
                            child: Ink(
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (isAgeIncreased)
                                      ? const Color(0xff6E6F7A)
                                      : const Color(0xff4C4F5E),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add,
                                  color: (isAgeIncreased)
                                      ? const Color(0xffF67FA4)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
            const SizedBox(height: 42),
            // const Spacer(),
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
