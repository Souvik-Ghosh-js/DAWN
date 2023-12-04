//
// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
//         title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
//         actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(tDefaultSize),
//           child: Column(
//             children: [
//
//               /// -- IMAGE
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tProfileImage))),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       width: 35,
//                       height: 35,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
//                       child: const Icon(
//                         LineAwesomeIcons.alternate_pencil,
//                         color: Colors.black,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text(tProfileHeading, style: Theme.of(context).textTheme.headline4),
//               Text(tProfileSubHeading, style: Theme.of(context).textTheme.bodyText2),
//               const SizedBox(height: 20),
//
//               /// -- BUTTON
//               SizedBox(
//                 width: 200,
//                 child: ElevatedButton(
//                   onPressed: () => Get.to(() => const UpdateProfileScreen()),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
//                   child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Divider(),
//               const SizedBox(height: 10),
//
//               /// -- MENU
//               ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
//               ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
//               ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
//               const Divider(),
//               const SizedBox(height: 10),
//               ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
//               ProfileMenuWidget(
//                   title: "Logout",
//                   icon: LineAwesomeIcons.alternate_sign_out,
//                   textColor: Colors.red,
//                   endIcon: false,
//                   onPress: () {
//                     Get.defaultDialog(
//                       title: "LOGOUT",
//                       titleStyle: const TextStyle(fontSize: 20),
//                       content: const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 15.0),
//                         child: Text("Are you sure, you want to Logout?"),
//                       ),
//                       confirm: Expanded(
//                         child: ElevatedButton(
//                           onPressed: () => AuthenticationRepository.instance.logout(),
//                           style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
//                           child: const Text("Yes"),
//                         ),
//                       ),
//                       cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:app/settings.dart';



class fourthpage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
// Color when active

}

class _FourthPageState extends State<fourthpage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/dp.png'
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "Souvik ghosh", false),
              buildTextField("E-mail", "souvikghoshkalna@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "Kolkata . INDIA", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  OutlinedButton(
                    onPressed: () {},

                    // color: Colors.green,
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    // elevation: 2,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}