import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Model.dart';
import 'package:weather/my_provider.dart';

class ShowWeather extends StatefulWidget {
  // MOdel? news ;
  Current? current ;
  Location? location ;
  Request? request ;
  ShowWeather(this.request,this.location,this.current);

  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProviderApp>(context);
    print(widget.current?.weatherDescriptions.toString());
    print(widget.current?.weatherIcons.toString().replaceAll('[', '').replaceAll(']',''));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
        ),
        Text('${widget.location?.name}',style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
        Text('Updated : ${DateTime.now().hour}:${DateTime.now().minute} ',style: TextStyle(fontSize: 20,color: Colors.white),),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
            ),
            Image.network(widget.current?.weatherIcons.toString().replaceAll('[', '').replaceAll(']','')??
                'https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png'),
            SizedBox(
              width: 30,
            ),
            Text(provider.value==false?'${widget.current?.temperature}C':'${widget.current?.temperature??1*1.8+32}F',style: TextStyle(
              color:Colors.white,fontSize: 45,
            )),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Text(provider.value==false?'Max:${widget.current?.uvIndex}C':'Max:${widget.current?.uvIndex??1*1.8+32}F',style: TextStyle(
                  fontSize: 20,color: Colors.white
                ),),
                Text(provider.value==false?'Min:${widget.current?.feelslike}C':'Min:${widget.current?.feelslike??1*1.8+32}F',style: TextStyle(
                    fontSize: 20,color: Colors.white
                ),)
              ],
            )

          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(widget.current?.weatherDescriptions.toString().replaceAll('[', '').replaceAll(']','')??'',style: TextStyle(
          color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold
        ),),
        SizedBox(
          height: 5,
        ),
        Text(widget.location?.timezoneId??'',style: TextStyle(fontSize: 30,color: Colors.white)),

      ],
    );
  }
}
