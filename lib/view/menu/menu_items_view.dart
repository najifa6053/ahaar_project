import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/menu_item_row.dart';
import 'package:ahaar_project/common_widget/round_textfiled.dart';
import 'package:ahaar_project/view/menu/item_details_view.dart';
import 'package:flutter/material.dart';

class MenuItemsView extends StatefulWidget {
  final Map mObj;
  const MenuItemsView({super.key, required this.mObj});

  @override
  State<MenuItemsView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuItemsView> {
  TextEditingController txrSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/image/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.5",
      "rating": "100+",
      "type": "Chinese",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_3.png",
      "name": "Street Shake",
      "rate": "4.8",
      "rating": "155",
      "type": "Restaurant",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_4.png",
      "name": "Fudgy Chewy Brownies",
      "rate": "4.8",
      "rating": "155",
      "type": "Restaurant",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.5",
      "rating": "100+",
      "type": "Chinese",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_3.png",
      "name": "Street Shake",
      "rate": "4.8",
      "rating": "155",
      "type": "Restaurant",
      "food_type": "Dessert",
    },
    {
      "image": "assets/image/dess_4.png",
      "name": "Fudgy Chewy Brownies",
      "rate": "4.8",
      "rating": "155",
      "type": "Restaurant",
      "food_type": "Dessert",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 46),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/image/btn_back.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.mObj["name"].toString(),
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/image/shopping_cart.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfiled(
                  hintText: "Search Food",
                  controller: txrSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/image/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: (context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailsView(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
