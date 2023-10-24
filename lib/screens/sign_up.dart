import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import '../common_widgets/primary_filled_button.dart';
import '../model/sign_up/sign_up_request_model.dart';
import '../model/sign_up/sign_up_response_model.dart';
import '../provider/sign_up_provider.dart';
import 'login_screen/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  Color buttonColor = Colors.blue;
  bool submitted = false;
  void _submit() {
    setState(() => submitted = true);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  Future<void> _RegistrationSuccessfulDilog() async {
    await SmartDialog.show(
      backDismiss: false,
      alignment: Alignment.center,
      builder: (_) {
     
        return Center(
          child: SizedBox(
            height: 200,
            width:double.infinity,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                        child: Text(
                      "User Registration \n   Successful!",
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          SmartDialog.dismiss();
                        },
                        child: Text("Ok"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final String _name = '';

  bool checkboxValue = false;

  bool isChecked = false;
  final List<String> cityList = [
    'Hyderabad',
    'Chennai',
    'Banglore',
  ];
  var chosenValue;
  List<String> gameList = ["Handball", "Volleyball", "Football", "Badminton"];
//final FocusNode focusNode = Focus.of(context);
//final bool hasFocus = focusNode.hasFocus;
  String? doctordropdownvalue;
  bool hideerror = false;
  bool first = true;
  String inperson = "inperson";
  int _radioSelected = 1;
  String? _radioVal;
  final ValueNotifier<String?> _selectedCity = ValueNotifier<String?>(null);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final RegExp _numeric = RegExp(r"^[0-9]*$");
  final RegExp _alphaNumeric = RegExp(r'^[a-zA-Z0-9&%=]+$');

  late SignUpProvider signUpProvider;
  @override
  void initState() {
    super.initState();
    signUpProvider = Provider.of<SignUpProvider>(context,listen:false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(children: [
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            enabled: true,
                            controller: _nameController,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              helperMaxLines: 2,
                              filled: true,
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              label: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Text(
                                        "Name",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9b9b9b),
                                          height: 11 / 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            enabled: true,
                            controller: _mobileNoController,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              helperMaxLines: 2,
                              filled: true,
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              label: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Text(
                                        "Mobile Number",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9b9b9b),
                                          height: 11 / 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            enabled: true,
                            controller: _emailController,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              helperMaxLines: 2,
                              filled: true,
                                fillColor: Colors.white,
                              hoverColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              label: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Text(
                                        "Email",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9b9b9b),
                                          height: 11 / 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            controller: _passwordController,
                            enabled: true,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              helperMaxLines: 2,
                              filled: true,
                               fillColor: Colors.white,
                              hoverColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              label: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9b9b9b),
                                          height: 11 / 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Already have an account?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 14,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                       
                        Selector<SignUpProvider,bool>(
                          selector: (p0, p1) => p1.isLoading,
                          builder: (context, value, child) => 
                        SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: PrimaryFilledButton(
                              buttonTitle: "SIGN UP",
                              isLoading: value,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  SignUpRequestModel signUpRequestModel =
                                      SignUpRequestModel(
                                    email: _emailController.text.trim(),
                                    name: _nameController.text.trim(),
                                    mobile: _mobileNoController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ); 
                                  SignUpResponseModel? response = await 
                                    signUpProvider.postRegisterData(
                                          context, signUpRequestModel);
                                  if (response != null ) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));   
                                   }
                                }
                              },
                            ),
                          ),
                        )
    ]),
                ))
          ]),
        ));
  }
}
