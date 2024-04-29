import 'package:flutter/material.dart';
import 'package:predoo/utils/color.dart';
import 'package:predoo/utils/utils.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          BackgroundContainer(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 20,top: 5,bottom: 5),
              child: Text(
                'My WishList',
                style: TextStyle(
                    color: MyColor.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ProductGrid(
              products: [
                Product(
                    imageUrl:
                        'https://content.jdmagicbox.com/comp/lucknow/e2/0522px522.x522.181115224633.q6e2/catalogue/pink-saloon-and-spa-indira-nagar-lucknow-lucknow-body-massage-centres-vl3lx6kvpx.jpg',
                    name: 'Suraj Spa Center',
                    subtitle: 'It chauraha',
                    rating: 3.2,
                    price: 2000),
                Product(
                    imageUrl:
                        'https://content.jdmagicbox.com/comp/lucknow/e2/0522px522.x522.181115224633.q6e2/catalogue/pink-saloon-and-spa-indira-nagar-lucknow-lucknow-body-massage-centres-vl3lx6kvpx.jpg',
                    name: 'Suraj Spa Center',
                    subtitle: 'It chauraha',
                    rating: 3.2,
                    price: 2000),
                Product(
                    imageUrl:
                        'https://content.jdmagicbox.com/comp/lucknow/e2/0522px522.x522.181115224633.q6e2/catalogue/pink-saloon-and-spa-indira-nagar-lucknow-lucknow-body-massage-centres-vl3lx6kvpx.jpg',
                    name: 'Suraj Spa Center',
                    subtitle: 'It chauraha',
                    rating: 3.2,
                    price: 2000),
                Product(
                    imageUrl:
                        'https://content.jdmagicbox.com/comp/lucknow/e2/0522px522.x522.181115224633.q6e2/catalogue/pink-saloon-and-spa-indira-nagar-lucknow-lucknow-body-massage-centres-vl3lx6kvpx.jpg',
                    name: 'Suraj Spa Center',
                    subtitle: 'It chauraha',
                    rating: 3.2,
                    price: 2000),
                Product(
                    imageUrl:
                        'https://content.jdmagicbox.com/comp/lucknow/e2/0522px522.x522.181115224633.q6e2/catalogue/pink-saloon-and-spa-indira-nagar-lucknow-lucknow-body-massage-centres-vl3lx6kvpx.jpg',
                    name: 'Suraj Spa Center',
                    subtitle: 'It chauraha',
                    rating: 3.2,
                    price: 2000),
                Product(
                    imageUrl:
                        'https://content.jdmagicbox.com/comp/lucknow/e2/0522px522.x522.181115224633.q6e2/catalogue/pink-saloon-and-spa-indira-nagar-lucknow-lucknow-body-massage-centres-vl3lx6kvpx.jpg',
                    name: 'Suraj Spa Center',
                    subtitle: 'It chauraha',
                    rating: 3.2,
                    price: 2000)
              ],
            ),
          )
        ],
      )),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        childAspectRatio: 0.75, // You can adjust this aspect ratio as needed
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        Product product = products[index];
        return GridTile(
          child: _buildProductItem(product),
        );
      },
    );
  }

  Widget _buildProductItem(Product product) {
    return InkWell(
      //onTap: () => _navigateToSingleServiceView(context),
      child: Card(
        elevation: 4,
        color: MyColor.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 105,
                margin: EdgeInsets.all(4),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.network(
                          "https://i.ytimg.com/vi/fnDDPPL4J9M/maxresdefault.jpg",
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: MyColor.secondaryColor,
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: MyColor.textColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, top: 6),
                    decoration: BoxDecoration(
                        color: MyColor.lightPrimaryExtra,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                        margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Text(
                          "Saloon",
                          style: TextStyle(
                              color: MyColor.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ))),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: Colors.amberAccent,
                      ),
                      Text(
                        "4.4",
                        style: TextStyle(color: MyColor.textColorLight),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Mindful Movement",
                  style: TextStyle(
                      color: MyColor.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.person_rounded,
                    color: MyColor.textColorLight,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Vibhav Tiwari",
                    style: TextStyle(
                        color: MyColor.textColorLight,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "₹100.22",
                  style: TextStyle(
                      color: MyColor.primaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final String subtitle;
  final double rating;
  final double price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.price,
  });
}
