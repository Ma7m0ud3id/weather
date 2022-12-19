import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/my_provider.dart';

class Setting extends StatefulWidget {
  static const String routName = "Setting";

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    bool IOS = false;
    var provider = Provider.of<MyProviderApp>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tempeture Unit',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Row(
              children: [
                Expanded(
                    child: Text('Use metric measurements for temperature units',
                        style: TextStyle(fontSize: 11))),
                Spacer(),
                Expanded(
                  child: Transform.scale(
                    scale: 1,
                    child: Switch(
                      value: IOS,
                      onChanged: (value) {
                        setState(() {
                          IOS = value;
                        });
                        provider.switchh(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
