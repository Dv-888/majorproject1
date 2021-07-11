import 'package:farmerapp/privacypolicy.dart';
import 'package:farmerapp/termsandcondition.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class AboutUs extends StatefulWidget {
  //const AboutUs({ Key? key }) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.white,
          
        ),
        onPressed: ()
        {
          Navigator.push(
                context,MaterialPageRoute(builder: (context) => HomePage())
              );
        },
      ),
      title: Text('About Us',style: TextStyle(fontSize: 18),),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_03_2.png"),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.all(30) ,
           padding: EdgeInsets.only(left: 20,top: 20,right: 16,bottom: 20),
           
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black54,
          
           ),

          child: Container(
            padding: EdgeInsets.only(left: 16,top: 20,right: 16),
            child: GestureDetector(
              onTap: ()
              {FocusScope.of(context).unfocus();}
              ,
              child: ListView(
                children: [
                                    
                  SizedBox(height: 5,),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              
                              fit: BoxFit.cover,
                              
                               image: AssetImage("assets/images/Logo_01.png"),
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(child: Text("About Us",style:TextStyle(fontSize: 30, fontWeight: FontWeight.w800,color: Colors.white))),
                  SizedBox(height: 15,),
                  Center(child: Text("This application was developed by our team as a mean to aid the farmers by giving them accurate reports and data about the soil.\nOur aim is to further improving the application and making it more easy to use for the individuals and making our services be available. ",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white70),textAlign: TextAlign.center,)),
                  SizedBox(height: 35,),
                         RaisedButton(
                    onPressed:  ()
        {
          Navigator.push(
                context,MaterialPageRoute(builder: (context) => PrivacyPolicy())
              );
        },
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      "PRIVACY POLICY",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),   
                         )  ,
                         SizedBox(height: 10,),
                         RaisedButton(
                    onPressed:  ()
        {
          Navigator.push(
                context,MaterialPageRoute(builder: (context) => TermsConditions())
              );
        },
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      "TERMS & CONDITIONS",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),   
                         )  ,     
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}