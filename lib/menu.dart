import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedPlanet = "Solar System";

  final List<String> planets = [
    "Solar System",
    "Mercury",
    "Venus",
    "Earth",
    "Mars",
    "Jupiter",
    "Saturn",
    "Uranus",
    "Neptune",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          // SIDEBAR MENU
          Container(
            width: 220,
            color: const Color(0xFF111111),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "MENU",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(color: Colors.grey),

                Expanded(
                  child: ListView.builder(
                    itemCount: planets.length,
                    itemBuilder: (context, index) {
                      final planet = planets[index];
                      final selected = planet == selectedPlanet;

                      return ListTile(
                        title: Text(
                          planet,
                          style: TextStyle(
                            color: selected ? Colors.greenAccent : Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedPlanet = planet;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // KONTEN PLANET
          //Expanded(
          //child: PlanetView(planetName: selectedPlanet),
          //),
        ],
      ),
    );
  }
}
