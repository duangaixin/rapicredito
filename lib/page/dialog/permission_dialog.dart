import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/widget/custom_button.dart';

class PermissionDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PermissionDialogState();
  final VoidCallback rightClickConfirm;

  const PermissionDialog({
    Key? key,
    required this.rightClickConfirm,
  }) : super(key: key);
}

class _PermissionDialogState extends State<PermissionDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleView(),
          Expanded(child: _buildContentView()),
          _buildBottomView()
        ],
      ),
    );
  }

  Widget _buildTitleView() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: const Text(
        'Permiso',
        style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff333333),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContentView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildItemView('Recopilación de SMS',
              'Recopilamos todos los datos de sus mensajes de texto, específicamente, monitoreamos el nombre del remitente, la descripción y el monto de la transacción para evaluar el riesgo crediticio. Esto permite pagos de préstamos cada vez más rápidos. Los datos personales de SMS se leen, almacenan o comparten. Cargaremos los datos de SMS al servidor de RapiCrédito (https://test.rapicreditoco.com y https://api2.branch.io).\n\nCuenta principal\n\nPermita que RapiCrédito cargue el permiso de información de la cuenta principal del usuario en nuestro servidor (https://test.rapicreditoco.com y https://api2.branch.io), para realizar una evaluación de control de riesgos y brindarle preferencias de préstamos preaprobados. . Cifrar y subir al exterior. Identificar y analizar sus comportamientos y riesgos, lo que ayudará a prevenir el fraude.\n\nRegistro de llamadas\n\nSi nos autoriza a ver los registros de llamadas, le proporcionaremos una llamada de voz para la evaluación del riesgo crediticio, a fin de confirmar que nuestra aplicación está instalada en su propio teléfono y solo descargaremos y transferiremos el contenido de los registros de llamadas a un entorno de red seguro (https://test.rapicreditoco.com y https://api2.branch.io), con su consentimiento explícito. Bajo ninguna condición compartiremos estos datos con terceros.\n'),
          _buildItemView('Cámara',
              'Utilice una cámara para capturar documentos y/o fotografías requeridas para el proceso de solicitud y evaluación. Cargamos y transmitimos el contenido de la cámara a un entorno de red seguro en nuestro servidor (https://test.rapicreditoco.com y https://api2.branch.io).\n\n Recopilación de datos de teléfonos móviles.\n\nRecopile y supervise información específica sobre su dispositivo, incluido nombre, modelo, región, idioma, identificadores, información de hardware y software, estado, hábitos de uso, identificadores únicos (como IMEI y números de serie). Sólo se utiliza para identificar su dispositivo y para garantizar que no se pueda utilizar sin su autorización y para evitar fraudes. Además, recopilaremos una lista detallada de sus aplicaciones instaladas para evaluar su propensión a endeudarse y su situación de endeudamiento, cargaremos los datos recopilados en nuestro servidor altamente seguro RapiCrédito (https://test.rapicreditoco.com& https://api2. sucursal.io),\n'),
          _buildItemView('colección de ubicaciones',
              'Recopile y supervise información sobre las ubicaciones de los dispositivos para evaluar y puntuar riesgos. Cargaremos los datos de ubicación a nuestro servidor Volcan Prêt (https://test.rapicreditoco.com y https://api2.branch.io).\n'),
          _buildItemView('colección de calendarios',
              'Se utiliza para recordarle la fecha de pago y evitar que los pagos vencidos afecten su crédito. Cargaremos los datos del calendario al servidor (https://test.rapicreditoco.com y https://api2.branch.io) para comparar los préstamos, sus datos estarán protegidos y se mantendrán confidenciales.\n'),
        ],
      ),
    );
  }

  Widget _buildItemView(String title, String content) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 15.0, color: Color(0xff666666)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomView() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: CustomButton(
              onPressed: Get.back,
              minHeight: 46.0,
              backgroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
              fontSize: 15.0,
              radius: 8.0,
              text: 'Regreso',
              textColor: const Color(0xff333333),
              fontWeight: FontWeight.bold,
              side: const BorderSide(color: Color(0xff333333), width: 1.0),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: CustomButton(
                onPressed: () {
                  Get.back();
                  widget.rightClickConfirm();
                },
                minHeight: 46.0,
                backgroundColor: const Color(0xffB8EF17),
                disabledBackgroundColor: const Color(0xffB8EF17),
                fontSize: 15.0,
                radius: 8.0,
                text: 'Confirmar',
                textColor: const Color(0xff333333),
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
