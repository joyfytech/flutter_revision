import 'package:flutter/material.dart';
import 'package:flutter_revision/controller/login_controller.dart';
import 'package:flutter_revision/utilz/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterRevision extends StatefulWidget {
  const FlutterRevision({super.key});

  @override
  State<FlutterRevision> createState() => _FlutterRevisionState();
}

class _FlutterRevisionState extends State<FlutterRevision> {


  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("Flutter Revision"),
      //   backgroundColor: Colors.blue , leading: Icon(Icons.home_filled),),

      appBar: buildAppBar(context,leadingIcon : Icon(Icons.home_filled),
        title : AppConstants.flutterRevision , backgroundColor : Colors.blue , ),


      body:  SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              //Text

              buildTextFun(context, title : AppConstants.welcomeToFlutter , fontSize : 20.0 ,
                  fontWeight : FontWeight.bold , textColor : Colors.blue),

              //Container

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  buildContainerFun(context , AppConstants.cancel , border : true),

                  buildSizedBoxWidth(context , width : 40),


                  buildContainerFun(context , AppConstants.done , border : false),

                ],
              ),

              TextButton(onPressed: (){}, child: buildTextFun(context, title: AppConstants.textButton,
                  fontSize: 20, fontWeight: FontWeight.bold, textColor: Colors.pink)),

              buildSizedBoxHeight(context, height: 40),


              buildLoginFun(context , loginController),

              FloatingActionButton(

                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add,color: Colors.white,),
                  onPressed: (){}),


              Card(

                elevation: 20,

                borderOnForeground: true,
                color: Colors.blue,

                child: buildTextFun(context, title: AppConstants.welcomeToFlutter,
                    fontSize: 30, fontWeight: FontWeight.bold, textColor: Colors.white),

              ),

              ListTile(
                leading: Icon(Icons.person),
                title: buildTextFun(context, title: AppConstants.done, fontSize: 30,
                    fontWeight: FontWeight.bold, textColor: Colors.red),
                subtitle: buildTextFun(context, title: AppConstants.welcomeToFlutter, fontSize: 20,
                    fontWeight: FontWeight.w500, textColor: Colors.pink),

                trailing: Icon(Icons.delete_forever),
              ),

              Chip(
                  label: buildTextFun(context, title: AppConstants.welcomeToFlutter, fontSize: 30,
                  fontWeight: FontWeight.bold, textColor: Colors.red)),

              Table(
                border: TableBorder.all(
                  
                  color: Colors.blue,
                  
                ),
                children: [
                  TableRow(
                    children: [


                      buildTextFun(context, title: AppConstants.name, fontSize: 20, fontWeight: FontWeight.bold, textColor: Colors.black),

                      buildTextFun(context, title: AppConstants.age
                          , fontSize: 20, fontWeight: FontWeight.bold, textColor: Colors.black)

                    ]
                  ),

                  TableRow(
                      children: [


                        buildTextFun(context, title: "Jai", fontSize: 20, fontWeight: FontWeight.bold, textColor: Colors.black),

                        buildTextFun(context, title: "24"
                            , fontSize: 20, fontWeight: FontWeight.bold, textColor: Colors.black)

                      ]
                  ),



                ],
              ),

              CircularProgressIndicator(),

              Tooltip(
                message: "This is Home",
                child: buildTextFun(context, title: "Home", fontSize: 30, fontWeight: FontWeight.normal, textColor: Colors.red),
              )









            ],
          ),
        ),
      ),

      endDrawer:  Drawer(
        elevation: 16.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(75.0),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "JOYFY",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
              accountName: Text("JoyfyTech"),
              accountEmail: Text("joyfytech@gmail.com"),
              otherAccountsPictures: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.cancel_outlined)),

              ],
            ),
            ListTile(
              title: Text("All Inbox"),
              leading: Icon(Icons.mail),
            ),
            ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer),
            ),
            Divider(
              height: 0.1,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white,),
          onPressed: (){}),


    );
  }
}

buildLoginFun(BuildContext context, LoginController loginController) {
  return Padding(padding: EdgeInsets.symmetric(horizontal: 600,vertical: 20),

    child: Column(

      children: [


        buildTextFormField(context , label :  AppConstants.enterMobileNumber,controller :  loginController.mobileNumberController),

        buildSizedBoxHeight(context, height: 20),

        buildTextFormField(context , label :  AppConstants.enterPassword,controller :  loginController.passwordController),

        buildSizedBoxHeight(context, height: 40),

        ElevatedButton(

            onPressed:()=> loginController.saveForm(context) ,

            style: ElevatedButton.styleFrom(

              backgroundColor: Colors.blue

            ),




            child: buildTextFun(context, title: AppConstants.submit,
            fontSize: 20, fontWeight: FontWeight.bold, textColor: Colors.white))

      ],
    ),




  );
}

buildTextFormField(BuildContext context, {required String label, required TextEditingController controller}) {
  return TextFormField(

    controller: controller,
    decoration: InputDecoration(

      label: buildTextFun(context, title: label, fontSize: 20, fontWeight: FontWeight.w500, textColor: Colors.grey) ,
      border: OutlineInputBorder(),

    ),

  );
}

buildContainerFun(BuildContext context, String title, {required bool border}) {

  return Container(

    // done = 200 , cancel 100

    width:

    border ? 100 : 200,


    height :

        border ?
            50 : 50,


    decoration:

    border ?

    BoxDecoration(border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0)) :

    BoxDecoration(color: Colors.pink,
        borderRadius: BorderRadius.circular(8.0)),

    child:

    border ?

        Padding(padding: EdgeInsets.all(12.0),

            child:  buildTextFun(context, title: title, fontSize: 20,
            fontWeight: FontWeight.w500, textColor: Colors.grey),
        ) :

        Padding(padding: EdgeInsets.all(12.0),

            child: buildTextFun(context, title: title, fontSize: 20,
            fontWeight: FontWeight.w500, textColor: Colors.white),
        )

    ,

  );


}

buildSizedBoxHeight(BuildContext context, {required double height}) {
  return SizedBox(
    height: height,
  );
}

buildSizedBoxWidth(BuildContext context, {required double width}) {

  return SizedBox(
    width: width,
  );

}

buildTextFun(BuildContext context, {required String title, required double fontSize, 
  required FontWeight fontWeight, required Color textColor}) {
  
  return Text(title , style: GoogleFonts.nunito(

    fontSize: fontSize,
    fontWeight: fontWeight,
    color: textColor

  ),);
}

buildAppBar(BuildContext context, {required Icon leadingIcon, required String title,
  required MaterialColor backgroundColor}) {

  return AppBar(title:  buildTextFun(context, title : AppConstants.flutterRevision , fontSize : 20.0 ,
      fontWeight : FontWeight.bold , textColor : Colors.brown), leading: leadingIcon, backgroundColor: backgroundColor,);

}


