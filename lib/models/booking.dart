class Booking {
  final String hotelName;
  final DateTime checkIn;
  final DateTime checkOut;
  final int guests;
  final double totalPrice;

  const Booking({
    required this.hotelName,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.totalPrice,
  });
}