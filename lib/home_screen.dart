import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/image_section.dart';
import 'package:bmi_calculator/resultant_card_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String height = "0";
  String weight = "0";
  double bmi = 0;
  bool img = false;

  double bmiCalculate(String height, String weight) {
    bmi = double.parse(weight) / pow((double.parse(height) / 100), 2);

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    final _heightcontroller = TextEditingController();
    final _weightcontroller = TextEditingController();

    @override
    void dispose() {
      _heightcontroller;
      _weightcontroller;
      super.dispose();
    }

    return Scaffold(
      backgroundColor: blackcolor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: blackcolor,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: whitecolor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            color: whitecolor,
            onPressed: () {
              setState(() {
                height = "0";
                weight = "0";
                bmi = 0;
                img = false;
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardWidget(
                height: height,
                weight: weight,
              ),
              bmi == 0
                  ? const Text("")
                  : bmi < 18.5
                      ? ResultantCardWidget(
                          fontcolor: pinkcolor,
                          color: yellowcolor,
                          bmi: bmi.toStringAsFixed(1),
                          praise: 'Ohh !!',
                          string:
                              "You are underweighted please eat Food and be healthy",
                        )
                      : bmi >= 18.5 && bmi <= 24.5
                          ? ResultantCardWidget(
                              fontcolor: yellowcolor,
                              color: greencolor,
                              bmi: bmi.toStringAsFixed(1),
                              praise: 'Congratulations 🎉🎉',
                              string: "You have a normal Body Mass Index Ratio",
                            )
                          : bmi >= 25 && bmi <= 29.9
                              ? ResultantCardWidget(
                                  fontcolor: blackcolor,
                                  color: lightred,
                                  bmi: bmi.toStringAsFixed(1),
                                  praise: 'OHH NO !! ',
                                  string:
                                      "You are OverWeighted please take a healthy diet and do exercises daily",
                                )
                              : bmi >= 30
                                  ? ResultantCardWidget(
                                      fontcolor: blackcolor,
                                      color: redcolor,
                                      bmi: bmi.toStringAsFixed(1),
                                      praise: 'OMG 😱!!',
                                      string:
                                          "You have Obese please consult a Doctor",
                                    )
                                  : const Text(''),
              AnimatedOpacity(
                  opacity: img ? 1 : 0,
                  duration: const Duration(seconds: 5),
                  child: const ImageSection()),

              // fade image transiton
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cyancolor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                    // title: Text("",style: TextStyle(fontSize: 15),),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Height(cm): ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _heightcontroller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Weight(kg): ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _weightcontroller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: SizedBox(
                          height: 35,
                          child: TextButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(cyancolor),
                              ),
                              onPressed: () {
                                if (_heightcontroller.text.isEmpty &&
                                    _weightcontroller.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("enter values"),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    height = _heightcontroller.text;
                                    weight = _weightcontroller.text;
                                    bmi = bmiCalculate(height, weight);
                                    img = true;
                                  });
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    color: whitecolor,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      )
                    ],
                  ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
