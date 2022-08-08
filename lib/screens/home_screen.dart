import 'package:cogxrlabs_task/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    nameController.text = "";
    phoneNumberController.text = "";
    dobController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "he",
              style: TextStyle(
                  color: Colors.amber.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
              "llo",
              style: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Enter your details 🚀",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        controller: nameController,
                        cursorColor: Colors.redAccent,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          hintText: 'Enter Your Name',
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 10,
                        cursorColor: Colors.redAccent,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          counterText: "",
                          hintText: 'Enter Your Phone Number',
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          controller: dobController,
                          cursorColor: Colors.redAccent,
                          decoration: const InputDecoration(
                            isCollapsed: true,
                            isDense: true,
                            hintText: 'Enter Your Date of Birth',
                            hintStyle: TextStyle(fontSize: 18),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd/MM/yyyy').format(pickedDate);
                              setState(() {
                                dobController.text = formattedDate;
                              });
                            }
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
