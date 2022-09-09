import 'package:advanced_weather/presentation/widgets/weatherWidgets/temperature.dart';
import 'package:flutter/material.dart';

import 'package:advanced_weather/data/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../logic/settingsbloc/settings_bloc.dart';
import '../../../logic/weatherbloc/weather_bloc.dart';
import '../app_utilities.dart';

class LoadedWeather extends StatelessWidget {
  final WeatherModel weatherModel;
  const LoadedWeather({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListElement> listElement = weatherModel.list;
    ListElement first = listElement[0];
    List<ListElement> theRest = listElement.sublist(1);
    return RefreshIndicator(
      color: Colors.purple,
      onRefresh: () async {
        BlocProvider.of<WeatherBloc>(context).add(RefreshWeatherEvent(
            lat: weatherModel.city.coord.lat,
            lon: weatherModel.city.coord.lon));
      },
      child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(children: [
            const SizedBox(height: 10),
            Text(
              'Updated: ${DateFormat('HH:mm').format(DateTime.now())}',
              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
            Text(
              '${weatherModel.city.name}, ${weatherModel.city.country}',
              style:
                  GoogleFonts.lato(fontSize: 20, color: AppUtilities.textColor),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.7,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      BlocBuilder<SettingsBloc, SettingsState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Temperature(
                                  weight: FontWeight.bold,
                                  fontSize: 40,
                                  color: AppUtilities.numColor,
                                  temperature: first.main.temp,
                                  units: state.temperatureUnits),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('RealFeels: ',
                                      style: TextStyle(
                                          color: Colors.grey.shade500)),
                                  Temperature(
                                      weight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                      temperature: first.main.feelsLike,
                                      units: state.temperatureUnits),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      Container(
                        width: 180,
                        height: 170,
                        padding: const EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://openweathermap.org/img/w/${first.weather[0].icon}.png'),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(primaryColor: AppUtilities.appbarColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Humidity:',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade700),
                                      ),
                                      Text(
                                        ' ${first.main.humidity}%',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Text(
                                        'Pressure:',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade700),
                                      ),
                                      Text(
                                        ' ${first.main.pressure}hpa',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Visibility:',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade700),
                                      ),
                                      Text(
                                        //converting the units from metres to km
                                        '${first.visibility / 1000}km',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Text(
                                        'Description:',
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade700),
                                      ),
                                      Text(
                                        first.weather[0].description,
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]);
                  }),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: theRest.length,
                itemBuilder: (context, index) {
                  ListElement rest = theRest[index];
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(primaryColor: AppUtilities.appbarColor),
                    child: SizedBox(
                      width: 50,
                      height: 40,
                      child: Column(
                        children: [
                          Text(
                            rest.dtTxt.hour == 0
                                ? DateFormat('MMM d').format(rest.dtTxt)
                                : DateFormat('HH:mm').format(rest.dtTxt),
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 14),
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'http://openweathermap.org/img/w/${rest.weather[0].icon}.png'),
                                    fit: BoxFit.cover)),
                          ),
                          BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, state) {
                              return Temperature(
                                  weight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.white,
                                  temperature: rest.main.temp,
                                  units: state.temperatureUnits);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    child: charts.BarChart(
                      [
                        charts.Series<ListElement, String>(
                            data: listElement,
                            id: 'fff',
                            measureFn: (e, _) => e.main.temp.round(),
                            domainFn: (e, index) =>
                                DateFormat('MMM d').format(e.dtTxt),
                            //  displayName: 'Temp',
                            colorFn: (datum, index) =>
                                charts.MaterialPalette.purple.shadeDefault,
                            seriesColor: charts.MaterialPalette.white),
                      ],
                      behaviors: [
                        charts.ChartTitle(
                            'Temp changes against time.\n nb:temp is for the last time of that day.',
                            behaviorPosition: charts.BehaviorPosition.bottom),
                      ],
                    )),
              ),
            ),
          ])),
    );
  }
}
