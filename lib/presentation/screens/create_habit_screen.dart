import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manish_habit_tracking_app/presentation/router/routes_name.dart';

class CreateHabitScreen extends ConsumerWidget {
  CreateHabitScreen({super.key});

  final TextEditingController habitTitleEC = TextEditingController();
  final TextEditingController habitDesc = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ///
        context.go(RoutesName.home.path());
        }, icon: 
        Icon(Icons.arrow_back)),
        title: Text("Create your habit"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextField(
                        controller: habitTitleEC,
                        decoration:
                            InputDecoration.collapsed(
                              hintText: "Enter Your habit title"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextField(
                        controller: habitDesc,
                        decoration:
                            InputDecoration.collapsed(
                              hintText: "Enter Your habit desc"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(onPressed: (){
                      


                      context.goNamed("home",pathParameters: {'userName':"success"});
                      
                    }, child: Text("Create")),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
