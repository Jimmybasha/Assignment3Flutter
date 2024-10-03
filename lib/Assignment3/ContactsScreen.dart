import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {

  static const String routeName="ContactsScreen";




  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  //

  late TextEditingController username;
  late TextEditingController phoneNumber;

  List<Map<String,String>> contacts=[];
  late List<bool> visibilityStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username=TextEditingController();
    phoneNumber=TextEditingController();
    visibilityStatus=[];
  }

  void addContact(){
    if(username.text.isNotEmpty && phoneNumber.text.isNotEmpty){
      contacts.add({
        "Name":username.text,
        "Phone":phoneNumber.text
      });
    visibilityStatus.add(true);
      setState(() {});
    }
    username.clear();
    phoneNumber.clear();
  }

  void removeContact(){

    if(contacts.isNotEmpty){
      contacts.removeLast();
      visibilityStatus.removeLast();
      setState(() {});
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Contacts Screen",style: TextStyle(color: Colors.white),),
          ]
      ),
    ),
      body: Container(
        color: Colors.grey,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
              Container(

                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.edit,color: Colors.blue,),
                    hintStyle: const TextStyle(color: Colors.black),
                    hintText: "Enter Your Name Here",
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.phone,color: Colors.blue,),
                    hintStyle: const TextStyle(color: Colors.black),
                    hintText: "Enter Your Phone Number Here",
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),


                  ),

                ),
              ),
              Container(
                   margin:const EdgeInsets.all(10),
                   child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: (){
                              addContact();
                            },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            child: const Text("Add",style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            removeContact();
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text("Delete",style: TextStyle(color: Colors.black),),

                        ),
                      ),

                    ],
                               ),
                 ),
                Column(
                  children: [
                    for(int i = 0 ; i<contacts.length;i++)
                          Container(
                      margin: const EdgeInsets.all(10),
                      child: Visibility(
                        visible: visibilityStatus[i],
                        child:
                      Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(100),
                          ),
                          child:Column(
                            children: [
                              Text("Name : ${contacts[i]['Name']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text("Phone : ${contacts[i]['Phone']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ],
                          )
                      ),
                      ),
                    ),
                  ],
                ),
                // Visibility(
                //     child:
                // ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}

