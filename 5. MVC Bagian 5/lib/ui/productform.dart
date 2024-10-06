import 'package:flutter/material.dart';
import 'package:integration_api/models/product.dart';
import 'package:integration_api/services/apiservice.dart';

class ProductForm extends StatefulWidget {
  final Product? product;  // Jika ada data user, berarti form ini untuk edit

  ProductForm({this.product});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _kodeproductController;
  late TextEditingController _namaproductController;
  late TextEditingController _brandController;
  late TextEditingController _kategoriController;
  late TextEditingController _qtyController;

  @override
  void initState() {
    super.initState();
    _kodeproductController = TextEditingController(text: widget.product?.kode_product ?? '');
    _namaproductController = TextEditingController(text: widget.product?.nama_product ?? '');
    _brandController = TextEditingController(text: widget.product?.brand ?? '');
    _kategoriController = TextEditingController(text: widget.product?.kategori ?? '');
    _qtyController = TextEditingController(text: widget.product?.qty.toString() ?? '0');
  }

  @override
  void dispose() {
    _kodeproductController.dispose();
    _namaproductController.dispose();
    _brandController.dispose();
    _kategoriController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  void _saveUser() {
    if (_formKey.currentState!.validate()) {
      Product user = Product(
        kode_product: widget.product?.kode_product ?? '', // 0 atau ID baru jika menambahkan pengguna
        nama_product: _namaproductController.text,
        brand: _brandController.text,
        kategori: _kategoriController.text,
        qty: int.parse(_qtyController.text) ,
      );

      if (widget.product == null) {
        // Jika user null, berarti ini adalah form tambah user
        ApiService().createUser(user).then((value) {
          Navigator.pop(context, value);
        });
      } else {
        // Jika user ada, berarti ini adalah form edit user
        ApiService().updateUser(user.kode_product, user).then((value) {
          Navigator.pop(context, value);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Tambah Product' : 'Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaproductController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _brandController,
                decoration: InputDecoration(labelText: 'Brand'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kategoriController,
                decoration: InputDecoration(labelText: 'Kategori'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kategori harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _qtyController,
                decoration: InputDecoration(labelText: 'Qty'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Qty harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUser,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
