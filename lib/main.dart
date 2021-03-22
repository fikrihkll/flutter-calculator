import 'package:flutter/material.dart';
import 'CalcButton.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  bool pressAttention = false;
  String sFirst="";
  String sSecond="";
  double first = 0;
  double second = 0;
  double result = null;
  String operation="";

  bool isFirstSelected = true;
  bool isSecondSelected = false;
  Color color1 = Color.fromRGBO(242, 86, 35, 100);
  Border selected  =  Border.all(color:  Color.fromRGBO(242, 86, 35, 100),width: 1.0);
  Border unselected  =  Border.all(color:  Colors.white,width: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title: Text(widget.title, style : TextStyle(color: color1)),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  height: 40.0,
                  width: double.infinity,
                  child: Text(
                    'Hello,',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

              //TODO vv ------------------------------HERE IS TEXT----------------------------------
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          isFirstSelected=true;
                          isSecondSelected=false;
                          setState(() {


                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child:AnimatedContainer(
                                  duration : Duration(milliseconds : 200),
                                decoration: BoxDecoration(
                                  border: Border.all(color : isFirstSelected ? color1 : Colors.white,width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                margin: EdgeInsets.only(left:12,right: 6,bottom: 12,top:12),
                                child: Text(sFirst,textAlign: TextAlign.end,style: TextStyle(fontSize: 30),)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 6),
                              child: Icon(Icons.circle,size: 10,color: isFirstSelected? color1 : Colors.grey,),
                            )
                          ],
                        ),
                      ),
                      Text(operation,style:TextStyle(fontSize: 20)),
                      GestureDetector(
                        onTap: (){
                          isFirstSelected=false;
                          isSecondSelected=true;
                          setState(() {

                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child:AnimatedContainer(
                                duration : Duration(milliseconds : 200),
                                  decoration: BoxDecoration(
                                      border: Border.all(color : isSecondSelected ? color1 : Colors.white,width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  margin: EdgeInsets.only(left:12,right: 6,bottom: 12,top:12),
                                  child: Text(sSecond,textAlign: TextAlign.end,style: TextStyle(fontSize: 30),)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 6),
                              child: Icon(Icons.circle,size: 10,color: isSecondSelected ? color1 : Colors.grey,),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(result==null ? "" : result.toString() ,style:TextStyle(fontSize: 30),textAlign: TextAlign.end,),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Text("=",style:TextStyle(fontSize: 20)),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              //TODO ^^ ------------------------------HERE IS TEXT----------------------------------

              //TODO ===========================================================================================================

              //TODO vv ---------------------------------------- HERE IS NUMPAD ----------------------------------------
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CalcButton(title: "C",onPressed: (){
                              sFirst="";
                              sSecond= "";
                              setState(() {

                              });
                            },),
                          ),
                          CalcButton(title: ":D"),
                          CalcButton(title: "del",onPressed: (){
                            if(isFirstSelected){
                              sFirst= sFirst.substring(0,sFirst.length-1);
                            }else{
                              sSecond=sSecond.substring(0,sSecond.length-1);
                            }
                            setState(() {

                            });
                          },),
                          Container(
                            child: CalcButton(title: ":",onPressed: (){
                             operation=":";
                              setState(() {

                              });
                            },),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CalcButton(title: "7",onPressed: (){
                              if(isFirstSelected){
                                sFirst+="7";
                              }else{
                                sSecond+= "7";
                              }
                              setState(() {

                              });
                            },),
                          ),
                          CalcButton(title: "8",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="8";
                            }else{
                              sSecond+= "8";
                            }
                            setState(() {

                            });
                          },),
                          CalcButton(title: "9",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="9";
                            }else{
                              sSecond+= "9";
                            }
                            setState(() {

                            });
                          },),
                          Container(
                            child: CalcButton(title: "X",onPressed: (){
                              operation="X";
                              setState(() {

                              });
                            },),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CalcButton(title: "4",onPressed: (){
                              if(isFirstSelected){
                                sFirst+="4";
                              }else{
                                sSecond+= "4";
                              }
                              setState(() {

                              });
                            },),
                          ),
                          CalcButton(title: "5",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="5";
                            }else{
                              sSecond+= "5";
                            }
                            setState(() {

                            });
                          },),
                          CalcButton(title: "6",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="6";
                            }else{
                              sSecond+= "6";
                            }
                            setState(() {

                            });
                          },),
                          Container(
                            child: CalcButton(title: "-",onPressed: (){
                              operation="-";
                              setState(() {

                              });
                            },),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CalcButton(title: "1",onPressed: (){
                              if(isFirstSelected){
                                sFirst+="1";
                              }else{
                                sSecond+= "1";
                              }
                              setState(() {

                              });
                            },),
                          ),
                          CalcButton(title: "2",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="2";
                            }else{
                              sSecond+= "2";
                            }
                            setState(() {

                            });
                          },),
                          CalcButton(title: "3",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="3";
                            }else{
                              sSecond+= "3";
                            }
                            setState(() {

                            });
                          },),
                          Container(
                            child: CalcButton(title: "+",onPressed: (){
                              operation="+";
                              setState(() {

                              });
                            },),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: CalcButton(title: "00",onPressed: (){
                              if(isFirstSelected){
                                sFirst+="00";
                              }else{
                                sSecond+= "00";
                              }
                              setState(() {

                              });
                            },),
                          ),
                          CalcButton(title: "0",onPressed: (){
                            if(isFirstSelected){
                              sFirst+="0";
                            }else{
                              sSecond+= "0";
                            }
                            setState(() {

                            });
                          },),
                          CalcButton(title: ".",onPressed: (){
                            if(isFirstSelected){
                              sFirst+=".";
                            }else{
                              sSecond+= ".";
                            }
                            setState(() {

                            });
                          },),
                          Container(

                            child: CalcButton(title: "=",onPressed: (){
                              switch(operation){
                                case "+":
                                  result = double.parse(sFirst) + double.parse(sSecond);
                                  break;
                                case "-":
                                  result = double.parse(sFirst) - double.parse(sSecond);
                                  break;
                                case "X":
                                  result = double.parse(sFirst) * double.parse(sSecond);
                                  break;
                                case ":":
                                  result = double.parse(sFirst) / double.parse(sSecond);
                                  break;
                              }
                              setState(() {

                              });
                            },),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                ),
              //TODO ^^ ---------------------------------------- HERE IS NUMPAD ----------------------------------------
            ],
          )
      )
    );
  }
}


