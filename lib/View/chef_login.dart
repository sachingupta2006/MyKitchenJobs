import 'package:flutter/material.dart';
import 'package:my_kitchen_jobs/Utils/custom_login.dart';

class ChefLogin extends StatelessWidget {
  const ChefLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLogin("Chef Login Screen");
  }
}






// class ChefLogin extends StatelessWidget {
//   const ChefLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var name = 'qwer'.obs;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chef Login Page"),
//       ),
//       body: Column(
//         children: [
//           Obx(() => Text(name.value)),
//           ElevatedButton(
//               onPressed: () {
//                 name.value = 'asdf';
//               },
//               child: Text('change'))
//         ],
//       ),
//     );
//   }
// }
