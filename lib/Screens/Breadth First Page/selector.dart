import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/List Panel/list_provider.dart';
import 'breadth_first_page.dart';

class Selector extends StatelessWidget {
  Selector({super.key});

  //controllers
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();
  late TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (_, WidgetRef ref, __) => SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                margin: const EdgeInsets.all(4),
                width: 200,
                //height: 38,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                margin: const EdgeInsets.all(4),
                width: 200,
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                margin: const EdgeInsets.all(4),
                width: 200,
                child: TextField(
                  controller: controller3,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ταχύτητα σε ms',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              const SizedBox(height: 2),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 55)),
                    //corners
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  label: const Text('Εκτέλεση'),
                  onPressed: () {
                    clearTrackingContainer(ref);
                    startCal(
                        int.parse(controller1.text),
                        int.parse(controller2.text),
                        int.parse(controller3.text),
                        ref);
                  },
                  //submit icon
                  icon: const Icon(Icons.send)),
              const SizedBox(height: 60),
            ],
          ),
        ),
      );
}
