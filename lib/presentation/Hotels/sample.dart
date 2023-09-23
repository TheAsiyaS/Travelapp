import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/Core/ApiEndpoints.dart';
import 'package:travelapp/Domain/Hotel_Model/Hotel_price_model.dart';

import 'dart:convert';

import 'package:travelapp/Infrastructure/Hotel/Authentication.dart';

class HotelList extends StatelessWidget {
  const HotelList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HotelData>(
      future: fetchHotelData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final hotelData = snapshot.data!;
          final hotels = hotelData.comparison.map((list) => list[0]).toList();

          return ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index];
              return ListTile(
                title: Text(hotel.hotelName),
                subtitle: Text('Price: \$${hotel.prices[0].price1}'),
                // Display other price and vendor information as needed
              );
            },
          );
        }
      },
    );
  }
}

Future<HotelData> fetchHotelData() async {
    final authenticationsObj = Authentications();
      final token = await authenticationsObj.authenticate();
      final Response response = await Dio(BaseOptions(headers: {
        'Authorization': 'JWT $token',
      })).get(khotelApiendpoint);

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.data);
    return HotelData.fromJson(jsonData);
  } else {
    throw Exception('Failed to load hotel data');
  }
}
