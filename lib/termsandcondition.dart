import 'package:flutter/material.dart';

import 'about.dart';

class TermsConditions extends StatefulWidget {
  //const TermsConditions({ Key? key }) : super(key: key);

  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.green,
          
        ),
        onPressed: ()
        {
          Navigator.push(
                context,MaterialPageRoute(builder: (context) => AboutUs())
              );
        },
      ),
      title: Text('Terms & Conditions',style: TextStyle(fontSize: 18),),
      ),
      body: Container(
        alignment: Alignment.center,
       
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
                 
                     Center(child: Text("By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Farmer Friend.\nFarmer Friend is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\nThe Farmer's Friend app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Farmer's Friend app won’t work properly or at all.",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white70),textAlign: TextAlign.center,)),
                  SizedBox(height: 35,),
                        
                             
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}