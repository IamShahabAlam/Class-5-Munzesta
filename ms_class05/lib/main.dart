import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage() ,
      
    );
  }
}


// ==============================================


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scores = []; 

  void checkAns(bool userPickedAns){
    
    bool correctAnswer =  quizBrain.getCorrectAns();
               setState(() {

    //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Complete !',
          desc: 'You have completed your quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();
        scores = [];

        //TODO Step 4 Part D - empty out the scoreKeeper.
        

      }


      else{
     if (userPickedAns == correctAnswer){
       print("User picked it Right!!");
       scores.add(Icon(Icons.check,color: Colors.green,size: 32,));

     } else {
       print("User Picked it Wrong !!");
       scores.add(Icon(Icons.close,color: Colors.red,size: 32,));
     } 
                          
                          quizBrain.nextQuestion(); }
                        });

  }

  

  // List <String> questions = [
  //   "Is Karachi the Biggest City of Pakistan ?" , 
  //   "Pakistan's Capital is Islamabad ?" , 
  //   "Pakistan Cricket Team has won 2 T20 Worldcups ?" ,
  //   "Is Munzesta Solution located in Pakistan ?" , 
  //   "Is Munzesta Solution giving their 100% to teach you ?" ,
  //   "Does Flutter support any other programming language other then dart ?" ,
    
    
  // ];

  // List <bool> answers = [true , true, false , true , true , false ];

// List <Question> questionBank = [
//     Question  (q: "Is Karachi the Biggest City of Pakistan ?" , a: true  ),
//     Question  (q: "Pakistan's Capital is Islamabad ?" , a: true  ),
//     Question  (q: "Pakistan Cricket Team has won 2 T20 Worldcups ?" , a: false  ),
//     Question  (q: "Is Munzesta Solution located in Pakistan ?" , a: true  ),
//     Question  (q: "Is Munzesta Solution giving their 100% to teach you ?" , a: true  ),
//     Question  (q: "Does Flutter support any other programming language other then dart ?" , a: false  ),

// ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [


             Stack(
                children: [
                  Positioned(
                    child: Container(margin: EdgeInsets.only(top:440) ,height: 330, width: MediaQuery.of(context).size.width, alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter , end: Alignment.bottomCenter ,
                        colors: [Colors.grey, Colors.grey[800]]),
                      borderRadius: BorderRadius.only( topRight: Radius.circular(120) , topLeft: Radius.circular(120) )
                    ),
                    
                    ),
                  )
                ],
              ),


              
              
         
            Column( 
              children: [

 //Question
              Center(child: Container( margin: EdgeInsets.only(top: 40, bottom: 20), height: 330, width: 400, 
              decoration: BoxDecoration(
                // shape:,
                      // boxShadow: [BoxShadow(color: Colors.lime[10],blurRadius: 8,spreadRadius: 1),],
                      color: Colors.grey[800],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter , end: Alignment.bottomCenter ,
                        colors: [Colors.grey[800], Colors.grey]),
                      borderRadius: BorderRadius.only( bottomLeft: Radius.circular(120) , bottomRight: Radius.circular(120) )
              ),
              child:Center(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(quizBrain.getQuestionText(), style: TextStyle(fontSize: 20),
                ),
              )),
              )),

// Scores
              Padding(
                padding: const EdgeInsets.only(bottom:15.0 , ),
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: scores,),
              ),


 // True Btn         
              // Container(margin: EdgeInsets.only(top: 100),height: 60, width: 200,
              // child: ElevatedButton(onPressed: (){
              //       checkAns(true);
                
              // }, child: Text("True"))),



              Padding(
                      padding: const EdgeInsets.only(top:100 ,  ),
                      child: Center(
                        child: Container(
                        // margin: EdgeInsets.only(top: 250, ),
                        width: 185, height: 55,
                        decoration: BoxDecoration(
                          boxShadow: [ BoxShadow(color: Colors.green[900], blurRadius: 8, spreadRadius: 1, offset: Offset(1, 3))],
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [Colors.green[900], Colors.green[600],Colors.green[900] ])
                        ),

                        
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          onPrimary: Colors.white,
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )),
                          onPressed: (){
                    checkAns(true);
                 }, child: 
                 Text("True", style: TextStyle(letterSpacing: 2 , fontWeight: FontWeight.bold),)),
                  ),
                      ),
                    ),

// False btn
              // Container(margin: EdgeInsets.only(top: 40),height : 60, width: 200,
              // child: ElevatedButton(
              //   style: ElevatedButton.styleFrom(

              //   ),

              //   onPressed: (){
              //       checkAns(false);
                 
              // }, child: Text("False")
              // )),


              Padding(
                      padding: const EdgeInsets.only(top:40 ,  ),
                      child: Center(
                        child: Container(
                        // margin: EdgeInsets.only(top: 250, ),
                        width: 185, height: 55,
                        decoration: BoxDecoration(
                          boxShadow: [ BoxShadow(color: Colors.red[900], blurRadius: 8, spreadRadius: 1, offset: Offset(1, 3))],
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [Colors.red[900], Colors.red[600],Colors.red[900] ])
                        ),

                        
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          onPrimary: Colors.white,
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )),
                          onPressed: (){
                    checkAns(false);
                 }, child: 
                 Text("False", style: TextStyle(letterSpacing: 2 , fontWeight: FontWeight.bold),)),
                  ),
                      ),
                    ),

              
              // TODO: add any widget here , testing todo comment

            ],
            ),

            ],
        ) ,);
  }
}

