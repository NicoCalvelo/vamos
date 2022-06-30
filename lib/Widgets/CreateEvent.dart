import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vamos/Widgets/DateTimePicker.dart';

class CreateEvenet extends StatefulWidget {
  const CreateEvenet({Key? key}) : super(key: key);

  @override
  State<CreateEvenet> createState() => _CreateEvenetState();
}

class _CreateEvenetState extends State<CreateEvenet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Surf';
  List<String> dropdownItems = ['Surf', 'Basquet', 'Baseball', 'Golf'];

  late TextEditingController _peopleController;
  late TextEditingController _locationController;
  late TextEditingController _linkController;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _peopleController = TextEditingController();
    _locationController = TextEditingController();
    _linkController = TextEditingController();
  }

  @override
  void dispose() {
    _peopleController.dispose();
    _locationController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.blue;
    }

    return (Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 8)
        ],
      ),
      height: 600,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            width: 500,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14)),
              color: Color.fromRGBO(250, 250, 250, 1),
            ),
            child: Image.asset('assets/illustrations/surf.png'),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '¿Que tienes ganas de hacer?',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color.fromRGBO(250, 250, 250, 1),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              style: TextStyle(fontSize: 16),
                              value: dropdownValue,
                              items: dropdownItems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              underline: Container(),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            DateTimePicker(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Numero de personas',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Color.fromRGBO(250, 250, 250, 1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.people_outline,
                                          color:
                                              Color.fromRGBO(190, 190, 190, 1),
                                          size: 20,
                                        ),
                                        Container(
                                          width: 150,
                                          height: 50,
                                          child: TextField(
                                            controller: _peopleController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ], // Only n],
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Empty for infinite...',
                                                hintStyle: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 14),
                                                disabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                border: InputBorder.none),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            onSubmitted:
                                                (String value) async {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Lugar',
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color.fromRGBO(250, 250, 250, 1),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: Color.fromRGBO(190, 190, 190, 1),
                                    size: 20,
                                  ),
                                  Container(
                                    width: 450,
                                    height: 50,
                                    child: TextField(
                                      controller: _locationController,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: const InputDecoration(
                                          hintText: 'Plaza San Martin...',
                                          hintStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 14),
                                          disabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      onSubmitted: (String value) async {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Link Adicional',
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color.fromRGBO(250, 250, 250, 1),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.link,
                                    color: Color.fromRGBO(190, 190, 190, 1),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 450,
                                    height: 50,
                                    child: TextField(
                                      controller: _linkController,
                                      keyboardType: TextInputType.url,
                                      decoration: const InputDecoration(
                                          hintText: 'https://www.vamos.com',
                                          hintStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w200,
                                              fontSize: 14),
                                          disabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      onSubmitted: (String value) async {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Añadir a Google Calendar',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 16),
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Vamos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
