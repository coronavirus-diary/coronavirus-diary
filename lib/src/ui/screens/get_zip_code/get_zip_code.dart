import 'package:covidnearme/src/ui/assets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';

class GetZipCodeScreen extends StatefulWidget {
  static const routeName = '/get_zip_code';

  @override
  _GetZipCodeState createState() => _GetZipCodeState();
}

class _GetZipCodeState extends State<GetZipCodeScreen> {
  String _postalCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Where Are You?')),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(40),
            child: const Text(
                'Please enter your zip code, or the zip code of the hospital '
                'you would go to, so that we can track the number of cases '
                'around specific hospitals.'),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: 'Zip Code'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              onChanged: (content) {
                if (content.contains(RegExp('^\\d{5}\$'))) {
                  setState(() {
                    _postalCode = content;
                  });
                }
              },
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  child: const Text('Skip Location'),
                  onPressed: () {
                    Navigator.of(context).pop(null);
                  },
                ),
                Spacer(),
                RaisedButton(
                  child: const Text('Submit'),
                  onPressed: _postalCode == null
                      ? null
                      : () => Navigator.of(context).pop(_postalCode),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
