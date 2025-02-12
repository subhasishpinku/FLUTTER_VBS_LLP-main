import 'package:flutter/material.dart';
import 'package:hookah_user/view/screens/drawer_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerPage(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140), // Set this height
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff020D4D),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  elevation: 0,
                  title: const Text('Grab your Favorite'),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: const Text('search your product...'),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      focusColor: Colors.amber,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 9,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        gapPadding: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Row(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  // child: ConstrainedBox(
                  // constraints: BoxConstraints(
                  //     // minHeight: constraints.maxHeight,
                  //     ),
                  child: IntrinsicHeight(
                child: NavigationRail(
                  minWidth: 100,
                  destinations: [
                    createdNavigationRailDestination(
                        image: 'images/1.png',
                        // 'https://media.wired.com/photos/5dc469e66183ed0008252184/master/pass/Sci-cig-1031039324.jpg',
                        label: 'Lorem'),
                    createdNavigationRailDestination(
                        image: 'images/2.png',

                        // 'https://media.wired.com/photos/5dc469e66183ed0008252184/master/pass/Sci-cig-1031039324.jpg',
                        label: 'Lorem '),
                    createdNavigationRailDestination(
                        image: 'images/3.png',

                        // 'https://media.wired.com/photos/5dc469e66183ed0008252184/master/pass/Sci-cig-1031039324.jpg',
                        label: 'Lorem '),
                    createdNavigationRailDestination(
                        image: 'images/4.png',

                        // 'https://media.wired.com/photos/5dc469e66183ed0008252184/master/pass/Sci-cig-1031039324.jpg',
                        label: 'Lorem '),
                    createdNavigationRailDestination(
                        image: 'images/5.png',

                        // 'https://media.wired.com/photos/5dc469e66183ed0008252184/master/pass/Sci-cig-1031039324.jpg',
                        label: 'Lorem '),
                    createdNavigationRailDestination(
                        image: 'images/1.png',
                        // 'https://media.wired.com/photos/5dc469e66183ed0008252184/master/pass/Sci-cig-1031039324.jpg',
                        label: 'Lorem '),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  //   ),
                ),
              ));
            }),
            const VerticalDivider(
              thickness: 2,
              width: 2,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3 / 4),
                  itemBuilder: (context, index) {
                    return createdGrid(
                        title: 'Lorem ipsum',
                        price: 12999,
                        image:
                            'https://m.media-amazon.com/images/I/41DOl9nw96L.jpg');
                    // );
                  }),
            )
          ],
        ));
  }

// -------------------widget-----------------------------------------

  NavigationRailDestination createdNavigationRailDestination(
      {String? image, String? label}) {
    return NavigationRailDestination(
      icon: Container(
        height: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            Container(
              height: 65,
              width: 65,
              child: Image.asset(
                image!,
                fit: BoxFit.cover,
              ),
            ),
            Text(label!,
                style: const TextStyle(color: Colors.black, fontSize: 18)),
          ],
        ),
      ),
      label: const Text(''),
    );
  }

  // -------------------------------------------------
  createdGrid({String? image, String? title, int? price}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            // fit: FlexFit.tight,
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.maxFinite,
              child: Image.network(
                image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Text(title!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          Flexible(
              flex: 1,
              child: Text('₹ $price',
                  style: const TextStyle(color: Colors.black))),
          const SizedBox(height: 5),
          Flexible(
              flex: 2,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 12),
                  )))
        ],
      ),
    );
  }
}
