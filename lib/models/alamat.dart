class Address {
  String street = '';
  String city = '';
  String province = '';
  String postal = '';

  static List<Address> addressList = [];

  Address(String street, String city, String province, String postal) {
    street = street;
    city = city;
    province = province;
    postal = postal;
  }

  static saveAddress(Address newAddress) {
    addressList.add(newAddress);
  }
}
