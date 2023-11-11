import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Welcome Page/logic/first.dart';

class Selector extends StatelessWidget {
  Selector({super.key});

  //controllers
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // width: 90,
        // height: 50,
        child: Row(children: [
          //Insert two textfields here
          SizedBox(
            width: 80,
            height: 50,
            child: TextField(
              controller: controller1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 50,
            child: TextField(
              controller: controller2,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => startCal(
                  int.parse(controller1.text), int.parse(controller2.text)),
              child: const Text('Button'))
        ]),
      );
}
