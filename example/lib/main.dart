import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ValueNotifier<String> countryCode = ValueNotifier("KE");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Country Code Pick'),
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countryCode.value = "ZA";
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('Pick your country'),
            ),
            // if you need custom picker use this
            // pickerBuilder: (context, CountryCode countryCode) {
            //   return Row(
            //     children: [
            //       Image.asset(
            //         countryCode.flagUri,
            //         package: 'country_list_pick',
            //       ),
            //       Text(countryCode.code),
            //       Text(countryCode.dialCode),
            //     ],
            //   );
            // },
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: true,
              isDownIcon: true,
              showEnglishName: false,
              labelColor: Colors.blueAccent,
            ),
            initialSelection: countryCode,
            onChanged: (CountryCode code) {
              print(code.name);
              print(code.code);
              print(code.dialCode);
              print(code.flagUri);
            },
          ),
        ),
      ),
    );
  }
}
