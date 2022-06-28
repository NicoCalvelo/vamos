import 'package:flutter/material.dart';

class CreateEvenet extends StatefulWidget {
  const CreateEvenet({Key? key}) : super(key: key);

  @override
  State<CreateEvenet> createState() => _CreateEvenetState();
}

class _CreateEvenetState extends State<CreateEvenet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Surf';
  List<String> dropdownItems = ['Surf', 'Basquet', 'Baseball', 'Golf'];

  @override
  Widget build(BuildContext context) {
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
                                fontSize: 32, fontWeight: FontWeight.w500),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            items: dropdownItems
                                .map<DropdownMenuItem<String>>((String value) {
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
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Fecha',
                              style: TextStyle(
                                  fontSize: 20),
                            ),
                            
                          ],
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
