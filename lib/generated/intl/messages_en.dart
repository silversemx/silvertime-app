// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, one: '1 Day ago', other: '${count} Days ago')}";

  static String m1(selected) => "Delete Selected: ${selected}";

  static String m2(name) => "Welcome Back, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutAstra": MessageLookupByLibrary.simpleMessage("About AstraZeneca"),
        "actions": MessageLookupByLibrary.simpleMessage("Actions"),
        "activeUsers": MessageLookupByLibrary.simpleMessage("Active Users"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "alias": MessageLookupByLibrary.simpleMessage("Alias"),
        "anErrorOcurred":
            MessageLookupByLibrary.simpleMessage("An error ocurred"),
        "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "captureAnotherImage":
            MessageLookupByLibrary.simpleMessage("Capture another picture"),
        "captureImage": MessageLookupByLibrary.simpleMessage("Capture picture"),
        "change": MessageLookupByLibrary.simpleMessage("Change"),
        "checkServiceStatus": MessageLookupByLibrary.simpleMessage(
            "Here you can check service status from your pocket"),
        "clearSelection":
            MessageLookupByLibrary.simpleMessage("Clear selection"),
        "cookiesAdvice":
            MessageLookupByLibrary.simpleMessage("Cookies advertisement"),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "createDisk": MessageLookupByLibrary.simpleMessage("Create Disk"),
        "createMachine": MessageLookupByLibrary.simpleMessage("Create Machine"),
        "createMaintenance":
            MessageLookupByLibrary.simpleMessage("Create Maintenance"),
        "createNetwork": MessageLookupByLibrary.simpleMessage("Create Network"),
        "createReport": MessageLookupByLibrary.simpleMessage("Create Report"),
        "createService": MessageLookupByLibrary.simpleMessage("Create Service"),
        "createServiceTag":
            MessageLookupByLibrary.simpleMessage("Create Service Tag"),
        "createUser": MessageLookupByLibrary.simpleMessage("Create User"),
        "currentRange": MessageLookupByLibrary.simpleMessage("Current Range"),
        "dailyAccess":
            MessageLookupByLibrary.simpleMessage("Average Daily Access"),
        "days": MessageLookupByLibrary.simpleMessage("Days"),
        "daysAgo": m0,
        "deleteSelected": m1,
        "deletingDisks": MessageLookupByLibrary.simpleMessage("Deleting disks"),
        "deletingMachines":
            MessageLookupByLibrary.simpleMessage("Deleting Machines"),
        "deletingMaintenances":
            MessageLookupByLibrary.simpleMessage("Deleting Maintenances"),
        "deletingNetworks":
            MessageLookupByLibrary.simpleMessage("Deleting Networks"),
        "deletingServiceTags":
            MessageLookupByLibrary.simpleMessage("Deleting Service Tags"),
        "deletingServices":
            MessageLookupByLibrary.simpleMessage("Deleting services"),
        "deletingUsers": MessageLookupByLibrary.simpleMessage("Deleting users"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "deviceName": MessageLookupByLibrary.simpleMessage("Device Name"),
        "disk": MessageLookupByLibrary.simpleMessage("Disk"),
        "diskSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Disk successfully created"),
        "diskSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage("Disk successfully deleted"),
        "diskSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage("Disk successfully updated"),
        "diskType_balanced": MessageLookupByLibrary.simpleMessage("Balanced"),
        "diskType_extreme": MessageLookupByLibrary.simpleMessage("Extreme"),
        "diskType_none": MessageLookupByLibrary.simpleMessage("None"),
        "diskType_ssd": MessageLookupByLibrary.simpleMessage("SSD"),
        "diskType_standard": MessageLookupByLibrary.simpleMessage("Standard"),
        "disks": MessageLookupByLibrary.simpleMessage("Disks"),
        "editDisk": MessageLookupByLibrary.simpleMessage("Edit Disk"),
        "editMachine": MessageLookupByLibrary.simpleMessage("Edit Machine"),
        "editMaintenance":
            MessageLookupByLibrary.simpleMessage("Edit Maintenance"),
        "editNetwork": MessageLookupByLibrary.simpleMessage("Edit Network"),
        "editReport": MessageLookupByLibrary.simpleMessage("Edit Report"),
        "editService": MessageLookupByLibrary.simpleMessage("Edit Service"),
        "editServiceTag":
            MessageLookupByLibrary.simpleMessage("Edit Service Tag"),
        "editUser": MessageLookupByLibrary.simpleMessage("Edit User"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emptyFieldValidation":
            MessageLookupByLibrary.simpleMessage("Empty field validation"),
        "end": MessageLookupByLibrary.simpleMessage("End"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "error_400": MessageLookupByLibrary.simpleMessage(
            "The data wasn\'t validated correctly"),
        "error_401": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "error_404":
            MessageLookupByLibrary.simpleMessage("No information was found"),
        "error_500": MessageLookupByLibrary.simpleMessage(
            "Something unexpected happened, retry later"),
        "error_502": MessageLookupByLibrary.simpleMessage(
            "Server is down or not responding, wait a few minutes"),
        "error_504": MessageLookupByLibrary.simpleMessage(
            "Timeout reached, check your internet connection"),
        "execution": MessageLookupByLibrary.simpleMessage("Execution"),
        "executionExit_error": MessageLookupByLibrary.simpleMessage("Error"),
        "executionExit_interruption":
            MessageLookupByLibrary.simpleMessage("Interruption"),
        "executionExit_none": MessageLookupByLibrary.simpleMessage("None"),
        "executionExit_other": MessageLookupByLibrary.simpleMessage("Other"),
        "executionExit_success":
            MessageLookupByLibrary.simpleMessage("Success"),
        "executionScope_global": MessageLookupByLibrary.simpleMessage("Global"),
        "executionScope_instance":
            MessageLookupByLibrary.simpleMessage("Instance"),
        "executionScope_none": MessageLookupByLibrary.simpleMessage("None"),
        "executionScope_other": MessageLookupByLibrary.simpleMessage("Other"),
        "executionScope_service":
            MessageLookupByLibrary.simpleMessage("Service"),
        "executionType_live": MessageLookupByLibrary.simpleMessage("Live"),
        "executionType_maintenance":
            MessageLookupByLibrary.simpleMessage("Maintenance"),
        "executionType_none": MessageLookupByLibrary.simpleMessage("None"),
        "executionType_other": MessageLookupByLibrary.simpleMessage("Other"),
        "executionType_test": MessageLookupByLibrary.simpleMessage("Test"),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "filter": MessageLookupByLibrary.simpleMessage("Filter by"),
        "filters": MessageLookupByLibrary.simpleMessage("Filters"),
        "format": MessageLookupByLibrary.simpleMessage("Format"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "generateReports": MessageLookupByLibrary.simpleMessage(
            "Generate reports from your phone 📱, let everyone know something has happened right away!"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "hour": MessageLookupByLibrary.simpleMessage("Hour"),
        "hrs24Format": MessageLookupByLibrary.simpleMessage("24hrs format"),
        "image": MessageLookupByLibrary.simpleMessage("Image"),
        "inAuthorization": MessageLookupByLibrary.simpleMessage("in auth"),
        "inDashboard": MessageLookupByLibrary.simpleMessage("in Dashboard"),
        "inServer": MessageLookupByLibrary.simpleMessage("in server"),
        "instance": MessageLookupByLibrary.simpleMessage("Instance"),
        "instanceInterruptions":
            MessageLookupByLibrary.simpleMessage("Instance Interruptions"),
        "instances": MessageLookupByLibrary.simpleMessage("Instancias"),
        "interruptions": MessageLookupByLibrary.simpleMessage("Interruptions"),
        "invalid": MessageLookupByLibrary.simpleMessage("Invalid"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid Email"),
        "knowOverviewText": MessageLookupByLibrary.simpleMessage(
            "Get full information of major outages, interruptions and maintenances of the system, all in the same place"),
        "lastname": MessageLookupByLibrary.simpleMessage("Last name"),
        "legal": MessageLookupByLibrary.simpleMessage("Legal"),
        "limit": MessageLookupByLibrary.simpleMessage("Services per Page"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "machine": MessageLookupByLibrary.simpleMessage("Machine"),
        "machineConfigurationUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage(
                "Machine configuration updated successfully"),
        "machineSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "The Machine was successfully created"),
        "machineSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "The Machine was successfully deleted"),
        "machineSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "The Machine was successfully updated"),
        "machineType_cloud": MessageLookupByLibrary.simpleMessage("Cloud"),
        "machineType_local": MessageLookupByLibrary.simpleMessage("Local"),
        "machineType_none": MessageLookupByLibrary.simpleMessage("None"),
        "machines": MessageLookupByLibrary.simpleMessage("Machines"),
        "maintenance": MessageLookupByLibrary.simpleMessage("Maintenance"),
        "maintenanceSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Maintenance Successfully Created"),
        "maintenanceSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Maintenance Successfully Deleted"),
        "maintenanceSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Maintenance Successfully Updated"),
        "maintenanceTime_free": MessageLookupByLibrary.simpleMessage("Free"),
        "maintenanceTime_none": MessageLookupByLibrary.simpleMessage("None"),
        "maintenanceTime_other": MessageLookupByLibrary.simpleMessage("Other"),
        "maintenanceTime_range": MessageLookupByLibrary.simpleMessage("Range"),
        "maintenances": MessageLookupByLibrary.simpleMessage("Maintenances"),
        "majorInterruptions":
            MessageLookupByLibrary.simpleMessage("Major Interruptions"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutes"),
        "missingValue": MessageLookupByLibrary.simpleMessage("Missing value"),
        "mobile": MessageLookupByLibrary.simpleMessage("Mobile"),
        "monthlyAccess":
            MessageLookupByLibrary.simpleMessage("Average Monthly Access"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "network": MessageLookupByLibrary.simpleMessage("Network"),
        "networkSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Network successfully created"),
        "networkSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Network successfully deleted"),
        "networkSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Network successfully updated"),
        "networkType_none": MessageLookupByLibrary.simpleMessage("None"),
        "networkType_premium": MessageLookupByLibrary.simpleMessage("Premium"),
        "networkType_standard":
            MessageLookupByLibrary.simpleMessage("Standard"),
        "networking": MessageLookupByLibrary.simpleMessage("Networking"),
        "networks": MessageLookupByLibrary.simpleMessage("Networks"),
        "newReport": MessageLookupByLibrary.simpleMessage("New report"),
        "noInformation":
            MessageLookupByLibrary.simpleMessage("No information was found"),
        "noInstances":
            MessageLookupByLibrary.simpleMessage("There are no instances"),
        "noServices":
            MessageLookupByLibrary.simpleMessage("There are no services"),
        "notSelected":
            MessageLookupByLibrary.simpleMessage("An item must be selected"),
        "okay": MessageLookupByLibrary.simpleMessage("Okay"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "path": MessageLookupByLibrary.simpleMessage("Path"),
        "pickAnImage": MessageLookupByLibrary.simpleMessage("Pick an image"),
        "pickAnotherImage":
            MessageLookupByLibrary.simpleMessage("Pick another image"),
        "platformOverview":
            MessageLookupByLibrary.simpleMessage("Platform overview"),
        "postedBy": MessageLookupByLibrary.simpleMessage("Posted By"),
        "priority": MessageLookupByLibrary.simpleMessage("Priority"),
        "programmedBy": MessageLookupByLibrary.simpleMessage("Programmed by"),
        "progress": MessageLookupByLibrary.simpleMessage("Progress"),
        "receiveNotifications": MessageLookupByLibrary.simpleMessage(
            "Get notified every time an outage has taken place, a maintenance is programmed or any status has changed!"),
        "region": MessageLookupByLibrary.simpleMessage("Region"),
        "removeTagFilters":
            MessageLookupByLibrary.simpleMessage("Remove Tag filter"),
        "reportPriority_none": MessageLookupByLibrary.simpleMessage("None"),
        "reportPriority_one": MessageLookupByLibrary.simpleMessage("P1"),
        "reportPriority_three": MessageLookupByLibrary.simpleMessage("P3"),
        "reportPriority_two": MessageLookupByLibrary.simpleMessage("P2"),
        "reportPriority_zero": MessageLookupByLibrary.simpleMessage("Zero"),
        "reportSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Report successfully created"),
        "reportSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage("Report successfully deleted"),
        "reportSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage("Report successfully updated"),
        "reportType_external": MessageLookupByLibrary.simpleMessage("External"),
        "reportType_internal": MessageLookupByLibrary.simpleMessage("Internal"),
        "reportType_none": MessageLookupByLibrary.simpleMessage("None"),
        "reportType_other": MessageLookupByLibrary.simpleMessage("Other"),
        "reports": MessageLookupByLibrary.simpleMessage("Reports"),
        "requiredText": MessageLookupByLibrary.simpleMessage("Required"),
        "resourceType_interruptions":
            MessageLookupByLibrary.simpleMessage("Interruptions"),
        "resourceType_maintenance":
            MessageLookupByLibrary.simpleMessage("Maintenance"),
        "resourceType_none": MessageLookupByLibrary.simpleMessage("Select One"),
        "resourceType_reports": MessageLookupByLibrary.simpleMessage("Reports"),
        "resourceType_services":
            MessageLookupByLibrary.simpleMessage("Services"),
        "resources": MessageLookupByLibrary.simpleMessage("Resources"),
        "role": MessageLookupByLibrary.simpleMessage("Role"),
        "scope": MessageLookupByLibrary.simpleMessage("Scope"),
        "selectOne": MessageLookupByLibrary.simpleMessage("Select One"),
        "service": MessageLookupByLibrary.simpleMessage("Service"),
        "serviceInstanceType_cloud":
            MessageLookupByLibrary.simpleMessage("Cloud"),
        "serviceInstanceType_local":
            MessageLookupByLibrary.simpleMessage("Local"),
        "serviceInstanceType_none":
            MessageLookupByLibrary.simpleMessage("None"),
        "serviceInstanceType_other":
            MessageLookupByLibrary.simpleMessage("Other"),
        "serviceSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "Service successfully created!"),
        "serviceSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "Service successfully deleted"),
        "serviceSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "Service successfully updated"),
        "serviceTagSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Tag successfully created"),
        "serviceTagSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage("Tag successfully updated"),
        "serviceTagSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage("Tag successfully deleted"),
        "serviceTags": MessageLookupByLibrary.simpleMessage("Service Tags"),
        "serviceType_core": MessageLookupByLibrary.simpleMessage("Core"),
        "serviceType_extra": MessageLookupByLibrary.simpleMessage("Extra"),
        "serviceType_none": MessageLookupByLibrary.simpleMessage("None"),
        "serviceType_other": MessageLookupByLibrary.simpleMessage("Other"),
        "serviceType_recon": MessageLookupByLibrary.simpleMessage("Recon"),
        "serviceType_web": MessageLookupByLibrary.simpleMessage("Web"),
        "services": MessageLookupByLibrary.simpleMessage("Services"),
        "servicios": MessageLookupByLibrary.simpleMessage("Services"),
        "size": MessageLookupByLibrary.simpleMessage("Size"),
        "solution": MessageLookupByLibrary.simpleMessage("Solution"),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "status_active": MessageLookupByLibrary.simpleMessage("Active"),
        "status_available": MessageLookupByLibrary.simpleMessage("Available"),
        "status_complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "status_completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "status_created": MessageLookupByLibrary.simpleMessage("Created"),
        "status_deprecated": MessageLookupByLibrary.simpleMessage("Deprecated"),
        "status_detected": MessageLookupByLibrary.simpleMessage("Detected"),
        "status_disabled": MessageLookupByLibrary.simpleMessage("Disabled"),
        "status_done": MessageLookupByLibrary.simpleMessage("Done"),
        "status_down": MessageLookupByLibrary.simpleMessage("Down"),
        "status_ended": MessageLookupByLibrary.simpleMessage("Ended"),
        "status_inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "status_investigating":
            MessageLookupByLibrary.simpleMessage("Investigating"),
        "status_maintenance":
            MessageLookupByLibrary.simpleMessage("Maintenance"),
        "status_monitoring": MessageLookupByLibrary.simpleMessage("Monitoring"),
        "status_none": MessageLookupByLibrary.simpleMessage("None"),
        "status_progress": MessageLookupByLibrary.simpleMessage("Progress"),
        "status_ready": MessageLookupByLibrary.simpleMessage("Ready"),
        "status_removed": MessageLookupByLibrary.simpleMessage("Removed"),
        "status_solved": MessageLookupByLibrary.simpleMessage("Solved"),
        "status_starting": MessageLookupByLibrary.simpleMessage("Starting"),
        "status_stopped": MessageLookupByLibrary.simpleMessage("Stopped"),
        "status_viewed": MessageLookupByLibrary.simpleMessage("Viewed"),
        "status_waiting": MessageLookupByLibrary.simpleMessage("Waiting"),
        "status_working": MessageLookupByLibrary.simpleMessage("Working"),
        "storage": MessageLookupByLibrary.simpleMessage("Storage"),
        "storageGoal_backup": MessageLookupByLibrary.simpleMessage("Backup"),
        "storageGoal_cache": MessageLookupByLibrary.simpleMessage("Cache"),
        "storageGoal_general": MessageLookupByLibrary.simpleMessage("General"),
        "storageGoal_none": MessageLookupByLibrary.simpleMessage("None"),
        "storageGoal_output": MessageLookupByLibrary.simpleMessage("Output"),
        "storageGoal_recon": MessageLookupByLibrary.simpleMessage("Recon"),
        "storageGoal_temp": MessageLookupByLibrary.simpleMessage("Temporal"),
        "storageGoal_uploads": MessageLookupByLibrary.simpleMessage("Uploads"),
        "storageScope_general": MessageLookupByLibrary.simpleMessage("General"),
        "storageScope_none": MessageLookupByLibrary.simpleMessage("None"),
        "storageScope_organization":
            MessageLookupByLibrary.simpleMessage("Organization"),
        "storageScope_project": MessageLookupByLibrary.simpleMessage("Project"),
        "storageScope_service": MessageLookupByLibrary.simpleMessage("Service"),
        "storageSuccessfullyCreated": MessageLookupByLibrary.simpleMessage(
            "The Storage was successfully created"),
        "storageSuccessfullyDeleted": MessageLookupByLibrary.simpleMessage(
            "The Storage was successfully deleted"),
        "storageSuccessfullyUpdated": MessageLookupByLibrary.simpleMessage(
            "The Storage was successfully updated"),
        "storages": MessageLookupByLibrary.simpleMessage("Storages"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "system": MessageLookupByLibrary.simpleMessage("system"),
        "tapToRemoveTag":
            MessageLookupByLibrary.simpleMessage("*Tap to remove tag"),
        "the": MessageLookupByLibrary.simpleMessage("The"),
        "thisActionCantBeUndone": MessageLookupByLibrary.simpleMessage(
            "This action can\'t be undone!"),
        "tier": MessageLookupByLibrary.simpleMessage("Tier"),
        "time": MessageLookupByLibrary.simpleMessage("Time"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "tool": MessageLookupByLibrary.simpleMessage("tool"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "unexpected": MessageLookupByLibrary.simpleMessage("Unexpected"),
        "updateStatus": MessageLookupByLibrary.simpleMessage("Update Status"),
        "userInformation":
            MessageLookupByLibrary.simpleMessage("User information"),
        "userStatus_active": MessageLookupByLibrary.simpleMessage("Active"),
        "userStatus_blocked": MessageLookupByLibrary.simpleMessage("Blocked"),
        "userStatus_inactive": MessageLookupByLibrary.simpleMessage("Inactive"),
        "userStatus_none": MessageLookupByLibrary.simpleMessage("None"),
        "userStatus_removed": MessageLookupByLibrary.simpleMessage("Removed"),
        "userSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("User successfully created!"),
        "userSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage("User successfully updated!"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "users": MessageLookupByLibrary.simpleMessage("Users"),
        "value": MessageLookupByLibrary.simpleMessage("Value"),
        "view": MessageLookupByLibrary.simpleMessage("View"),
        "web": MessageLookupByLibrary.simpleMessage("Web"),
        "weeklyAccess":
            MessageLookupByLibrary.simpleMessage("Average Weekly Access"),
        "welcomeBack": m2,
        "welcomeBackNoName":
            MessageLookupByLibrary.simpleMessage("Welcome Back!"),
        "welcomeText1": MessageLookupByLibrary.simpleMessage(
            "you needed to know everything about the"),
        "welcomeTo": MessageLookupByLibrary.simpleMessage("Welcome to"),
        "workerInstanceSpeed_background":
            MessageLookupByLibrary.simpleMessage("Background"),
        "workerInstanceSpeed_backup":
            MessageLookupByLibrary.simpleMessage("Backup"),
        "workerInstanceSpeed_common":
            MessageLookupByLibrary.simpleMessage("Common"),
        "workerInstanceSpeed_general":
            MessageLookupByLibrary.simpleMessage("General"),
        "workerInstanceSpeed_none":
            MessageLookupByLibrary.simpleMessage("None"),
        "workerInstanceSpeed_priority":
            MessageLookupByLibrary.simpleMessage("Priority"),
        "workerResourceSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage(
                "Worker Resource successfully created"),
        "workerResourceSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage(
                "Worker Resource successfully deleted"),
        "workerResourceSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage(
                "Worker Resource successfully updated"),
        "workerResources":
            MessageLookupByLibrary.simpleMessage("Worker Resources"),
        "workerSuccessfullyCreated":
            MessageLookupByLibrary.simpleMessage("Worker successfully created"),
        "workerSuccessfullyDeleted":
            MessageLookupByLibrary.simpleMessage("Worker successfully deleted"),
        "workerSuccessfullyUpdated":
            MessageLookupByLibrary.simpleMessage("Worker successfully updated"),
        "workers": MessageLookupByLibrary.simpleMessage("Workers"),
        "yourAccount": MessageLookupByLibrary.simpleMessage("Account"),
        "zone": MessageLookupByLibrary.simpleMessage("Zone")
      };
}
