// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/Data_page.dart';

import '../util.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({Key? key}) : super(key: key);

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController taxController = TextEditingController();

  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Color(0xff234f9d),
        title: Text(
          "Create Invoice",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              //=================> Get Client info
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.perm_identity_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.clientName ?? ""}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.clientEmail ?? ""}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  //popup show
                  _showDetailsPopup(context);
                  setState(() {});
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
              //=================> Get product info
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.productName ?? ""}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.currency_rupee_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.productPrice ?? ""}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.production_quantity_limits_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.productQuantity ?? ""}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  //popup show
                  _showItemsPopup(context);
                  setState(() {});
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
                    "Subtotal ${invoicedata.subTotal ?? "0.00"}",
                    //get dynamic total
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Divider(height: 40, thickness: 5),
              //=================> Get product info
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.discount_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.discount ?? "0.00"} ₹",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.withOpacity(1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

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
              //=================> Get product info
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.percent_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${invoicedata.tax ?? "0.00"} %",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Total ${invoicedata.total ?? "0.00"}",
                      //get dynamic total
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
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
            ],
          ),
        ),
      ),
    );
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
                invoicedata.clientEmail = name;
                invoicedata.clientEmail = email;
                // You can implement this method to store the details.
                Navigator.of(context).pop();
                setState(() {});
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
                String productName = productNameController.text;
                int productPrice = int.parse(productPriceController.text);
                int productQty = int.parse(productQtyController.text);
                invoicedata.productName = productName;
                invoicedata.productPrice = productPrice;
                invoicedata.productQuantity = productQty;

                invoicedata.subTotal =
                    (invoicedata.productPrice! * invoicedata.productQuantity!);
                // You can implement this method to store the details.
                Navigator.of(context).pop();
                setState(() {});
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
                // String discount = discountController.text;
                int discount = int.parse(discountController.text);
                invoicedata.discount = discount;
                // You can implement this method to store the details.
                Navigator.of(context).pop();
                setState(() {});
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
                // String tax = taxController.text;
                int tax = int.parse(taxController.text);

                invoicedata.tax = tax;

                invoicedata.total =
                    (invoicedata.subTotal! - invoicedata.discount!) +
                        (invoicedata.tax!);

                // You can implement this method to store the details.
                Navigator.of(context).pop();
                setState(() {});
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
  @override
  void dispose() {
    taxController.dispose();
    discountController.dispose();
    productQtyController.dispose();
    productPriceController.dispose();
    productNameController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }
}