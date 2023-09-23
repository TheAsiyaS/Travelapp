class HotelData {
  List<List<Hotel>> comparison;
  HotelData({
    required this.comparison,
  });

  factory HotelData.fromJson(Map<String, dynamic> json) {
    List<List<Hotel>> comparison = [];
    for (var item in json['Comparison']) {
      List<Hotel> hotels = [];
      for (var hotelData in item) {
        hotels.add(Hotel.fromJson(hotelData));
      }
      comparison.add(hotels);
    }

    return HotelData(comparison: comparison);
  }
}

class Hotel {
  String hotelName;
  List<Price> prices;
  Hotel({
    required this.hotelName,
    required this.prices,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    String hotelName = json['hotelName'];
    List<Price> prices = [];
    for (var priceData in json[1]) {
      prices.add(Price.fromJson(priceData));
    }

    return Hotel(hotelName: hotelName, prices: prices);
  }
}

class Price {
  int? price1;
  int? tax1;
  String? vendor1;
  // Add properties for price2, tax2, vendor2, and so on

  Price({
    this.price1,
    this.tax1,
    this.vendor1,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      price1: json['price1'],
      tax1: json['tax1'],
      vendor1: json['vendor1'],
      // Add parsing for price2, tax2, vendor2, and so on
    );
  }
}

class HotelApiResponse {
  int totalHotelsCount;
  int currentPageHotelsCount;
  int totalpageCount;
  HotelApiResponse({
    required this.totalHotelsCount,
    required this.currentPageHotelsCount,
    required this.totalpageCount,
  });

  factory HotelApiResponse.fromJson(Map<String, dynamic> json) {
    return HotelApiResponse(
      totalHotelsCount: json['totalHotelsCount'],
      currentPageHotelsCount: json['currentPageHotelsCount'],
      totalpageCount: json['totalpageCount'],
    );
  }
}
