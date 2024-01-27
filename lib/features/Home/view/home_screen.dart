import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        hintText: 'Search Amazon.in',
                        border:   OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(7))
                        ),
                        filled: true
                        ,fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        prefixIcon:IconButton(icon: Icon(Icons.search),onPressed: (){},)
                        ,enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38,width: 1),
                          
                          borderRadius: BorderRadius.all(Radius.circular(7))
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
