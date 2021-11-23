import 'dart:convert';

import 'package:cubit_practice/cubit/item_cubit.dart';
import 'package:cubit_practice/model/item_Model.dart';
import 'package:cubit_practice/ui/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ItemCubit>().fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          if (state is ItemSuccess) {
            return Container(
              child: Column(
                children: state.items.map((ItemModel item) {
                  return ImageCard(item: item);
                }).toList(),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Text(
              'Inspirationist',
              style: GoogleFonts.poppins()
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title(),
                content(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
