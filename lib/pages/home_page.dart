import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException('An error occurred when converting a color');
      }
    }
    return val;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  color: Color(getColorHexFromStr('#fff5ea')),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(15.0, 45.0, 15.0, 10.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(25.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.black,),
                            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                            hintText: 'Search for recipes and channels',
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        decoration: const BoxDecoration(
                          border: Border(left: BorderSide(
                            color: Colors.orange,
                            style: BorderStyle.solid,
                            width: 3.0
                          ))
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text('POPULAR RECIPES',
                                style:TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Times roman',
                                  fontWeight: FontWeight.bold
                                ),),
                                Text('THIS WEEK',
                                  style:TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Times roman',
                                      fontWeight: FontWeight.bold
                                  ),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                      height: 125.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _foodCard(),
                          const SizedBox(width: 10.0,),
                          _foodCard2(),
                          const SizedBox(width: 10.0,),
                          _foodCard3(),
                          const SizedBox(width: 10.0,),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15.0,),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text('November 10',
              style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.grey,
                fontSize: 14.0
              ),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text('TODAY',
                style: TextStyle(
                    fontFamily: 'Timesroman',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),),
            ),
            const SizedBox(height: 10.0,),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                    height: 465.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/breakfast.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                    child: BackdropFilter(
                      blendMode: BlendMode.dstATop,
                      filter: ImageFilter.blur(
                        sigmaX: 1.5,
                        sigmaY: 1.5
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.0)
                        ),
                      ),
                    ),
                  ),
                ),
                Container(

                  padding: const EdgeInsets.only(top: 325.0, left: 60.0),
                  child: Column(
                    children:  [
                      const Text('BEST OF',
                      style: TextStyle(
                        fontFamily: 'Timesroman',
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                      const Text('THE DAY',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                      const SizedBox( height: 10.0,),
                      Container(
                        height: 3.0,
                        width: 50.0,
                        color: Colors.orange,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _foodCard(){
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT25IZoJ0n8dflOxv-rODYjyQThkZ8jc7PQA&usqp=CAU'))
            ),
            height: 125.0,
            width: 100.0,
          ),
          const SizedBox(width: 10.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const Text('Grilled Chicken',
                style: TextStyle(
                    fontFamily: 'Quicksand'
                ),),
              const Text('With Fruit Salad',
                style: TextStyle(
                    fontFamily: 'Quicksand'
                ),),
              const SizedBox(height: 10.0,),
              Container(
                height: 2.0,
                width: 110.0,
                color: Colors.orange,
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: const DecorationImage(image: AssetImage('assets/chris.jpg'))
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  const Text('James Oliver',
                    style: TextStyle(
                        fontFamily: 'Quicksand'
                    ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }





  Widget _foodCard2(){
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/bife-e-salada-6241477.jpg'))
            ),
            height: 125.0,
            width: 100.0,
          ),
          const SizedBox(width: 10.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const Text('Grilled Meat',
                style: TextStyle(
                    fontFamily: 'Quicksand'
                ),),
              const Text('With Salad',
                style: TextStyle(
                    fontFamily: 'Quicksand'
                ),),
              const SizedBox(height: 10.0,),
              Container(
                height: 2.0,
                width: 110.0,
                color: Colors.orange,
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: const DecorationImage(image: AssetImage('assets/chris.jpg'))
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  const Text('James Oliver',
                    style: TextStyle(
                        fontFamily: 'Quicksand'
                    ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }




  Widget _foodCard3(){
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(image: AssetImage('assets/balanced.jpg'))
            ),
            height: 125.0,
            width: 100.0,
          ),
          const SizedBox(width: 10.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const Text('Shrimp and Rice',
                style: TextStyle(
                    fontFamily: 'Quicksand'
                ),),
              const Text('With Salad',
                style: TextStyle(
                    fontFamily: 'Quicksand'
                ),),
              const SizedBox(height: 10.0,),
              Container(
                height: 2.0,
                width: 110.0,
                color: Colors.orange,
              ),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: const DecorationImage(image: AssetImage('assets/chris.jpg'))
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  const Text('James Oliver',
                    style: TextStyle(
                        fontFamily: 'Quicksand'
                    ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}
