import 'package:flutter/material.dart';
import '../../test_one.dart';
import '../categories/presentation/view/categories_view.dart';
import '../countries/presentation/view/countries_view.dart';
import '../governorates/presentation/pages/add_governorates_view.dart';
import '../governorates/presentation/pages/governorates_view.dart';
import '../offres/presentation/screens/offers_view.dart';
import '../stores/presentation/screens/stores_view.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({
    super.key,
  });
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const CountriesView(),
    const GovernoratesView(),
    const StoresView(),
    const CategoriesView(),
    const OffersView(),
    const CountryFlags(),
    const CountryFlags(),
    AddGovernorateView(),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.public,
                ),
                title: const Text('الدول'),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 0;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: const Text(
                  'المحافظات',
                ),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 1;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text('متاجر'),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 2;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('فئات'),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 3;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('عروض'),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 4;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('Test one'),
                onTap: () {
                  setState(() {
                    selectedIndex = 5;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('Test two'),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 6;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('Test three'),
                onTap: () {
                  setState(
                    () {
                      selectedIndex = 7;
                    },
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
