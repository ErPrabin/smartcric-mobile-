import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartcric/controller/feecontroller.dart';
import 'package:smartcric/helper/constants.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key key}) : super(key: key);

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  // String card_number;
  // String expiry_month;
  // String expiry_year;
  // String cvc;
  final _formKey = GlobalKey<FormState>();

  TextEditingController choldername = TextEditingController();
  TextEditingController cnumber = TextEditingController();
  TextEditingController expmonth = TextEditingController(text: "12");
  TextEditingController expyear = TextEditingController(text: '2021');
  TextEditingController cvc = TextEditingController();
  TextEditingController amount = TextEditingController(text: "100");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Check Out'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  "Get Your Delivery Details",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 10.0,
                              ),
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //     prefixIcon: Icon(Icons.location_city),
                              //     hintText: 'Delivery Address',
                              //   ),
                              //   validator: (val) =>
                              //       val.isEmpty ? 'Enter address' : null,
                              //   onChanged: (val) {
                              //     setState(() => address = val);
                              //     print(address);
                              //   },
                              // ),
                              // TextFormField(
                              //   initialValue: phonenumber,
                              //   decoration: InputDecoration(
                              //     prefixIcon: Icon(Icons.contact_phone),
                              //     hintText: 'Phone Number',
                              //   ),
                              //   // validator: (val) =>
                              //   //     val.isEmpty ? 'Enter Email' : null,
                              //   onChanged: (val) {
                              //     setState(() => phonenumber = val);
                              //   },
                              // )
                              SizedBox(
                                height: 20.0,
                              ),
                              Column(
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
                                    textEditingController: choldername,
                                    textTitle: "Card Holder Name",
                                    hint: "Enter Card Holder Name",
                                    // inputValidator: FormValidator.validateEmpty,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  InsideTitleAndEditTextFields(
                                    textEditingController: cnumber,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Expiry Year",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          new DropdownButton<String>(
                                            value: expyear.text,
                                            isExpanded: true,
                                            hint: Text("Enter Year"),
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: Colors.black),
                                            items:
                                                range(2021, 2080).map((value) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: value.toString(),
                                                child:
                                                    new Text(value.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (_) {
                                              // Message.success(_);
                                              setState(() {
                                                expyear.text = _;
                                              });
                                            },
                                          ),
                                        ],
                                      )),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Flexible(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Expiry Month",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          new DropdownButton<String>(
                                            value: expmonth.text,
                                            isExpanded: true,
                                            // value: expiryMonth.text,
                                            hint: Text("Enter Month"),
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: Colors.black),
                                            items: range(1, 12).map((value) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: value.toString(),
                                                child:
                                                    new Text(value.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (_) {
                                              // Message.success(_);
                                              setState(() {
                                                expmonth.text = _;
                                              });
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
                                    textEditingController: cvc,
                                    textTitle: "CVC Number",
                                    hint: "XXX",
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  InsideTitleAndEditTextFields(
                                    textEditingController: amount,
                                    textTitle: "Amount",
                                    hint: "100",
                                    enable: false,
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
                                    height: 12.0,
                                  ),
                                ],
                              ),
                              RaisedButton(
                                  // elevation: 0.0,
                                  child: Container(
                                    width: 350,
                                    height: 40.0,
                                    child: Center(
                                      child: Text(
                                        "Pay Fee",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  color: kprimarycolor,
                                  onPressed: () async {
                                    print(cnumber.text);
                                    if (_formKey.currentState.validate()) {
                                      EasyLoading.show(
                                          status: "Fee Payment",
                                          maskType: EasyLoadingMaskType.black);
                                      FeeController.payFee(
                                              cnumber.text,
                                              expmonth.text,
                                              expyear.text,
                                              cvc.text)
                                          .then((data) {
                                        if (data['status'] == 1) {
                                          EasyLoading.showSuccess(
                                              data['message']);
                                        } else {
                                          EasyLoading.showError(
                                              data['message']);
                                        }
                                        EasyLoading.dismiss();
                                      });
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
    // });
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
            validator: (val) => val.isEmpty ? 'Field Cannot be emptyss' : null,
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
