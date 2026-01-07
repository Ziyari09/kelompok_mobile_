import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // =======================
  // MENU UTAMA
  // =======================
  final List<String> mainMenu = [
    "Solar System",
    "Mercury & Venus",
    "Earth & Mars",
    "Jupiter & Saturn",
    "Uranus & Neptune",
  ];

  String selectedMenu = "Solar System";
  bool isMenuVisible = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        // =======================
        // MOBILE
        // =======================
        if (isMobile) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(selectedMenu),
            ),
            drawer: _drawerMenu(),
            body: _content(),
          );
        }

        // =======================
        // WEB / DESKTOP
        // =======================
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(isMenuVisible ? Icons.menu_open : Icons.menu),
              onPressed: () {
                setState(() {
                  isMenuVisible = !isMenuVisible;
                });
              },
            ),
            title: Text(selectedMenu),
          ),
          body: Row(
            children: [
              if (isMenuVisible) _sideBar(),
              Expanded(child: _content()),
            ],
          ),
        );
      },
    );
  }

  // =======================
  // SIDEBAR (WEB)
  // =======================
  Widget _sideBar() {
    return Container(
      width: 260,
      color: const Color(0xFF111111),
      child: ListView(
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

          ...mainMenu.map((menu) {
            final selected = menu == selectedMenu;

            return ListTile(
              title: Text(
                menu,
                style: TextStyle(
                  color: selected ? Colors.greenAccent : Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedMenu = menu;
                });

                // =====================================
                // PINDAH PAGE (AKTIFKAN NANTI)
                // =====================================
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlanetPage(menu: menu),
                  ),
                );
                */
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  // =======================
  // DRAWER (MOBILE)
  // =======================
  Widget _drawerMenu() {
    return Drawer(
      backgroundColor: const Color(0xFF111111),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              "MENU",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ...mainMenu.map((menu) {
            final selected = menu == selectedMenu;

            return ListTile(
              title: Text(
                menu,
                style: TextStyle(
                  color: selected ? Colors.greenAccent : Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedMenu = menu;
                });
                Navigator.pop(context);

                // =====================================
                // PINDAH PAGE (AKTIFKAN NANTI)
                // =====================================
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlanetPage(menu: menu),
                  ),
                );
                */
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  // =======================
  // KONTEN UTAMA
  // =======================
  Widget _content() {
    // TIDAK ADA LIST PLANET DI SINI
    // HANYA PLACEHOLDER

    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.public, size: 80, color: Colors.white),
          SizedBox(height: 20),
          Text(
            "Solar System App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Konten planet ada di halaman terpisah\n(dikerjakan anggota tim lain)",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
