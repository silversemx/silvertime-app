// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(count) =>
      "${Intl.plural(count, one: 'Hace 1 día', other: 'Hace ${count} días')}";

  static String m1(selected) => "Eliminar seleccionado(s): ${selected}";

  static String m2(name) => "¡Hola de nuevo!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutAstra":
            MessageLookupByLibrary.simpleMessage("Sobre Astra Zeneca"),
        "actions": MessageLookupByLibrary.simpleMessage("Acciones"),
        "activeUsers": MessageLookupByLibrary.simpleMessage("Usuarios Activos"),
        "address": MessageLookupByLibrary.simpleMessage("Dirección"),
        "alias": MessageLookupByLibrary.simpleMessage("Álias"),
        "anErrorOcurred":
            MessageLookupByLibrary.simpleMessage("Un error ha ocurrido"),
        "areYouSure": MessageLookupByLibrary.simpleMessage("¿Estás seguro?"),
        "camera": MessageLookupByLibrary.simpleMessage("Cámara"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "captureAnotherImage":
            MessageLookupByLibrary.simpleMessage("Captura otra foto"),
        "captureImage":
            MessageLookupByLibrary.simpleMessage("Captura una foto"),
        "change": MessageLookupByLibrary.simpleMessage("Cambiar"),
        "clearSelection":
            MessageLookupByLibrary.simpleMessage("Limpiar selección"),
        "cookiesAdvice":
            MessageLookupByLibrary.simpleMessage("Aviso de Cookies"),
        "create": MessageLookupByLibrary.simpleMessage("Crear"),
        "createDisk": MessageLookupByLibrary.simpleMessage("Crear disco"),
        "createMachine":
            MessageLookupByLibrary.simpleMessage("Crear Computadora"),
        "createNetwork": MessageLookupByLibrary.simpleMessage("Crear Red"),
        "createReport": MessageLookupByLibrary.simpleMessage("Crear Reporte"),
        "createService": MessageLookupByLibrary.simpleMessage("Crear Servicio"),
        "createUser": MessageLookupByLibrary.simpleMessage("Crear Usuario"),
        "currentRange": MessageLookupByLibrary.simpleMessage("Rango Actual"),
        "dailyAccess":
            MessageLookupByLibrary.simpleMessage("Acesso Diario Promedio"),
        "days": MessageLookupByLibrary.simpleMessage("Días"),
        "daysAgo": m0,
        "deleteSelected": m1,
        "deletingDisks":
            MessageLookupByLibrary.simpleMessage("Eliminando Discos"),
        "deletingMachines":
            MessageLookupByLibrary.simpleMessage("Eliminando Computadoras"),
        "deletingMaintenances":
            MessageLookupByLibrary.simpleMessage("Eliminando mantenimientos"),
        "deletingNetworks":
            MessageLookupByLibrary.simpleMessage("Eliminando redes"),
        "deletingServiceTags":
            MessageLookupByLibrary.simpleMessage("Eliminando Tags"),
        "deletingServices":
            MessageLookupByLibrary.simpleMessage("Eliminando servicios"),
        "deletingUsers": MessageLookupByLibrary.simpleMessage("Deleting users"),
        "description": MessageLookupByLibrary.simpleMessage("Descripción"),
        "deviceName": MessageLookupByLibrary.simpleMessage("Nombre del equipo"),
        "disk": MessageLookupByLibrary.simpleMessage("Disco"),
        "diskSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Disco correctamente creado"),
        "diskSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Disco correctamente eliminado"),
        "diskSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Disco correctamente actualizado"),
        "diskType_balanced": MessageLookupByLibrary.simpleMessage("Balanceado"),
        "diskType_extreme": MessageLookupByLibrary.simpleMessage("Extremo"),
        "diskType_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "diskType_ssd": MessageLookupByLibrary.simpleMessage("SSD"),
        "diskType_standard": MessageLookupByLibrary.simpleMessage("Estandar"),
        "disks": MessageLookupByLibrary.simpleMessage("Discos"),
        "editDisk": MessageLookupByLibrary.simpleMessage("Editar disco"),
        "editMachine":
            MessageLookupByLibrary.simpleMessage("Editar Computadora"),
        "editNetwork": MessageLookupByLibrary.simpleMessage("Editar Red"),
        "editReport": MessageLookupByLibrary.simpleMessage("Editar Reporte"),
        "editService": MessageLookupByLibrary.simpleMessage("Editar Servicio"),
        "editUser": MessageLookupByLibrary.simpleMessage("Editar Usuario"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emptyFieldValidation":
            MessageLookupByLibrary.simpleMessage("Campo vacio"),
        "end": MessageLookupByLibrary.simpleMessage("Fin"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "error_400": MessageLookupByLibrary.simpleMessage(
            "Los datos enviados no fueron validados correctamente"),
        "error_401": MessageLookupByLibrary.simpleMessage("No autorizado"),
        "error_404": MessageLookupByLibrary.simpleMessage(
            "No se ha encontrado información"),
        "error_500": MessageLookupByLibrary.simpleMessage(
            "Algo inesperado pasó, reintenta más tarde"),
        "error_502": MessageLookupByLibrary.simpleMessage(
            "El servidor se encuentra caido o no responde, reintenta en unos minutos"),
        "error_504": MessageLookupByLibrary.simpleMessage(
            "El tiempo de espera se ha sobrepasado, revisa tu conexión de internet"),
        "execution": MessageLookupByLibrary.simpleMessage("Ejecución"),
        "executionExit_error": MessageLookupByLibrary.simpleMessage("Error"),
        "executionExit_interruption":
            MessageLookupByLibrary.simpleMessage("Interrupción"),
        "executionExit_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "executionExit_other": MessageLookupByLibrary.simpleMessage("Otro"),
        "executionExit_success": MessageLookupByLibrary.simpleMessage("Éxito"),
        "executionScope_global": MessageLookupByLibrary.simpleMessage("Global"),
        "executionScope_instance":
            MessageLookupByLibrary.simpleMessage("Instancia"),
        "executionScope_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "executionScope_other": MessageLookupByLibrary.simpleMessage("Otro"),
        "executionScope_service":
            MessageLookupByLibrary.simpleMessage("Servicio"),
        "executionType_live": MessageLookupByLibrary.simpleMessage("Live"),
        "executionType_maintenance":
            MessageLookupByLibrary.simpleMessage("Mantenimiento"),
        "executionType_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "executionType_other": MessageLookupByLibrary.simpleMessage("Otro"),
        "executionType_test": MessageLookupByLibrary.simpleMessage("Pruebas"),
        "exit": MessageLookupByLibrary.simpleMessage("Salida"),
        "filter": MessageLookupByLibrary.simpleMessage("Filtrar por"),
        "filters": MessageLookupByLibrary.simpleMessage("Filtros"),
        "format": MessageLookupByLibrary.simpleMessage("Formato"),
        "gallery": MessageLookupByLibrary.simpleMessage("Galería"),
        "generateReports": MessageLookupByLibrary.simpleMessage(
            "¡Genera reportes desde tu celular 📱, haz saber a todos que algo ha ocurrido de manera inmediata!"),
        "history": MessageLookupByLibrary.simpleMessage("Historial"),
        "home": MessageLookupByLibrary.simpleMessage("inicio"),
        "hour": MessageLookupByLibrary.simpleMessage("Hora"),
        "hrs24Format": MessageLookupByLibrary.simpleMessage("formato 24hrs"),
        "image": MessageLookupByLibrary.simpleMessage("Imagen"),
        "inAuthorization":
            MessageLookupByLibrary.simpleMessage("En la autorización"),
        "inDashboard": MessageLookupByLibrary.simpleMessage("en el Dashboard"),
        "inServer": MessageLookupByLibrary.simpleMessage("en el servidor"),
        "instance": MessageLookupByLibrary.simpleMessage("Instancia"),
        "instanceInterruptions":
            MessageLookupByLibrary.simpleMessage("Instance Interruptions"),
        "instances": MessageLookupByLibrary.simpleMessage("Instancias"),
        "interruptions": MessageLookupByLibrary.simpleMessage("Interrupciones"),
        "invalid": MessageLookupByLibrary.simpleMessage("Inválido"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Email Invalido"),
        "knowOverviewText": MessageLookupByLibrary.simpleMessage(
            "Obten información completa de caídas, interrupciones y mantenimientos, todo en un mismo lugar"),
        "legal": MessageLookupByLibrary.simpleMessage("Legal"),
        "limit": MessageLookupByLibrary.simpleMessage("Servicios por página"),
        "login": MessageLookupByLibrary.simpleMessage("Iniciar Sesión"),
        "machine": MessageLookupByLibrary.simpleMessage("Instancia"),
        "machineConfigurationUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage(
                "La configuración de la máquina fue actualizada correctamente"),
        "machineSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "La maquina fue creada correctamente"),
        "machineSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "La maquina fue eliminada correctamente"),
        "machineSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "La maquina fue actualizada correctamente"),
        "machineType_cloud": MessageLookupByLibrary.simpleMessage("Nube"),
        "machineType_local": MessageLookupByLibrary.simpleMessage("Local"),
        "machineType_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "machines": MessageLookupByLibrary.simpleMessage("Maquinas"),
        "maintenance": MessageLookupByLibrary.simpleMessage("Mantenimiento"),
        "maintenanceSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Mantenimiento creado correctamente"),
        "maintenanceSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Mantenimiento eliminado correctamente"),
        "maintenanceSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Mantenimiento actualizado correctamente"),
        "maintenanceTime_free":
            MessageLookupByLibrary.simpleMessage("Indefinido"),
        "maintenanceTime_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "maintenanceTime_other": MessageLookupByLibrary.simpleMessage("Otro"),
        "maintenanceTime_range": MessageLookupByLibrary.simpleMessage("Rango"),
        "maintenances": MessageLookupByLibrary.simpleMessage("Mantenimientos"),
        "majorInterruptions":
            MessageLookupByLibrary.simpleMessage("Interrupciones mayores"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutos"),
        "missingValue": MessageLookupByLibrary.simpleMessage("Campo vacío"),
        "mobile": MessageLookupByLibrary.simpleMessage("Móvil"),
        "monthlyAccess":
            MessageLookupByLibrary.simpleMessage("Acceso Mensual Promedio"),
        "name": MessageLookupByLibrary.simpleMessage("Nombre"),
        "network": MessageLookupByLibrary.simpleMessage("Red"),
        "networkSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Red creada correctamente"),
        "networkSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage("Red eliminada correctamente"),
        "networkSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Red actualizada correctamente"),
        "networking": MessageLookupByLibrary.simpleMessage("Networking"),
        "networks": MessageLookupByLibrary.simpleMessage("Redes"),
        "newReport": MessageLookupByLibrary.simpleMessage("Nuevo Reporte"),
        "noInformation":
            MessageLookupByLibrary.simpleMessage("No hay información"),
        "noInstances":
            MessageLookupByLibrary.simpleMessage("No hay instancias"),
        "noServices": MessageLookupByLibrary.simpleMessage("No hay servicios"),
        "notSelected": MessageLookupByLibrary.simpleMessage(
            "Por favor selecciona una opción"),
        "okay": MessageLookupByLibrary.simpleMessage("Okay"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "path": MessageLookupByLibrary.simpleMessage("Path"),
        "pickAnImage":
            MessageLookupByLibrary.simpleMessage("Selecciona una imagen"),
        "pickAnotherImage":
            MessageLookupByLibrary.simpleMessage("Selecciona otra imagen"),
        "platformOverview":
            MessageLookupByLibrary.simpleMessage("Resumen de plataforma"),
        "postedBy": MessageLookupByLibrary.simpleMessage("Publicado por"),
        "priority": MessageLookupByLibrary.simpleMessage("Prioridad"),
        "programmedBy": MessageLookupByLibrary.simpleMessage("Programada por"),
        "progress": MessageLookupByLibrary.simpleMessage("Progreso"),
        "receiveNotifications": MessageLookupByLibrary.simpleMessage(
            "¡Recibe notificaciones cada que una caída haya ocurrido, un mantenimiento haya sido programado o un servicio haya cambiado de status!"),
        "region": MessageLookupByLibrary.simpleMessage("Región"),
        "removeTagFilters":
            MessageLookupByLibrary.simpleMessage("Remover filtros de tags"),
        "reportPriority_none": MessageLookupByLibrary.simpleMessage("Ninguna"),
        "reportPriority_one": MessageLookupByLibrary.simpleMessage("P1"),
        "reportPriority_three": MessageLookupByLibrary.simpleMessage("P3"),
        "reportPriority_two": MessageLookupByLibrary.simpleMessage("P2"),
        "reportPriority_zero": MessageLookupByLibrary.simpleMessage("Cero"),
        "reportSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Reporte creado correctamente"),
        "reportSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Reporte eliminado correctamente"),
        "reportSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Reporte actualizado correctamente"),
        "reportType_external": MessageLookupByLibrary.simpleMessage("Externo"),
        "reportType_internal": MessageLookupByLibrary.simpleMessage("Interno"),
        "reportType_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "reportType_other": MessageLookupByLibrary.simpleMessage("Otro"),
        "reports": MessageLookupByLibrary.simpleMessage("Reportes"),
        "requiredText": MessageLookupByLibrary.simpleMessage("Requerido"),
        "resourceType_interruptions":
            MessageLookupByLibrary.simpleMessage("Interrupciones"),
        "resourceType_maintenance":
            MessageLookupByLibrary.simpleMessage("Mantenimientos"),
        "resourceType_none":
            MessageLookupByLibrary.simpleMessage("Selecciona Uno"),
        "resourceType_reports":
            MessageLookupByLibrary.simpleMessage("Reportes"),
        "resourceType_services":
            MessageLookupByLibrary.simpleMessage("Servicios"),
        "resources": MessageLookupByLibrary.simpleMessage("recursos"),
        "role": MessageLookupByLibrary.simpleMessage("Rol"),
        "scope": MessageLookupByLibrary.simpleMessage("Acance"),
        "selectOne": MessageLookupByLibrary.simpleMessage("Selecciona Uno"),
        "service": MessageLookupByLibrary.simpleMessage("Servicio"),
        "serviceInstanceType_cloud":
            MessageLookupByLibrary.simpleMessage("Nube"),
        "serviceInstanceType_local":
            MessageLookupByLibrary.simpleMessage("Local"),
        "serviceInstanceType_none":
            MessageLookupByLibrary.simpleMessage("Ninguno"),
        "serviceInstanceType_other":
            MessageLookupByLibrary.simpleMessage("Otros"),
        "serviceSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Servicio creado correctamente!"),
        "serviceSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Servicio eliminado correctamente"),
        "serviceSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Servicio actualizado correctamente"),
        "serviceTagSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Tag creada correctamente"),
        "serviceTagSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage("Tag eliminada correctamente"),
        "serviceTagSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Tag actualizada correctamente"),
        "serviceTags":
            MessageLookupByLibrary.simpleMessage("Etiquetas de servicios"),
        "services": MessageLookupByLibrary.simpleMessage("Servicios"),
        "servicios": MessageLookupByLibrary.simpleMessage("Servicios"),
        "size": MessageLookupByLibrary.simpleMessage("Tamaño"),
        "solution": MessageLookupByLibrary.simpleMessage("Solución"),
        "start": MessageLookupByLibrary.simpleMessage("Inicio"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "status_active": MessageLookupByLibrary.simpleMessage("Activo"),
        "status_available": MessageLookupByLibrary.simpleMessage("Disponible"),
        "status_complete": MessageLookupByLibrary.simpleMessage("Completo"),
        "status_completed": MessageLookupByLibrary.simpleMessage("Completado"),
        "status_created": MessageLookupByLibrary.simpleMessage("Creada"),
        "status_deprecated": MessageLookupByLibrary.simpleMessage("Depreciada"),
        "status_detected": MessageLookupByLibrary.simpleMessage("Detectado"),
        "status_disabled":
            MessageLookupByLibrary.simpleMessage("Deshabilitada"),
        "status_done": MessageLookupByLibrary.simpleMessage("Terminado"),
        "status_down": MessageLookupByLibrary.simpleMessage("Abajo"),
        "status_ended": MessageLookupByLibrary.simpleMessage("Terminada"),
        "status_inactive": MessageLookupByLibrary.simpleMessage("Inactivo"),
        "status_investigating":
            MessageLookupByLibrary.simpleMessage("Investigando"),
        "status_maintenance":
            MessageLookupByLibrary.simpleMessage("Mantenimiento"),
        "status_monitoring":
            MessageLookupByLibrary.simpleMessage("Monitoreando"),
        "status_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "status_progress": MessageLookupByLibrary.simpleMessage("En Proceso"),
        "status_ready": MessageLookupByLibrary.simpleMessage("Listo"),
        "status_removed": MessageLookupByLibrary.simpleMessage("Eliminada"),
        "status_solved": MessageLookupByLibrary.simpleMessage("Solucionado"),
        "status_stopped": MessageLookupByLibrary.simpleMessage("Detenido"),
        "status_viewed": MessageLookupByLibrary.simpleMessage("Visto"),
        "status_waiting": MessageLookupByLibrary.simpleMessage("Esperando"),
        "status_working": MessageLookupByLibrary.simpleMessage("Trabajando"),
        "storage": MessageLookupByLibrary.simpleMessage("Almacenamiento"),
        "storageGoal_backup": MessageLookupByLibrary.simpleMessage("Respaldo"),
        "storageGoal_cache": MessageLookupByLibrary.simpleMessage("Caché"),
        "storageGoal_general": MessageLookupByLibrary.simpleMessage("General"),
        "storageGoal_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "storageGoal_output": MessageLookupByLibrary.simpleMessage("Salidas"),
        "storageGoal_recon":
            MessageLookupByLibrary.simpleMessage("Reconocimiento"),
        "storageGoal_temp": MessageLookupByLibrary.simpleMessage("Temporal"),
        "storageGoal_uploads": MessageLookupByLibrary.simpleMessage("Subidas"),
        "storageScope_general": MessageLookupByLibrary.simpleMessage("General"),
        "storageScope_organization":
            MessageLookupByLibrary.simpleMessage("Organización"),
        "storageScope_project":
            MessageLookupByLibrary.simpleMessage("Proyecto"),
        "storageScope_service":
            MessageLookupByLibrary.simpleMessage("Servicio"),
        "storageSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "El almacenamiento fue creado correctamente"),
        "storageSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "El almacenamiento fue eliminado correctamente"),
        "storageSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "El almacenamiento fue actualizado correctamente"),
        "storages": MessageLookupByLibrary.simpleMessage("Almacenamientos"),
        "success": MessageLookupByLibrary.simpleMessage("Exito"),
        "system": MessageLookupByLibrary.simpleMessage("sistema"),
        "tapToRemoveTag":
            MessageLookupByLibrary.simpleMessage("*Tap para quitar tags"),
        "the": MessageLookupByLibrary.simpleMessage("La"),
        "thisActionCantBeUndone": MessageLookupByLibrary.simpleMessage(
            "¡Esta acción no se puede deshacer!"),
        "tier": MessageLookupByLibrary.simpleMessage("Tier"),
        "time": MessageLookupByLibrary.simpleMessage("Tiempo"),
        "title": MessageLookupByLibrary.simpleMessage("Título"),
        "tool": MessageLookupByLibrary.simpleMessage("herramienta"),
        "type": MessageLookupByLibrary.simpleMessage("Tipo"),
        "updateStatus":
            MessageLookupByLibrary.simpleMessage("Actualizar Status"),
        "userInformation":
            MessageLookupByLibrary.simpleMessage("User information"),
        "userStatus_active": MessageLookupByLibrary.simpleMessage("Activo"),
        "userStatus_blocked": MessageLookupByLibrary.simpleMessage("Bloqueado"),
        "userStatus_inactive": MessageLookupByLibrary.simpleMessage("Inactivo"),
        "userStatus_none": MessageLookupByLibrary.simpleMessage("Ninguno"),
        "userStatus_removed": MessageLookupByLibrary.simpleMessage("Eliminado"),
        "userSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Usuario creado correctamente"),
        "userSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Usuario actualizado correctamente"),
        "username": MessageLookupByLibrary.simpleMessage("Nombre de usuario"),
        "users": MessageLookupByLibrary.simpleMessage("usuarios"),
        "value": MessageLookupByLibrary.simpleMessage("Valor"),
        "view": MessageLookupByLibrary.simpleMessage("Vista"),
        "web": MessageLookupByLibrary.simpleMessage("Web"),
        "weeklyAccess":
            MessageLookupByLibrary.simpleMessage("Acceso Semanal Promedio"),
        "welcomeBack": m2,
        "welcomeBackNoName":
            MessageLookupByLibrary.simpleMessage("¡Bienvenido!"),
        "welcomeText1": MessageLookupByLibrary.simpleMessage(
            "tú necesitabas para saber todo sobre el"),
        "welcomeTo": MessageLookupByLibrary.simpleMessage("¡Bienvenido a"),
        "workerInstanceSpeed_background":
            MessageLookupByLibrary.simpleMessage("Background"),
        "workerInstanceSpeed_backup":
            MessageLookupByLibrary.simpleMessage("Backup"),
        "workerInstanceSpeed_common":
            MessageLookupByLibrary.simpleMessage("Común"),
        "workerInstanceSpeed_general":
            MessageLookupByLibrary.simpleMessage("General"),
        "workerInstanceSpeed_none":
            MessageLookupByLibrary.simpleMessage("Ninguno"),
        "workerInstanceSpeed_priority":
            MessageLookupByLibrary.simpleMessage("Prioritario"),
        "workerResourceSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage(
                "Recurso de Worker creado correctamente"),
        "workerResourceSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage(
                "Recurso de Worker eliminado correctamente"),
        "workerResourceSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage(
                "Recurso de Worker actualizado correctamente"),
        "workerResources":
            MessageLookupByLibrary.simpleMessage("Recursos de worker"),
        "workerSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Worker creado correctamente"),
        "workerSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Worker eliminado correctamente"),
        "workerSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Worker actualizado correctamente"),
        "workers": MessageLookupByLibrary.simpleMessage("Workers"),
        "yourAccount": MessageLookupByLibrary.simpleMessage("Tu cuenta"),
        "zone": MessageLookupByLibrary.simpleMessage("Zona")
      };
}
