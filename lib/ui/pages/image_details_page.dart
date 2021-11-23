import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubit_practice/cubit/description_cubit.dart';

import 'package:cubit_practice/model/item_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageDetailsPage extends StatefulWidget {
  final ItemModel item;
  const ImageDetailsPage({required this.item, Key? key}) : super(key: key);

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    Widget image() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: widget.item.downloadUrl,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Author: " + widget.item.author,
                style: GoogleFonts.poppins()
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 20,
            ),
            Container(child: BlocBuilder<DescriptionCubit, DescriptionState>(
              builder: (context, state) {
                if (state is DescriptionSuccess) {
                  descriptionController.text = state.description.description;
                  print('desc: ' + state.description.description);
                  return TextFormField(
                      // controller: TextEditingController(text: state),
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          hintText: 'Enter Description'));
                  // return Text(state);

                } else {
                  return TextFormField(
                      // controller: TextEditingController(text: state),
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          hintText: 'Enter Description'));
                  // return Text(state);
                }
              },
            ))
          ],
        ),
      );
    }

    Widget saveButton() {
      return Center(
          child: BlocConsumer<DescriptionCubit, DescriptionState>(
        listener: (context, state) {
          if (state is DescriptionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.amber, content: Text('Success')));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                context
                    .read<DescriptionCubit>()
                    .saveDescription(descriptionController.text);
              },
              child: Text("Save Description"));
        },
      ));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [image(), description(), saveButton()],
          ),
        ),
      )),
    );
  }
}
