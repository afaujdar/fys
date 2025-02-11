import 'package:flutter/material.dart';

class StreaksScreen extends StatefulWidget {
  const StreaksScreen({super.key});

  @override
  State<StreaksScreen> createState() => _StreaksScreenState();
}

class _StreaksScreenState extends State<StreaksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streaks"),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),

              Text("Today's Goal: 3 streak days", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 10,),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.pink.shade800.withOpacity(.2),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Streak Days", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text("2", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              const Text("Daily Streak", style: TextStyle(fontSize: 20),),

              const Text("2", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Text("Last 30 Days ", style: TextStyle(color: Colors.pink.shade800)),
                  const Text("+100%", style: TextStyle(color: Colors.green),)
                ],
              ),
              const SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade800.withOpacity(.2)
                ),
                width: double.maxFinite,
                height: 200,
                // here is graph in figma
              ),

              const SizedBox(height: 20,),

              const Text("Keep it up! You're on a roll."),

              const SizedBox(height: 20,),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: double.infinity, // Takes full available width
                    child: FilledButton.tonal(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.pink.shade800.withOpacity(.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      child: Text("Get Started",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
