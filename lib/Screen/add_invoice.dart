// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({Key? key}) : super(key: key);

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xff234f9d),
        title: Text(
          "Create Invoice",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Invoice",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${_currentDate.day}/${_currentDate.month}/${_currentDate.year}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  " - Due in 7 days",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Divider(height: 40, thickness: 5),
            InkWell(
              onTap: () {
                //popup show
                _showDetailsPopup(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add client",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right_outlined, size: 28),
                ],
              ),
            ),
            Divider(height: 40, thickness: 5),
            InkWell(
              onTap: () {
                //popup show
                _showItemsPopup(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add items",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right_outlined, size: 28),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Subtotal 0.00", //get dynamic total
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(height: 40, thickness: 5),
            InkWell(
              onTap: () {
                //popup show
                _showDiscountPopup(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.discount,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Discount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right_outlined, size: 28),
                ],
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                //popup show
                _showTaxPopup(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.percent_outlined,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tax",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right_outlined, size: 28),
                ],
              ),
            ),
            Divider(height: 40, thickness: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total 0.00", //get dynamic total
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xff234f9d),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Show add client pop-up and get details from user
void _showDetailsPopup(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Client'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String name = nameController.text;
              String email = emailController.text;
              Details details = Details(name: name, email: email);
              _storeDetails(
                  details); // You can implement this method to store the details.
              Navigator.of(context).pop();
            },
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class Details {
  final String name;
  final String email;

  Details({required this.name, required this.email});
}

void _storeDetails(Details details) {
  // Implement your storage logic here, e.g., save to a database or file.
  print('Name: ${details.name}, Email: ${details.email}');
}

// Show add items pop-up and get details from user
void _showItemsPopup(BuildContext context) {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Items'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: productNameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: productPriceController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: productQtyController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String name = productNameController.text;
              String price = productPriceController.text;
              String qty = productQtyController.text;
              ItemDetails itemDetails =
                  ItemDetails(name: name, price: price, qty: qty);
              _storeItemDetails(
                  itemDetails); // You can implement this method to store the details.
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class ItemDetails {
  final String name;
  final String price;
  final String qty;

  ItemDetails({required this.name, required this.price, required this.qty});
}

void _storeItemDetails(ItemDetails itemDetails) {
  // Implement your storage logic here, e.g., save to a database or file.
  print(
      'Name: ${itemDetails.name}, Price: ${itemDetails.price}, Quantity: ${itemDetails.qty}');
}

//Discount Pop-up
void _showDiscountPopup(BuildContext context) {
  TextEditingController discountController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Discount'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: discountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Discount'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String discount = discountController.text;
              DiscountDetails discountDetails =
                  DiscountDetails(discount: discount);
              _storeDiscountDetails(
                  discountDetails); // You can implement this method to store the details.
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class DiscountDetails {
  final String discount;

  DiscountDetails({required this.discount});
}

void _storeDiscountDetails(DiscountDetails discountDetails) {
  // Implement your storage logic here, e.g., save to a database or file.
  print('Discount: ${discountDetails.discount}');
}

//Tax Pop-up
void _showTaxPopup(BuildContext context) {
  TextEditingController taxController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Tax'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: taxController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tax'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String tax = taxController.text;
              TaxDetails taxDetails = TaxDetails(tax: tax);
              _storeTaxDetails(
                  taxDetails); // You can implement this method to store the details.
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff234f9d),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class TaxDetails {
  final String tax;

  TaxDetails({required this.tax});
}

void _storeTaxDetails(TaxDetails taxDetails) {
  // Implement your storage logic here, e.g., save to a database or file.
  print('Discount: ${taxDetails.tax}');
}
