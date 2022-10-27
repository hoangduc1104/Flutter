import 'package:flutter/material.dart';
import 'package:kt2/product/pages/home/category.dart';
import 'package:kt2/product/pages/home/itemGrid.dart';
import 'package:kt2/product/pages/home/itemList.dart';
import 'package:kt2/product/provider/Product.dart';

import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String category = "";
  String keyword = "";
  bool? isGrid;
  bool isDesc = false;

  @override
  void initState() {
    super.initState();
    category = "All";
    keyword = "";
    isGrid = true;
    var productProvider = Provider.of<ProductProivder>(context, listen: false);
    productProvider.getList(
      category,
      keyword,
    );
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProivder>(context);

    void setCategory(String cate) {
      setState(() {
        category = cate;
        productProvider.getList(
          cate,
          keyword,
        );
      });
    }

    buildGrid() {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: MediaQuery.of(context).size.height / 1200,
          children: [
            ...productProvider.list.map((e) {
              return ItemGrid(item: e);
            }).toList(),
          ],
        ),
      );
    }

    buildList() {
      return Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...productProvider.list.map((e) {
              return ItemList(item: e);
            }).toList(),
          ],
        ),
      );
    }

    buildSearch() {
      return TextField(
        onSubmitted: (content) async {
          if (content != "") {
            setState(() {
              keyword = content;
              productProvider.getList(
                category,
                content,
              );
            });
          } else {
            setState(() {
              keyword = "";
              productProvider.getList(
                category,
                "",
              );
            });
          }
        },
        decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all((Radius.circular(30))))),
      );
    }

    builView() {
      return productProvider.list.length > 0
          ? isGrid ?? true
              ? buildGrid()
              : buildList()
          : Text("Not thing to show");
    }

    void filterPrice(bool desc) async {
      productProvider.list.sort((a, b) {
        return desc
            ? a.price!.compareTo(b.price ?? 0)
            : b.price!.compareTo(a.price ?? 0);
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Search",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        buildSearch(),
        const SizedBox(
          height: 20,
        ),
        SliderCategory(category: category, setCategory: setCategory),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Sản Phẩn mới",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                isGrid ?? false
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isGrid = false;
                          });
                        },
                        icon: Icon(Icons.list))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isGrid = true;
                          });
                        },
                        icon: Icon(Icons.grid_view_sharp)),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        builView(),
      ],
    );
  }
}
