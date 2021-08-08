import 'package:briefcase/src/pages/dashboard_page.dart';
import 'package:briefcase/src/pages/history_page.dart';
import 'package:briefcase/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomePage({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Briefcase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notificaciones',
            onPressed: () {},
          )
        ],
      ),
      body: _loadPage(currentIndex),
      bottomNavigationBar: _customBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ProductPage()))
        },
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                // color: Colors.red,
                // image: DecorationImage(
                //     image: AssetImage('assets/drawerHeaderBG.jpg'),
                //     fit: BoxFit.cover)
                ),
            child: Text('Briefcase'),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Historial'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.verified),
            title: Text('Ofertas'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ),
        ],
      )),
    );
  }

  Widget _loadPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return DashboardPage();
      case 1:
        return HistoryPage();

      default:
        return DashboardPage();
    }
  }

  Widget _customBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time), label: 'Historial')
      ],
    );
  }
}
