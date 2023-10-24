import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/primary_filled_button.dart';
import '../../model/login/login_request_dto.dart';
import '../../model/login/login_response_dto.dart';
import '../../provider/login_provider.dart';
import '../../provider/sign_up_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  Color buttonColor = Colors.blue;
  bool submitted = false;
  void _submit() {
    setState(() => submitted = true);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  final String _name = '';

  bool checkboxValue = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileNoController = TextEditingController();
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

  TextEditingController mobNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RegExp _numeric = RegExp(r"^[0-9]*$");
  final RegExp _alphaNumeric = RegExp(r'^[a-zA-Z0-9&%=]+$');

  late LoginProvider loginProvider;

  @override
  void initState() {
    super.initState();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
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
                        controller: emailController,
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
                        controller: passwordController,
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
                        'Forgot your password ?',
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
                      height: 20,
                    ),
                    Selector<SignUpProvider, bool>(
                      selector: (p0, p1) => p1.isLoading,
                      builder: (context, value, child) => SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: PrimaryFilledButton(
                          buttonTitle: "SIGN IN",
                          isLoading: value,
                          onPressed: () async {
                            formKey.currentState!.validate();
                            formKey.currentState!.save();
                            LoginRequestModel loginRequestModel =
                                LoginRequestModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                            LoginResponseModel? response = await loginProvider
                                .postLoginData(loginRequestModel);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
