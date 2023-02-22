import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newweatherapp/models/weather_model.dart';
import 'package:newweatherapp/pages/weather/states.dart';
import 'package:newweatherapp/services/weather_service.dart';


class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  Weather_Model? weatherData;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      Weather_Model weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
