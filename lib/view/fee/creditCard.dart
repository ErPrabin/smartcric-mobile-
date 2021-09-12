import 'package:flutter/material.dart';
import 'package:smartcric/helper/constants.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key key}) : super(key: key);

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String card_number;
  String expiry_month;
  String expiry_year;
  String cvc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Payment'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Form(
          // key: _formKey,
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Get Your Payment Details",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InsideTitleAndEditTextFields(
                // textEditingController: cardHolderName,
                textTitle: "Card Holder Name",
                hint: "Enter Card Holder Name",
                // inputValidator: FormValidator.validateEmpty,
                maxLines: 1,
              ),
              SizedBox(
                height: 10.0,
              ),
              InsideTitleAndEditTextFields(
                // textEditingController: cardNumber,
                textTitle: "Card Number",
                hint: "XXXX-XXXX-XXXX-XXXX",
                // inputValidator: FormValidator.validateEmpty,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry Month",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new DropdownButton<String>(
                        // value: expiryYear.text,
                        isExpanded: true,
                        hint: Text("Enter Year"),
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.black),
                        items: range(2021, 2080).map((value) {
                          return new DropdownMenuItem<String>(
                            value: value.toString(),
                            child: new Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (_) {
                          // Message.success(_);
                          // setState(() {
                          //   expiryYear.text = _;
                          // });
                        },
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry Month",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new DropdownButton<String>(
                        // value: expiryMonth.text,
                        isExpanded: true,
                        // value: expiryMonth.text,
                        hint: Text("Enter Month"),
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.black),
                        items: range(1, 12).map((value) {
                          return new DropdownMenuItem<String>(
                            value: value.toString(),
                            child: new Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (_) {
                          // Message.success(_);
                          // expiryMonth.text = _;
                        },
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              InsideTitleAndEditTextFields(
                // textEditingController: cvvNumber,
                textTitle: "CVC Number",
                hint: "XXX",
                maxLength: 4,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.0,
              ),
              InsideTitleAndEditTextFields(
                // textEditingController: amount,
                textTitle: "Amount",
                hint: "Enter Amount",
                keyboardType: TextInputType.number,
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // InsideTitleAndEditTextFields(
              //   textEditingController: remarks,
              //   textTitle: StringConstants.REMARKS,
              //   hint: StringConstants.REMARKS,
              // ),
              SizedBox(
                height: 24.0,
              ),
              Center(
                child: RaisedButton(
                  color: kprimarycolor,
                  onPressed: () {},
                  child: Text('Pay Fee'),
                
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  static Iterable<int> range(int low, int high) sync* {
    for (int i = low; i <= high; ++i) {
      yield i;
    }
  }
}

class InsideTitleAndEditTextFields extends StatelessWidget {
  final String textTitle;
  final String hint;
  final int maxLines;
  final int maxLength;
  final TextInputType keyboardType;
  final inputFormatters;
  IconData suffixicons;
  bool enable;
  Function onChanged;
  TextEditingController textEditingController;
  Function inputValidator;

  InsideTitleAndEditTextFields(
      {@required this.textTitle,
      @required this.hint,
      this.maxLines,
      this.suffixicons,
      this.maxLength,
      this.textEditingController,
      this.keyboardType,
      this.inputFormatters,
      this.inputValidator,
      this.enable,
      onChanged});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          textTitle,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kbackgroundcolor,
          ),
          child: TextFormField(
            enabled: enable ?? true,
            validator: inputValidator,
            onChanged: onChanged ?? null,
            keyboardType: keyboardType ?? TextInputType.text,
            inputFormatters: inputFormatters ?? [],
            controller: textEditingController,
            maxLines: maxLines,
            maxLength: maxLength,
            style: TextStyle(
              fontSize: 14.0,
              // fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
                suffixIcon: Icon(suffixicons),
                hintText: hint,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: new BorderSide(),
                ),
                counterText: ''),
          ),
        ),
      ],
    );
  }
}
