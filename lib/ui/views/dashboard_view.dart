import 'package:admin_dashboard/api/solicitud_api.dart';
import 'package:admin_dashboard/dialog/dialogAcepCanc.dart';
import 'package:admin_dashboard/model/detalle.dart';
import 'package:admin_dashboard/providers/export_provider.dart';
import 'package:admin_dashboard/ui/components/notifications_indicator.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/util/save_file_web.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  /* var f = NumberFormat('###0.00', 'en_US'); */
  Color isColor = Colors.white;
  final _api = SolicitudApi();
  late ScrollController _controller;
  var isShowContainer = true;
  @override
  void initState() {
    _controller = ScrollController();
    Provider.of<ExportProvider>(context, listen: false).getRegistro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final exportProvider = Provider.of<ExportProvider>(context);
    return WhiteCard(
      listWidget: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: InkWell(
            onTap: () => exportProvider.uploadRegistro(),
            child: const Tooltip(
              message: "Actualizar",
              child: Icon(
                Icons.refresh_outlined,
                size: 22,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: InkWell(
            onTap: () => setState(() => isShowContainer = !isShowContainer),
            child: const Tooltip(
              message: "Envio de reportes",
              child: Icon(
                Icons.send_and_archive_outlined,
                size: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
      title: isShowContainer
          ? "Generador de reportes a excel".toUpperCase()
          : "Envio de reportes".toUpperCase(),
      child: isShowContainer
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 300,
                    height: 400,
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: exportProvider.listCabecera.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () async {
                            final opt = await dialogAcepCanc(
                                context,
                                'Advertencia',
                                Text(
                                    'Estas seguro que deseas eliminar el registro?'),
                                Icons.info,
                                Colors.amber);

                            if (opt) {
                              exportProvider.deleteRegistro(
                                  exportProvider.listCabecera[index]);
                            }
                          },
                          child: Card(
                            child: ListTile(
                              dense: true,
                              isThreeLine: true,
                              minVerticalPadding: 10,
                              onTap: () async {
                                buildShowDialog(context);
                                /*  final cabecera = await _api.queryCabecera(
                                "manager",
                                exportProvider
                                    .listCabecera[index].codPrg); */
                                /* Setting */

                                final setting = await _api.queryTexto(
                                    exportProvider.listCabecera[index].codUsr,
                                    exportProvider.listCabecera[index].codPrg);
                                /* Lista de detalles */
                                final listDetail = await _api.queryDetalle(
                                    exportProvider.listCabecera[index]);

                                await _generateExcel(listDetail, setting);

                                Navigator.of(context).pop();

                                exportProvider.uploadEstado(
                                    exportProvider.listCabecera[index]);

                                exportProvider.uploadRegistro();
                              },
                              title: Text(
                                  exportProvider.listCabecera[index].edtN01),
                              subtitle: Text(DateFormat('dd/MM/yyyy - hh:mm a')
                                  .format(exportProvider
                                      .listCabecera[index].edtF01)),
                              trailing:
                                  exportProvider.listCabecera[index].edtSts ==
                                          "1"
                                      ? NotificationsIndicator(
                                          child: true,
                                        )
                                      : NotificationsIndicator(
                                          child: false,
                                        ),
                            ),
                            elevation: 8,
                            shadowColor:
                                exportProvider.listCabecera[index].edtSts == "1"
                                    ? Colors.green
                                    : Colors.grey,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: exportProvider
                                                .listCabecera[index].edtSts ==
                                            "1"
                                        ? Colors.green
                                        : Colors.grey,
                                    width: 1)),
                          ),
                        );
                      },
                    )),
              ],
            )
          : Center(
              child: DataTable(
                  dataRowHeight: 28,
                  headingRowHeight: 28,
                  dividerThickness: 2,
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.05);
                  }),
                  columns: [
                    DataColumn(
                        label: Text(
                      'Fechas'.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    DataColumn(
                        label: Text(
                      'Nombre'.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    DataColumn(
                        label: Text(
                      'Exportación'.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    DataColumn(
                        label: Text(
                      'Envio'.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text('08/05/2021')),
                      DataCell(Text('balance general'.toUpperCase())),
                      DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Tooltip(
                                message: "Excel",
                                child: SvgPicture.asset(
                                  "assets/excel.svg",
                                  fit: BoxFit.contain,
                                )),
                          ),
                          const SizedBox(width: 2.0),
                          InkWell(
                            onTap: () {},
                            child: Tooltip(
                                message: "Pdf",
                                child: SvgPicture.asset(
                                  "assets/color-pdf.svg",
                                  height: 25,
                                  fit: BoxFit.contain,
                                )),
                          ),
                          const SizedBox(width: 2.0),
                          InkWell(
                            onTap: () {},
                            child: Tooltip(
                                message: "Texto",
                                child: SvgPicture.asset(
                                  "assets/txt.svg",
                                  height: 30,
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ],
                      )),
                      DataCell(
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Tooltip(
                                  message: "WhatsApp",
                                  child: SvgPicture.asset(
                                    "assets/whatsapp.svg",
                                    fit: BoxFit.contain,
                                    width: 30,
                                    height: 30,
                                  )),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Tooltip(
                                  message: "Email",
                                  child: SvgPicture.asset(
                                    "assets/e-mail.svg",
                                    fit: BoxFit.contain,
                                    width: 30,
                                    height: 40,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ]),
            ),
    );
  }
}

Future<void> _generateExcel(List<Detalle> listExcel, String setting) async {
  int x = 1;
  var numero = 0;
  var arrayZ = setting.split(',');
  final excel.Workbook workbook = excel.Workbook(0);
  final excel.Worksheet sheet1 = workbook.worksheets.addWithName('cxc');
  sheet1.showGridlines = true;

  for (var element in listExcel) {
    int y = 1;
    final desglose = element.txtLin.split("|");
    for (var obj in desglose) {
      try {
        switch (arrayZ[numero]) {
          case 'T':
            sheet1.getRangeByIndex(x, y).text = obj;
            break;
          case 'N':
            if (isNumber(obj)) {
              sheet1.getRangeByIndex(x, y).number = double.parse(obj.trim());
            } else {
              sheet1.getRangeByIndex(x, y).text = obj;
            }
            break;
          default:
            sheet1.getRangeByIndex(x, y).text = obj;
            break;
        }
      } catch (e) {
        rethrow;
      }
      numero += 2;
      y++;
    }
    numero = 0;
    x++;
  }

  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'ExpensesReport.xlsx');
}

void verificar(excel.Worksheet sheet1, int x, int y, String obj) {
  try {
    if (obj.substring(0, 1) == "0") {
      sheet1.getRangeByIndex(x, y).text = obj.trim();
    } else {
      double.parse(obj);
      sheet1.getRangeByIndex(x, y).number = double.parse(obj.trim());
    }
  } catch (e) {
    sheet1.getRangeByIndex(x, y).text = obj.trim();
  }
}

bool isNumber(String number) {
  bool result = false;
  try {
    final x = number.trim();
    double.parse(x);
    result = true;
  } catch (e) {
    result = false;
  }
  return result;
}

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}
