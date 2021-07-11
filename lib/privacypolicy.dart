import 'package:farmerapp/about.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  //const PrivacyPolicy({ Key? key }) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
      title: Text('Privacy Policy',style: TextStyle(fontSize: 18),),
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
                 
                     Center(child: Text("Farmer Friend built the Farmer's Friend app as a Free app. This SERVICE is provided by Farmer Friend at no cost and is intended for use as is.\nThis page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\nIf you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Farmer's Friend unless otherwise defined in this Privacy Policy.",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white70),textAlign: TextAlign.center,)),
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