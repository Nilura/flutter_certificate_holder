import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
class Barchart extends StatefulWidget {


  @override
  _BarchartState createState() => _BarchartState();
}

class _BarchartState extends State<Barchart> {
   List<GDPData> _chartData;
    TooltipBehavior _tooltipBehavior;


  @override
  void initState() {
    _chartData=getChartData();
    _tooltipBehavior=TooltipBehavior(enable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SfCartesianChart(
            title: ChartTitle(text:'Computer Science 2021'),
            legend:Legend(isVisible: true),
            tooltipBehavior: _tooltipBehavior,
            series:<ChartSeries>[
            BarSeries<GDPData,String>(
                name: 'Programing',
                dataSource: _chartData, xValueMapper: (GDPData gdp, _)=>gdp.continent, yValueMapper:  (GDPData gdp, _)=>gdp.gdp,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true)
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
            //  numberFormat:NumberFormat.simpleCurrency(decimalDigits:0),
            title: AxisTitle(text:'Programming Languages')
          ),
          ),
        ));
  }
  List<GDPData> getChartData(){
    final List<GDPData> chartData=[
      GDPData("Python", 1),
      GDPData("Flutter", 3),
      GDPData("C", 1),
      GDPData("Php", 1),
      GDPData("Java", 3),



    ];
    return chartData;
  }
}
class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final double gdp;

}