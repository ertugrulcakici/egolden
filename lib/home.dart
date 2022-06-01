import 'package:egolden/ui_helpers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: isVertical(context)
            ? AppBar(
                toolbarOpacity: 1,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.black,
                surfaceTintColor: Colors.black,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu, color: Colors.black)),
                        Image.network("http://www.turbim.com/img/logo.png",
                            width: screenWidth * 0.15,
                            height: screenHeight * 0.15),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/account");
                            },
                            icon: const Icon(Icons.account_box,
                                color: Colors.black)),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/basket");
                            },
                            icon: const Icon(Icons.shopping_cart,
                                color: Colors.black)),
                      ],
                    )
                  ],
                ),
              )
            : null,
        body: isVertical(context)
            ? _mobile(screenWidth, screenHeight)
            : _desktop(screenWidth, screenHeight));
  }

  Widget _desktop(double screenWidth, double screenHeight) {
    return Column(
      children: [
        Center(
          child: Container(
            width: screenWidth * 0.75,
            height: screenHeight * 0.15,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network("https://i.hizliresim.com/gwsbd9h.png",
                      width: screenWidth * 0.15, height: screenHeight * 0.15),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.25),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.search),
                        hintText: 'Ürün adı, marka, kategori',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, "/account");
                          },
                          icon: const Icon(Icons.account_box),
                          label: const Text("Hesabım")),
                      TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, "/basket");
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("Sepetim")),
                    ],
                  )
                ]),
          ),
        ),
        const Divider()
      ],
    );
  }

  Widget _mobile(double screenWidth, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.90),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.search),
                  hintText: 'Ürün adı, marka, kategori',
                ),
              )),
        )
      ],
    );
  }
}
