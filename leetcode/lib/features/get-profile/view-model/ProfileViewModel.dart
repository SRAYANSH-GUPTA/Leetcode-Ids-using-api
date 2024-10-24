// lib/profile_view_model.dart
import 'package:flutter/material.dart';
import '../../../services/api_services.dart';
import '../model/model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  Profile? _profile;
  bool _isLoading = false;
  String _error = '';

  Profile? get profile => _profile;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchProfile(String username) async {
    _isLoading = true;
    notifyListeners();

    try {
      _profile = await _apiService.fetchProfile(username);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
