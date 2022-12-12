class Address {
  String street = '';
  String city = '';
  String province = '';
  String postal = '';

  static List<Address> addressList = [];

  Address(String st, String ci, String prov, String pos) {
    street = st;
    city = ci;
    province = prov;
    postal = pos;
  }

  static saveAddress(Address newAddress) {
    addressList.add(newAddress);
  }
}
