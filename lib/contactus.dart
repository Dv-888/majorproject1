import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homepage.dart';


class ContactUs extends StatefulWidget {
  //const ContactUs({ Key? key }) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  TextEditingController _nameController = TextEditingController();

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
      title: Text('Contact Us',style: TextStyle(fontSize: 18),),
      ),
      body: Container(
        alignment: Alignment.center,
decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_01.png"),
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
                  Center(child: Text("Mobile Number",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w800,color: Colors.white60))),
                  SizedBox(height: 5,),
                  Center(child: Text("9818409840",style:TextStyle(fontSize: 22, fontWeight: FontWeight.w800,color: Colors.white))),
                  SizedBox(height: 15,),
                  Center(child: Text("Email Address",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w800,color: Colors.white60))),
                  SizedBox(height: 5,),
                  Center(child: Text("farmerfriend@help.org",style:TextStyle(fontSize: 22, fontWeight: FontWeight.w800,color: Colors.white))),
                  SizedBox(height: 15,),
                   Center(child: Text("Address",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w800,color: Colors.white60))),
                  SizedBox(height: 5,),
                  Center(child: Text("Maharaja Surajmal Institute, Jankapuri",style:TextStyle(fontSize: 15, fontWeight: FontWeight.w800,color: Colors.white))),
                  SizedBox(height: 35,),
                                                      
                  
                  TextField(
                    controller: _nameController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      //contentPadding: EdgeInsets.only(bottom: 5),
                     // labelText: "Enter Message",
                     // labelStyle: TextStyle(color: Colors.white60),
                     // floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter Your Message",
                      hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white70)
                    ),
                  ),
                  SizedBox(height: 40,),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    minWidth: double.infinity,
                    color: Colors.white,

                    onPressed: (){
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'farmerfriend@help.org',
  queryParameters: {
    'subject': 'Issue related to Application',
    'body': _nameController.text,
  }
);

launch(emailLaunchUri.toString().replaceAll('+', ' '));
                    },
                    
                    child: Text("Send E-Mail",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



                    