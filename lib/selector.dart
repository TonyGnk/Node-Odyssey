import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Welcome Page/logic/first.dart';

class Selector extends StatelessWidget {
  Selector({super.key, required this.ref});

  late WidgetRef ref;

  //controllers
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: Colors.grey.withOpacity(0.1),
          // border: Border.all(
        ),
        // width: 90,
        // height: 50,
        child: Row(children: [
          //Insert two textfields here
          Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 40,
            child: TextField(
              controller: controller1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Εισάγεται Αρχική Τιμή',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 40,
            child: TextField(
              controller: controller2,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Εισάγεται Τελική Τιμή',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          IconButton.filledTonal(
              onPressed: () => startCal(int.parse(controller1.text),
                  int.parse(controller2.text), ref),
              //submit icon
              icon: const Icon(Icons.send)),
        ]),
      );
}
