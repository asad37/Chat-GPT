// getData()async{
//   var email = emailContrller.text.trim();
//                       var password = passwordContrller.text.trim();

//                       try {
//                         var user = await FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                                 email: email, password: password);  
//                         if(user.user!=null){
//                           user.user?.uid;   
//                            SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
//                             await sharedPreferences.setString('uid', user.user?.uid??"");
//                             await sharedPreferences.setString('email', user.user?.email??"");
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SianaScreen()));
//                            var snackbar = SnackBar(
//                           content: Text(
//                             "Login Successfully",
//                             style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green),
//                           ),
//                           shape: StadiumBorder(),
//                           backgroundColor: Colors.grey,
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(snackbar);
//                         }  
//                       }on FirebaseAuthException catch (e) {
//                         var snackbar = SnackBar(
//                           content: Text(
//                             "${e.message}",
//                             style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.red),
//                           ),
//                           shape: StadiumBorder(),
//                           backgroundColor: Colors.green,
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(snackbar);
//                       }
// }