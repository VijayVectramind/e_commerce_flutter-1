// ignore_for_file: non_constant_identifier_names

import '../model/url_model.dart';
import '../utils/enums.dart';

String baseUrl = "https://e-commerce-customer-backend.onrender.com/api/";


String url_login = 'users/login';
String url_userRegistration = 'users/register';

// Authentication  urls

UrlModel userRegistration = UrlModel(
    url: url_userRegistration,
    urlAuthtypeEnum: UrlAuthtypeEnum.NONAUTH);

UrlModel userLogin = UrlModel(
    url: url_login,
    urlAuthtypeEnum: UrlAuthtypeEnum.NONAUTH);    