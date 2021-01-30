import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

  TextEditingController weight  = TextEditingController();
  TextEditingController height = TextEditingController();
  double bmiFinal;
  double weightFinal;
  double heightFinal;
  double heightInMeter;
  double heightSquare;
  bool isSwitched = false;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090909),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 75,),
              Text(
                "BMI CALCULATOR",
                style:
                TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2
                )),
              SizedBox(height: 50,),
              SizedBox(
                child: TextField(
                  controller: weight,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2
                  ),
                  decoration: InputDecoration(
                    labelText: "WEIGHT",
                      labelStyle: TextStyle(
                          color: Colors.white54,
                          letterSpacing: 1
                      ),
                      suffixText: "In Kg",
                      suffixStyle: TextStyle(
                          color: Colors.white54,
                          letterSpacing: 1
                      ),
                      filled: true,
                      fillColor: Color(0xff121212)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                child: TextField(
                  controller: height,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2
                  ),
                  decoration: InputDecoration(
                      labelText: "HEIGHT",
                      labelStyle: TextStyle(
                          color: Colors.white54,
                          letterSpacing: 1
                      ),
                      suffixText: "Default : Meter",
                      suffixStyle: TextStyle(
                          color: Colors.white54,
                          letterSpacing: 1
                      ),
                      filled: true,
                      fillColor: Color(0xff121212)
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text(
                      "Meter",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2
                    ),),
                  Switch(
                      value: isSwitched,
                      onChanged: (bool value){
                        weightFinal = double.parse(weight.text);
                        heightFinal = double.parse(height.text);
                        heightSquare = (heightFinal*heightFinal);
                        heightInMeter = (heightFinal * 0.01);
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    activeColor: Colors.blueAccent,
                    activeTrackColor: Color(0xff121212),
                    inactiveTrackColor: Color(0xff121212),
                    inactiveThumbColor: Colors.white54,
                  ),
                  Text(
                    "Cm",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2
                    ),),
                ],
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  splashColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    onPressed: (){
                    isClicked = true;
                      setState(() {
                       if(isSwitched == false){
                         weightFinal = double.parse(weight.text);
                         heightFinal = double.parse(height.text);
                         heightSquare = (heightFinal*heightFinal);
                         bmiFinal = (weightFinal / heightSquare);
                         bmiFinal = double.parse((bmiFinal).toStringAsFixed(1));
                       }else{
                         weightFinal = double.parse(weight.text);
                         heightFinal = double.parse(height.text);
                         heightFinal = (heightFinal * 0.01);
                         heightSquare = (heightFinal * heightFinal);
                         bmiFinal = (weightFinal / heightSquare);
                         bmiFinal = double.parse((bmiFinal).toStringAsFixed(1));
                       }
                      });
                      if(weightFinal == 0 && heightFinal == 0){
                        print("error");
                      }else{
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder){
                              return new Container(
                                height: 350.0,
                                color: Colors.transparent, //could change this to ,
                                //so you don't have to change MaterialApp canvasColor
                                child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Color(0xff121212),
                                        borderRadius: new BorderRadius.only(
                                            topLeft: const Radius.circular(25.0),
                                            topRight: const Radius.circular(25.0))),
                                    child: new Center(
                                      child: new SizedBox(
                                        child: isClicked == true ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 50,),
                                            Text(
                                                "Your BMI is : $bmiFinal",
                                                style: TextStyle(
                                                    fontSize: 30, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold
                                                )
                                            ),
                                            SizedBox(height: 35,),
                                            Text("BMI Chart",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),),
                                            SizedBox(height: 25,),
                                            Container(
                                                height: 150,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Color(0xff121212),
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(child: SizedBox(),),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(child: SizedBox()),
                                                        Text("BMI",style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 2),),
                                                        Expanded(child: SizedBox()),
                                                        Text("Below 18.5",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        SizedBox(height: 5,),
                                                        Text("18.5 - 24.9",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        SizedBox(height: 5,),
                                                        Text("25.0 - 29.9",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        SizedBox(height: 5,),
                                                        Text("30.0 and above",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        Expanded(child: SizedBox()),
                                                      ],
                                                    ),
                                                    Expanded(child: SizedBox(),),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(child: SizedBox()),
                                                        Text("Weight Status",style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 2),),
                                                        Expanded(child: SizedBox()),
                                                        Text("Underweight",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        SizedBox(height: 5,),
                                                        Text("Normal or Healthy Weight",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        SizedBox(height: 5,),
                                                        Text("Overweight",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        SizedBox(height: 5,),
                                                        Text("Obese",style: TextStyle(color: Colors.white, letterSpacing: 1),),
                                                        Expanded(child: SizedBox()),
                                                      ],
                                                    ),
                                                    Expanded(child: SizedBox(),),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ) :
                                        Container(),
                                      ),
                                    )),
                              );
                            }
                        );
                      }
                    },
                    color: Color(0xff121212),
                    child: Text("Calculate BMI",style: TextStyle(fontSize: 18,color: Colors.white, letterSpacing: 2),)
                ),
              ),
              SizedBox(height: 60,),


            ],
          ),
        ),
      ),
    );
  }


}
