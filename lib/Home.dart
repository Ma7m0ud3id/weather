import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/Api_Model.dart';
import 'package:weather/Model.dart';
import 'package:weather/Search.dart';
import 'package:weather/ShowWeather.dart';
import 'package:weather/my_provider.dart';
import 'package:weather/setting.dart';
class Home extends StatefulWidget {
static const String routName ='HOME';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String country='Egypt';
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProviderApp>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Weather"),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, Setting.routName);
          }, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){
            showSearch(context: context, delegate: Mysearchdlegate());
          }, icon: Icon(Icons.search)),

        ],
      ),
      body:Stack(
        children: [
          Image.asset(
            'assets/2.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [

          Expanded(
            child: FutureBuilder<MOdel>(
            future: ApiModel.getSources(country: provider.Q==''?country:provider.Q),
        builder: (_,snapShot){
            if(snapShot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.black,));
            }
            if(snapShot.hasError){
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: (){}, child: Text('Try Again')),
                ],
              );
            }


            Current? current=snapShot.data?.current ;
            Location? location=snapShot.data?.location ;
            Request? request=snapShot.data?.request ;
            // print('edit');
            // print(newsList[0]);
            return ListView.builder(
                itemCount: 1,
                itemBuilder:(c,index){
                  return ShowWeather(request,location,current);
                  //Text(newsList[index].title ?? "no data",style: TextStyle(color: Colors.black),);
                } ) ;

        }),
          ),
            ],
          )
        ],
      ),
    );
  }
}
