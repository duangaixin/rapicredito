import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:rapicredito/page/permission/index.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';

class PermissionPage extends GetView<PermissionCtr> {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF).withOpacity(0.3),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              color: Colors.white),
          padding: const EdgeInsets.only(top: 23.0, bottom: 7.0),
          margin: const EdgeInsets.only(
              top: 79.0, bottom: 70.0, left: 10.0, right: 10.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleView(),
              _buildContentView(),
              _buildBottomView()
            ],
          ),
        ));
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
    return Expanded(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildItemView('política de privacidad', 'Esta Política de Privacidad aplica a todos los productos/software y servicios "RapiCrédito". Usted acepta esta Política de privacidad para recopilar, usar, divulgar y procesar información (información personal y del dispositivo) relacionada con su acceso y uso de los Servicios. Nos reservamos el derecho de modificar estas políticas en cualquier momento. Le invitamos a revisar periódicamente esta sección para posibles actualizaciones y cambios. La notificación de cualquier cambio material puede enviarse a su cuenta por correo electrónico o mensajes del sistema.\n'),
          _buildItemView('Recopilación y uso de información','Para una mejor experiencia, al utilizar nuestros servicios, es posible que le solicitemos que nos proporcione cierta información de identificación personal. La información solicitada permanecerá en su dispositivo y no la recopilaremos de ninguna manera.\n\nLa aplicación utiliza servicios de terceros que pueden recopilar información que puede usarse para identificarlo.\n'),
          _buildItemView('Recopilación de SMS',
              'Recopilamos todos los datos de sus mensajes de texto, específicamente, monitoreamos el nombre del remitente, la descripción y el monto de la transacción para evaluar el riesgo crediticio. Esto permite pagos de préstamos cada vez más rápidos. Los datos personales de SMS se leen, almacenan o comparten. Cargaremos los datos de SMS al servidor de RapiCrédito (https://test.rapicreditoco.com y https://api2.branch.io).\n\nCuenta principal\n\nPermita que RapiCrédito cargue el permiso de información de la cuenta principal del usuario en nuestro servidor (https://test.rapicreditoco.com y https://api2.branch.io), para realizar una evaluación de control de riesgos y brindarle preferencias de préstamos preaprobados. . Cifrar y subir al exterior. Identificar y analizar sus comportamientos y riesgos, lo que ayudará a prevenir el fraude.\n\nRegistro de llamadas\n\nSi nos autoriza a ver los registros de llamadas, le proporcionaremos una llamada de voz para la evaluación del riesgo crediticio, a fin de confirmar que nuestra aplicación está instalada en su propio teléfono y solo descargaremos y transferiremos el contenido de los registros de llamadas a un entorno de red seguro (https://test.rapicreditoco.com y https://api2.branch.io), con su consentimiento explícito. Bajo ninguna condición compartiremos estos datos con terceros.\n'),
          _buildItemView('Cámara',
              'Utilice una cámara para capturar documentos y/o fotografías requeridas para el proceso de solicitud y evaluación. Cargamos y transmitimos el contenido de la cámara a un entorno de red seguro en nuestro servidor (https://test.rapicreditoco.com y https://api2.branch.io).\n\n Recopilación de datos de teléfonos móviles.\n\nRecopile y supervise información específica sobre su dispositivo, incluido nombre, modelo, región, idioma, identificadores, información de hardware y software, estado, hábitos de uso, identificadores únicos (como IMEI y números de serie). Sólo se utiliza para identificar su dispositivo y para garantizar que no se pueda utilizar sin su autorización y para evitar fraudes. Además, recopilaremos una lista detallada de sus aplicaciones instaladas para evaluar su propensión a endeudarse y su situación de endeudamiento, cargaremos los datos recopilados en nuestro servidor altamente seguro RapiCrédito (https://test.rapicreditoco.com& https://api2. sucursal.io),\n'),
          _buildItemView('colección de ubicaciones',
              'Recopile y supervise información sobre las ubicaciones de los dispositivos para evaluar y puntuar riesgos. Cargaremos los datos de ubicación a nuestro servidor Volcan Prêt (https://test.rapicreditoco.com y https://api2.branch.io).'),
          _buildItemView('colección de calendarios',
              'Se utiliza para recordarle la fecha de pago y evitar que los pagos vencidos afecten su crédito. Cargaremos los datos del calendario al servidor (https://test.rapicreditoco.com y https://api2.branch.io) para comparar los préstamos, sus datos estarán protegidos y se mantendrán confidenciales.'),
          _buildItemView('Recopilación de almacenamiento de datos.',
              'Toda la información recopilada la almacenaremos en los servidores de RapiCrédito (https://test.rapicreditoco.com y https://api2.branch.io) con un alto grado de protección.\n\nLista de aplicaciones instaladas y archivos de catálogo\n\n Debe autorizarnos a instalar la lista de aplicaciones y la información del archivo del catálogo en su teléfono móvil para ayudarnos en nuestra evaluación de riesgos. Todos los datos se cifrarán y se cargarán en nuestros servidores (https://test.rapicreditoco.com y https://api2.branch.io).\n'),
          _buildItemView('¿Cómo se comparte su información?',
              'No compartiremos su información personal con terceros a menos que:\n\n • Hemos obtenido su consentimiento para hacerlo.\n\n  • Estamos obligados a hacerlo por ley o en respuesta a un proceso legal.\n\n • Necesitamos compartir su información con proveedores de servicios que nos ayudan a proporcionar nuestra aplicación y sus funciones.\n\n  • No cumple con nuestros términos de compromiso.\n'),
          _buildItemView(
              '¿Por qué la aplicación solicita el permiso QUERY_ALL_PACKAGES?',
              'Algunas de nuestras aplicaciones (especialmente la aplicación Antivirus Virus Cleaner) buscan virus y limpian datos inútiles de todas las aplicaciones. Por lo tanto, los dispositivos Android con nivel API 30 o Android 11 o superior requieren este permiso para buscar todas las aplicaciones en el dispositivo.Los servicios no están destinados a menores de 13 años. No recopilamos intencionalmente información de identificación personal de niños menores de 13 años. Si nos damos cuenta de que un niño menor de 13 años me ha proporcionado información personal, eliminarlo de nuestros servidores inmediatamente. Si es padre o tutor y sabe que su hijo nos ha proporcionado información personal, comuníquese conmigo para que podamos tomar las medidas necesarias.\n'),
          _buildItemView('Protección de su información personal',
              'Tomamos medidas razonables para proteger la seguridad y confidencialidad de su información personal. Hemos implementado medidas técnicas y organizativas para evitar el acceso, uso o divulgación no autorizados de su información personal.\n\nSus derechos y opciones\n\nTiene derecho a acceder, corregir o eliminar la información personal que tenemos. También puede solicitar que restrinjamos el procesamiento de su información personal o la transfiramos a otra organización.\n\n Uso y procesamiento de la información recopilada\n\n Al procesar información personal, actuamos como controladores y procesadores de datos. A menos que hayamos celebrado un acuerdo de procesamiento de datos con usted, en cuyo caso usted será el responsable del tratamiento y nosotros el encargado del tratamiento.\n\n Nuestro papel también puede variar dependiendo de la situación específica que involucra información personal. Actuamos como controlador de datos cuando le solicitamos que envíe información personal necesaria para garantizar su acceso y uso de aplicaciones y servicios móviles. En este caso, somos el responsable del tratamiento porque determinamos los fines y medios del procesamiento de la información personal.\n\n Actuamos como procesador de datos cuando envía información personal a través de aplicaciones y servicios móviles. No poseemos, controlamos ni tomamos decisiones sobre la información personal enviada y dicha información personal se procesa únicamente de acuerdo con sus instrucciones.\n\n En este caso, actúa como responsable del tratamiento el usuario que ha facilitado los datos personales.\n\n  Para proporcionarle aplicaciones y servicios móviles, o para cumplir con obligaciones legales, es posible que necesitemos recopilar y utilizar cierta información personal. Si no proporciona la información que solicitamos, es posible que no podamos brindarle el producto o servicio solicitado, y cualquier información que recopilemos de usted podrá usarse para los siguientes propósitos:\n\n Crear y administrar cuentas de usuario\n\n Enviar información de gestión\n\n  Solicitar comentarios de los usuarios\n\n  Ejecutar y operar aplicaciones y servicios móviles.\n\n  Recuperación de préstamos\n\n El procesamiento de su información personal depende de cómo interactúa con las aplicaciones y servicios móviles, su ubicación en el mundo y si se aplica uno de los siguientes: (i) ha aceptado uno o más de los propósitos específicos; (ii) proporcionar la información necesaria para ejecutar un acuerdo con usted y/o cualquier obligación precontractual; (iii) el procesamiento es necesario para cumplir con sus obligaciones legales; (iv) el procesamiento está relacionado con el interés público o el ejercicio de poderes oficiales que se nos han conferido y el desempeño de las tareas relacionadas con; (v) el procesamiento es necesario para los intereses legítimos que perseguimos nosotros o un tercero.\n\nTenga en cuenta que, según determinadas leyes, es posible que se nos permita procesar información hasta que usted se oponga a dicho procesamiento y opte por no hacerlo sin depender del consentimiento ni de ninguna otra base legal. En cualquier caso, estaremos encantados de aclarar la base jurídica específica aplicable al procesamiento, en particular si el suministro de información personal es un requisito legal o contractual o si es necesario para celebrar un contrato.\n\n Cambio de política\n\n Cualquier información recopilada está sujeta a las políticas vigentes en el momento en que se recopiló dicha información. Sin embargo, podemos revisar esta política de vez en cuando. Si realizamos cambios en nuestra Política de Privacidad, le proporcionaremos otras formas de notificación de modificaciones o actualizaciones según corresponda. Su uso continuado de nuestra aplicación o servicio después de la publicación de los cambios significará su aceptación de dichos cambios.\n\n Contáctanos: "Aplicaciones RapiCrédito"\n\n Si tiene alguna pregunta sobre esta política, puede contactarnos al correo electrónico: nice@rapicreditoco.com\n\n Dirección: Cra. 111 #142a-37, Bogotá, colombia')
        ],
      ),
    ));
  }

  Widget _buildItemView(String title, String content) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
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
      margin: const EdgeInsets.only(top: 10.0, left: 6.0, right: 6.0),
      decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 24.0, right: 24.0, bottom: 18.0),
            child: RichText(
                text: TextSpan(
                    text: Strings.autoLineString('Lea atentamente todas las '),
                    style: const TextStyle(
                        fontSize: 15.0, color: Color(0xff666666)),
                    children: <TextSpan>[
                  TextSpan(
                      text: Strings.autoLineString('Aviso de Privacidad.'),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          color: Color(0xff6B8817)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.goToWebViewPage('Aviso de Privacidad',
                              'https://test.rapicreditoco.com/rapicreditos/privacy.html');
                        }),
                  TextSpan(
                      text: Strings.autoLineString('y'),
                      style: const TextStyle(
                          fontSize: 15.0, color: Color(0xff666666))),
                  TextSpan(
                      text: Strings.autoLineString('Terminos y Condiciones'),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          color: Color(0xff6B8817)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.goToWebViewPage('Terminos y Condiciones',
                              'https://test.rapicreditoco.com/rapicreditos/Term.html');
                        }),
                ])),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 25.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: controller.exitApp,
                    minHeight: 46.0,
                    backgroundColor: Colors.transparent,
                    disabledBackgroundColor: Colors.transparent,
                    fontSize: 15.0,
                    radius: 8.0,
                    text: 'RECHAZO',
                    textColor: const Color(0xff333333),
                    fontWeight: FontWeight.bold,
                    side:
                        const BorderSide(color: Color(0xff333333), width: 1.0),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CustomButton(
                      onPressed: controller.applyPermission,
                      minHeight: 46.0,
                      backgroundColor: const Color(0xffB8EF17),
                      disabledBackgroundColor: const Color(0xffB8EF17),
                      fontSize: 15.0,
                      radius: 8.0,
                      text: 'ACEPTOY\nCONTINUAR',
                      textColor: const Color(0xff333333),
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
