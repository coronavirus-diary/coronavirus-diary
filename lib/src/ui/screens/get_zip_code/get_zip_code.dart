import 'package:covidnearme/src/ui/assets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covidnearme/src/ui/utils/checkups.dart';

class GetZipCodeScreen extends StatefulWidget {
  static const routeName = '/get_zip_code';

  @override
  _GetZipCodeState createState() => _GetZipCodeState();
}

class _GetZipCodeState extends State<GetZipCodeScreen> {
  String _postalCode = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Where Are You?')),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
              'Please enter your zip code, or the zip code of the hospital '
              'you would go to, so that we can track the number of cases '
              'around specific hospitals.'),
        ),
        Spacer(),
        TextField(
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
          style: TextStyle(color: Colors.black),
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Spacer(),
            RaisedButton(
              child: Text('Skip Location'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            Spacer(),
            RaisedButton(
              child: Text('Submit'),
              onPressed: _postalCode == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_postalCode);
                    },
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );
  }
}
