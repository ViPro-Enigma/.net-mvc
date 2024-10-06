class Product {
  
  final String kode_product;
  final String nama_product;
  final String brand;
  final String kategori;
  final int qty;

  Product({required this.kode_product, required this.nama_product, required this.brand,required this.kategori,required this.qty});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      kode_product: json['KodeProduct'],
      nama_product: json['NamaProduct'],
      brand: json['Brand'],
      kategori: json['Kategori'],
      qty: json['Qty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kode_product': kode_product,
      'nama_product': nama_product,
      'brand': brand,
      'kategori': kategori,
      'qty': qty,
    };
  }
}
