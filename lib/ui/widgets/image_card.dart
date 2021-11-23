import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubit_practice/model/item_Model.dart';
import 'package:cubit_practice/ui/pages/image_details_page.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final ItemModel item;
  const ImageCard({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetailsPage(
                      item: item,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity - (2 * 24),
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: item.downloadUrl,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
