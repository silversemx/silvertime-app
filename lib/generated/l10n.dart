// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `About AstraZeneca`
  String get aboutAstra {
    return Intl.message(
      'About AstraZeneca',
      name: 'aboutAstra',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Active Users`
  String get activeUsers {
    return Intl.message(
      'Active Users',
      name: 'activeUsers',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Alias`
  String get alias {
    return Intl.message(
      'Alias',
      name: 'alias',
      desc: '',
      args: [],
    );
  }

  /// `An error ocurred`
  String get anErrorOcurred {
    return Intl.message(
      'An error ocurred',
      name: 'anErrorOcurred',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Capture another picture`
  String get captureAnotherImage {
    return Intl.message(
      'Capture another picture',
      name: 'captureAnotherImage',
      desc: '',
      args: [],
    );
  }

  /// `Capture picture`
  String get captureImage {
    return Intl.message(
      'Capture picture',
      name: 'captureImage',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Here you can check service status from your pocket`
  String get checkServiceStatus {
    return Intl.message(
      'Here you can check service status from your pocket',
      name: 'checkServiceStatus',
      desc: '',
      args: [],
    );
  }

  /// `Clear selection`
  String get clearSelection {
    return Intl.message(
      'Clear selection',
      name: 'clearSelection',
      desc: '',
      args: [],
    );
  }

  /// `Cookies advertisement`
  String get cookiesAdvice {
    return Intl.message(
      'Cookies advertisement',
      name: 'cookiesAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Create Disk`
  String get createDisk {
    return Intl.message(
      'Create Disk',
      name: 'createDisk',
      desc: '',
      args: [],
    );
  }

  /// `Create Machine`
  String get createMachine {
    return Intl.message(
      'Create Machine',
      name: 'createMachine',
      desc: '',
      args: [],
    );
  }

  /// `Create Maintenance`
  String get createMaintenance {
    return Intl.message(
      'Create Maintenance',
      name: 'createMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Create Network`
  String get createNetwork {
    return Intl.message(
      'Create Network',
      name: 'createNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Create Report`
  String get createReport {
    return Intl.message(
      'Create Report',
      name: 'createReport',
      desc: '',
      args: [],
    );
  }

  /// `Create Service`
  String get createService {
    return Intl.message(
      'Create Service',
      name: 'createService',
      desc: '',
      args: [],
    );
  }

  /// `Create Service Tag`
  String get createServiceTag {
    return Intl.message(
      'Create Service Tag',
      name: 'createServiceTag',
      desc: '',
      args: [],
    );
  }

  /// `Create User`
  String get createUser {
    return Intl.message(
      'Create User',
      name: 'createUser',
      desc: '',
      args: [],
    );
  }

  /// `Current Range`
  String get currentRange {
    return Intl.message(
      'Current Range',
      name: 'currentRange',
      desc: '',
      args: [],
    );
  }

  /// `Average Daily Access`
  String get dailyAccess {
    return Intl.message(
      'Average Daily Access',
      name: 'dailyAccess',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one {1 Day ago} other {{count} Days ago}}`
  String daysAgo(num count) {
    return Intl.plural(
      count,
      one: '1 Day ago',
      other: '$count Days ago',
      name: 'daysAgo',
      desc: 'Days ago text',
      args: [count],
    );
  }

  /// `Delete Selected: {selected}`
  String deleteSelected(int selected) {
    return Intl.message(
      'Delete Selected: $selected',
      name: 'deleteSelected',
      desc: '',
      args: [selected],
    );
  }

  /// `Deleting disks`
  String get deletingDisks {
    return Intl.message(
      'Deleting disks',
      name: 'deletingDisks',
      desc: '',
      args: [],
    );
  }

  /// `Deleting Machines`
  String get deletingMachines {
    return Intl.message(
      'Deleting Machines',
      name: 'deletingMachines',
      desc: '',
      args: [],
    );
  }

  /// `Deleting Maintenance`
  String get deletingMaintenances {
    return Intl.message(
      'Deleting Maintenance',
      name: 'deletingMaintenances',
      desc: '',
      args: [],
    );
  }

  /// `Deleting Networks`
  String get deletingNetworks {
    return Intl.message(
      'Deleting Networks',
      name: 'deletingNetworks',
      desc: '',
      args: [],
    );
  }

  /// `Deleting services`
  String get deletingServices {
    return Intl.message(
      'Deleting services',
      name: 'deletingServices',
      desc: '',
      args: [],
    );
  }

  /// `Deleting Service Tags`
  String get deletingServiceTags {
    return Intl.message(
      'Deleting Service Tags',
      name: 'deletingServiceTags',
      desc: '',
      args: [],
    );
  }

  /// `Deleting users`
  String get deletingUsers {
    return Intl.message(
      'Deleting users',
      name: 'deletingUsers',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Device Name`
  String get deviceName {
    return Intl.message(
      'Device Name',
      name: 'deviceName',
      desc: '',
      args: [],
    );
  }

  /// `Disk`
  String get disk {
    return Intl.message(
      'Disk',
      name: 'disk',
      desc: '',
      args: [],
    );
  }

  /// `Disks`
  String get disks {
    return Intl.message(
      'Disks',
      name: 'disks',
      desc: '',
      args: [],
    );
  }

  /// `Disk successfully created`
  String get diskSuccessfullyCreated {
    return Intl.message(
      'Disk successfully created',
      name: 'diskSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Disk successfully deleted`
  String get diskSuccessfullyDeleted {
    return Intl.message(
      'Disk successfully deleted',
      name: 'diskSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Disk successfully updated`
  String get diskSuccessfullyUpdated {
    return Intl.message(
      'Disk successfully updated',
      name: 'diskSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Balanced`
  String get diskType_balanced {
    return Intl.message(
      'Balanced',
      name: 'diskType_balanced',
      desc: '',
      args: [],
    );
  }

  /// `Extreme`
  String get diskType_extreme {
    return Intl.message(
      'Extreme',
      name: 'diskType_extreme',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get diskType_none {
    return Intl.message(
      'None',
      name: 'diskType_none',
      desc: '',
      args: [],
    );
  }

  /// `SSD`
  String get diskType_ssd {
    return Intl.message(
      'SSD',
      name: 'diskType_ssd',
      desc: '',
      args: [],
    );
  }

  /// `Standard`
  String get diskType_standard {
    return Intl.message(
      'Standard',
      name: 'diskType_standard',
      desc: '',
      args: [],
    );
  }

  /// `Edit Disk`
  String get editDisk {
    return Intl.message(
      'Edit Disk',
      name: 'editDisk',
      desc: '',
      args: [],
    );
  }

  /// `Edit Machine`
  String get editMachine {
    return Intl.message(
      'Edit Machine',
      name: 'editMachine',
      desc: '',
      args: [],
    );
  }

  /// `Edit Maintenance`
  String get editMaintenance {
    return Intl.message(
      'Edit Maintenance',
      name: 'editMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Edit Network`
  String get editNetwork {
    return Intl.message(
      'Edit Network',
      name: 'editNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Edit Report`
  String get editReport {
    return Intl.message(
      'Edit Report',
      name: 'editReport',
      desc: '',
      args: [],
    );
  }

  /// `Edit Service`
  String get editService {
    return Intl.message(
      'Edit Service',
      name: 'editService',
      desc: '',
      args: [],
    );
  }

  /// `Edit Service Tag`
  String get editServiceTag {
    return Intl.message(
      'Edit Service Tag',
      name: 'editServiceTag',
      desc: '',
      args: [],
    );
  }

  /// `Edit User`
  String get editUser {
    return Intl.message(
      'Edit User',
      name: 'editUser',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Empty field validation`
  String get emptyFieldValidation {
    return Intl.message(
      'Empty field validation',
      name: 'emptyFieldValidation',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `The data wasn't validated correctly`
  String get error_400 {
    return Intl.message(
      'The data wasn\'t validated correctly',
      name: 'error_400',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get error_401 {
    return Intl.message(
      'Unauthorized',
      name: 'error_401',
      desc: '',
      args: [],
    );
  }

  /// `No information was found`
  String get error_404 {
    return Intl.message(
      'No information was found',
      name: 'error_404',
      desc: '',
      args: [],
    );
  }

  /// `Something unexpected happened, retry later`
  String get error_500 {
    return Intl.message(
      'Something unexpected happened, retry later',
      name: 'error_500',
      desc: '',
      args: [],
    );
  }

  /// `Server is down or not responding, wait a few minutes`
  String get error_502 {
    return Intl.message(
      'Server is down or not responding, wait a few minutes',
      name: 'error_502',
      desc: '',
      args: [],
    );
  }

  /// `Timeout reached, check your internet connection`
  String get error_504 {
    return Intl.message(
      'Timeout reached, check your internet connection',
      name: 'error_504',
      desc: '',
      args: [],
    );
  }

  /// `Execution`
  String get execution {
    return Intl.message(
      'Execution',
      name: 'execution',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get executionExit_error {
    return Intl.message(
      'Error',
      name: 'executionExit_error',
      desc: '',
      args: [],
    );
  }

  /// `Interruption`
  String get executionExit_interruption {
    return Intl.message(
      'Interruption',
      name: 'executionExit_interruption',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get executionExit_none {
    return Intl.message(
      'None',
      name: 'executionExit_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get executionExit_other {
    return Intl.message(
      'Other',
      name: 'executionExit_other',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get executionExit_success {
    return Intl.message(
      'Success',
      name: 'executionExit_success',
      desc: '',
      args: [],
    );
  }

  /// `Global`
  String get executionScope_global {
    return Intl.message(
      'Global',
      name: 'executionScope_global',
      desc: '',
      args: [],
    );
  }

  /// `Instance`
  String get executionScope_instance {
    return Intl.message(
      'Instance',
      name: 'executionScope_instance',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get executionScope_none {
    return Intl.message(
      'None',
      name: 'executionScope_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get executionScope_other {
    return Intl.message(
      'Other',
      name: 'executionScope_other',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get executionScope_service {
    return Intl.message(
      'Service',
      name: 'executionScope_service',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get executionType_live {
    return Intl.message(
      'Live',
      name: 'executionType_live',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get executionType_maintenance {
    return Intl.message(
      'Maintenance',
      name: 'executionType_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get executionType_none {
    return Intl.message(
      'None',
      name: 'executionType_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get executionType_other {
    return Intl.message(
      'Other',
      name: 'executionType_other',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get executionType_test {
    return Intl.message(
      'Test',
      name: 'executionType_test',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Filter by`
  String get filter {
    return Intl.message(
      'Filter by',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Format`
  String get format {
    return Intl.message(
      'Format',
      name: 'format',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Generate reports from your phone 📱, let everyone know something has happened right away!`
  String get generateReports {
    return Intl.message(
      'Generate reports from your phone 📱, let everyone know something has happened right away!',
      name: 'generateReports',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `24hrs format`
  String get hrs24Format {
    return Intl.message(
      '24hrs format',
      name: 'hrs24Format',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `in auth`
  String get inAuthorization {
    return Intl.message(
      'in auth',
      name: 'inAuthorization',
      desc: '',
      args: [],
    );
  }

  /// `in Dashboard`
  String get inDashboard {
    return Intl.message(
      'in Dashboard',
      name: 'inDashboard',
      desc: '',
      args: [],
    );
  }

  /// `in server`
  String get inServer {
    return Intl.message(
      'in server',
      name: 'inServer',
      desc: '',
      args: [],
    );
  }

  /// `Instance`
  String get instance {
    return Intl.message(
      'Instance',
      name: 'instance',
      desc: '',
      args: [],
    );
  }

  /// `Instance Interruptions`
  String get instanceInterruptions {
    return Intl.message(
      'Instance Interruptions',
      name: 'instanceInterruptions',
      desc: '',
      args: [],
    );
  }

  /// `Instancias`
  String get instances {
    return Intl.message(
      'Instancias',
      name: 'instances',
      desc: '',
      args: [],
    );
  }

  /// `Interruptions`
  String get interruptions {
    return Intl.message(
      'Interruptions',
      name: 'interruptions',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get invalid {
    return Intl.message(
      'Invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Get full information of major outages, interruptions and maintenance of the system, all in the same place`
  String get knowOverviewText {
    return Intl.message(
      'Get full information of major outages, interruptions and maintenance of the system, all in the same place',
      name: 'knowOverviewText',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastname {
    return Intl.message(
      'Last name',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get legal {
    return Intl.message(
      'Legal',
      name: 'legal',
      desc: '',
      args: [],
    );
  }

  /// `Services per Page`
  String get limit {
    return Intl.message(
      'Services per Page',
      name: 'limit',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Machine`
  String get machine {
    return Intl.message(
      'Machine',
      name: 'machine',
      desc: '',
      args: [],
    );
  }

  /// `Machine configuration updated successfully`
  String get machineConfigurationUpdatedSuccessfully {
    return Intl.message(
      'Machine configuration updated successfully',
      name: 'machineConfigurationUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Machines`
  String get machines {
    return Intl.message(
      'Machines',
      name: 'machines',
      desc: '',
      args: [],
    );
  }

  /// `The Machine was successfully created`
  String get machineSuccessfullyCreated {
    return Intl.message(
      'The Machine was successfully created',
      name: 'machineSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `The Machine was successfully deleted`
  String get machineSuccessfullyDeleted {
    return Intl.message(
      'The Machine was successfully deleted',
      name: 'machineSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `The Machine was successfully updated`
  String get machineSuccessfullyUpdated {
    return Intl.message(
      'The Machine was successfully updated',
      name: 'machineSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Cloud`
  String get machineType_cloud {
    return Intl.message(
      'Cloud',
      name: 'machineType_cloud',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get machineType_local {
    return Intl.message(
      'Local',
      name: 'machineType_local',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get machineType_none {
    return Intl.message(
      'None',
      name: 'machineType_none',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get maintenance {
    return Intl.message(
      'Maintenance',
      name: 'maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get maintenances {
    return Intl.message(
      'Maintenance',
      name: 'maintenances',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Successfully Created`
  String get maintenanceSuccessfullyCreated {
    return Intl.message(
      'Maintenance Successfully Created',
      name: 'maintenanceSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Successfully Deleted`
  String get maintenanceSuccessfullyDeleted {
    return Intl.message(
      'Maintenance Successfully Deleted',
      name: 'maintenanceSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Successfully Updated`
  String get maintenanceSuccessfullyUpdated {
    return Intl.message(
      'Maintenance Successfully Updated',
      name: 'maintenanceSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get maintenanceTime_free {
    return Intl.message(
      'Free',
      name: 'maintenanceTime_free',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get maintenanceTime_none {
    return Intl.message(
      'None',
      name: 'maintenanceTime_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get maintenanceTime_other {
    return Intl.message(
      'Other',
      name: 'maintenanceTime_other',
      desc: '',
      args: [],
    );
  }

  /// `Range`
  String get maintenanceTime_range {
    return Intl.message(
      'Range',
      name: 'maintenanceTime_range',
      desc: '',
      args: [],
    );
  }

  /// `Major Interruptions`
  String get majorInterruptions {
    return Intl.message(
      'Major Interruptions',
      name: 'majorInterruptions',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Missing value`
  String get missingValue {
    return Intl.message(
      'Missing value',
      name: 'missingValue',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Average Monthly Access`
  String get monthlyAccess {
    return Intl.message(
      'Average Monthly Access',
      name: 'monthlyAccess',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get network {
    return Intl.message(
      'Network',
      name: 'network',
      desc: '',
      args: [],
    );
  }

  /// `Networking`
  String get networking {
    return Intl.message(
      'Networking',
      name: 'networking',
      desc: '',
      args: [],
    );
  }

  /// `Networks`
  String get networks {
    return Intl.message(
      'Networks',
      name: 'networks',
      desc: '',
      args: [],
    );
  }

  /// `Network successfully created`
  String get networkSuccessfullyCreated {
    return Intl.message(
      'Network successfully created',
      name: 'networkSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Network successfully deleted`
  String get networkSuccessfullyDeleted {
    return Intl.message(
      'Network successfully deleted',
      name: 'networkSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Network successfully updated`
  String get networkSuccessfullyUpdated {
    return Intl.message(
      'Network successfully updated',
      name: 'networkSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get networkType_none {
    return Intl.message(
      'None',
      name: 'networkType_none',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get networkType_premium {
    return Intl.message(
      'Premium',
      name: 'networkType_premium',
      desc: '',
      args: [],
    );
  }

  /// `Standard`
  String get networkType_standard {
    return Intl.message(
      'Standard',
      name: 'networkType_standard',
      desc: '',
      args: [],
    );
  }

  /// `New report`
  String get newReport {
    return Intl.message(
      'New report',
      name: 'newReport',
      desc: '',
      args: [],
    );
  }

  /// `No information was found`
  String get noInformation {
    return Intl.message(
      'No information was found',
      name: 'noInformation',
      desc: '',
      args: [],
    );
  }

  /// `There are no instances`
  String get noInstances {
    return Intl.message(
      'There are no instances',
      name: 'noInstances',
      desc: '',
      args: [],
    );
  }

  /// `There are no services`
  String get noServices {
    return Intl.message(
      'There are no services',
      name: 'noServices',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `An item must be selected`
  String get notSelected {
    return Intl.message(
      'An item must be selected',
      name: 'notSelected',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Path`
  String get path {
    return Intl.message(
      'Path',
      name: 'path',
      desc: '',
      args: [],
    );
  }

  /// `Pick an image`
  String get pickAnImage {
    return Intl.message(
      'Pick an image',
      name: 'pickAnImage',
      desc: '',
      args: [],
    );
  }

  /// `Pick another image`
  String get pickAnotherImage {
    return Intl.message(
      'Pick another image',
      name: 'pickAnotherImage',
      desc: '',
      args: [],
    );
  }

  /// `Platform overview`
  String get platformOverview {
    return Intl.message(
      'Platform overview',
      name: 'platformOverview',
      desc: '',
      args: [],
    );
  }

  /// `Posted By`
  String get postedBy {
    return Intl.message(
      'Posted By',
      name: 'postedBy',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Programmed by`
  String get programmedBy {
    return Intl.message(
      'Programmed by',
      name: 'programmedBy',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress {
    return Intl.message(
      'Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Get notified every time an outage has taken place, a maintenance is programmed or any status has changed!`
  String get receiveNotifications {
    return Intl.message(
      'Get notified every time an outage has taken place, a maintenance is programmed or any status has changed!',
      name: 'receiveNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: '',
      args: [],
    );
  }

  /// `Remove Tag filter`
  String get removeTagFilters {
    return Intl.message(
      'Remove Tag filter',
      name: 'removeTagFilters',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get reportPriority_none {
    return Intl.message(
      'None',
      name: 'reportPriority_none',
      desc: '',
      args: [],
    );
  }

  /// `P1`
  String get reportPriority_one {
    return Intl.message(
      'P1',
      name: 'reportPriority_one',
      desc: '',
      args: [],
    );
  }

  /// `P3`
  String get reportPriority_three {
    return Intl.message(
      'P3',
      name: 'reportPriority_three',
      desc: '',
      args: [],
    );
  }

  /// `P2`
  String get reportPriority_two {
    return Intl.message(
      'P2',
      name: 'reportPriority_two',
      desc: '',
      args: [],
    );
  }

  /// `Zero`
  String get reportPriority_zero {
    return Intl.message(
      'Zero',
      name: 'reportPriority_zero',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Report successfully created`
  String get reportSuccessfullyCreated {
    return Intl.message(
      'Report successfully created',
      name: 'reportSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Report successfully deleted`
  String get reportSuccessfullyDeleted {
    return Intl.message(
      'Report successfully deleted',
      name: 'reportSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Report successfully updated`
  String get reportSuccessfullyUpdated {
    return Intl.message(
      'Report successfully updated',
      name: 'reportSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `External`
  String get reportType_external {
    return Intl.message(
      'External',
      name: 'reportType_external',
      desc: '',
      args: [],
    );
  }

  /// `Internal`
  String get reportType_internal {
    return Intl.message(
      'Internal',
      name: 'reportType_internal',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get reportType_none {
    return Intl.message(
      'None',
      name: 'reportType_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get reportType_other {
    return Intl.message(
      'Other',
      name: 'reportType_other',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get requiredText {
    return Intl.message(
      'Required',
      name: 'requiredText',
      desc: '',
      args: [],
    );
  }

  /// `Resources`
  String get resources {
    return Intl.message(
      'Resources',
      name: 'resources',
      desc: '',
      args: [],
    );
  }

  /// `Interruptions`
  String get resourceType_interruptions {
    return Intl.message(
      'Interruptions',
      name: 'resourceType_interruptions',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get resourceType_maintenance {
    return Intl.message(
      'Maintenance',
      name: 'resourceType_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Select One`
  String get resourceType_none {
    return Intl.message(
      'Select One',
      name: 'resourceType_none',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get resourceType_reports {
    return Intl.message(
      'Reports',
      name: 'resourceType_reports',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get resourceType_services {
    return Intl.message(
      'Services',
      name: 'resourceType_services',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `Scope`
  String get scope {
    return Intl.message(
      'Scope',
      name: 'scope',
      desc: '',
      args: [],
    );
  }

  /// `Select One`
  String get selectOne {
    return Intl.message(
      'Select One',
      name: 'selectOne',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Cloud`
  String get serviceInstanceType_cloud {
    return Intl.message(
      'Cloud',
      name: 'serviceInstanceType_cloud',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get serviceInstanceType_local {
    return Intl.message(
      'Local',
      name: 'serviceInstanceType_local',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get serviceInstanceType_none {
    return Intl.message(
      'None',
      name: 'serviceInstanceType_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get serviceInstanceType_other {
    return Intl.message(
      'Other',
      name: 'serviceInstanceType_other',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Service successfully created!`
  String get serviceSuccessfullyCreated {
    return Intl.message(
      'Service successfully created!',
      name: 'serviceSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Service successfully deleted`
  String get serviceSuccessfullyDeleted {
    return Intl.message(
      'Service successfully deleted',
      name: 'serviceSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Service successfully updated`
  String get serviceSuccessfullyUpdated {
    return Intl.message(
      'Service successfully updated',
      name: 'serviceSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Service Tags`
  String get serviceTags {
    return Intl.message(
      'Service Tags',
      name: 'serviceTags',
      desc: '',
      args: [],
    );
  }

  /// `Tag successfully created`
  String get serviceTagSuccessfullyCreated {
    return Intl.message(
      'Tag successfully created',
      name: 'serviceTagSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Tag successfully updated`
  String get serviceTagSuccessfullyDeleted {
    return Intl.message(
      'Tag successfully updated',
      name: 'serviceTagSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Tag successfully deleted`
  String get serviceTagSuccessfullyUpdated {
    return Intl.message(
      'Tag successfully deleted',
      name: 'serviceTagSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Core`
  String get serviceType_core {
    return Intl.message(
      'Core',
      name: 'serviceType_core',
      desc: '',
      args: [],
    );
  }

  /// `Extra`
  String get serviceType_extra {
    return Intl.message(
      'Extra',
      name: 'serviceType_extra',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get serviceType_none {
    return Intl.message(
      'None',
      name: 'serviceType_none',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get serviceType_other {
    return Intl.message(
      'Other',
      name: 'serviceType_other',
      desc: '',
      args: [],
    );
  }

  /// `Recon`
  String get serviceType_recon {
    return Intl.message(
      'Recon',
      name: 'serviceType_recon',
      desc: '',
      args: [],
    );
  }

  /// `Web`
  String get serviceType_web {
    return Intl.message(
      'Web',
      name: 'serviceType_web',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get servicios {
    return Intl.message(
      'Services',
      name: 'servicios',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Solution`
  String get solution {
    return Intl.message(
      'Solution',
      name: 'solution',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get status_active {
    return Intl.message(
      'Active',
      name: 'status_active',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get status_available {
    return Intl.message(
      'Available',
      name: 'status_available',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get status_complete {
    return Intl.message(
      'Complete',
      name: 'status_complete',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get status_completed {
    return Intl.message(
      'Completed',
      name: 'status_completed',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get status_created {
    return Intl.message(
      'Created',
      name: 'status_created',
      desc: '',
      args: [],
    );
  }

  /// `Deprecated`
  String get status_deprecated {
    return Intl.message(
      'Deprecated',
      name: 'status_deprecated',
      desc: '',
      args: [],
    );
  }

  /// `Detected`
  String get status_detected {
    return Intl.message(
      'Detected',
      name: 'status_detected',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get status_disabled {
    return Intl.message(
      'Disabled',
      name: 'status_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get status_done {
    return Intl.message(
      'Done',
      name: 'status_done',
      desc: '',
      args: [],
    );
  }

  /// `Down`
  String get status_down {
    return Intl.message(
      'Down',
      name: 'status_down',
      desc: '',
      args: [],
    );
  }

  /// `Ended`
  String get status_ended {
    return Intl.message(
      'Ended',
      name: 'status_ended',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get status_inactive {
    return Intl.message(
      'Inactive',
      name: 'status_inactive',
      desc: '',
      args: [],
    );
  }

  /// `Investigating`
  String get status_investigating {
    return Intl.message(
      'Investigating',
      name: 'status_investigating',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get status_maintenance {
    return Intl.message(
      'Maintenance',
      name: 'status_maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Monitoring`
  String get status_monitoring {
    return Intl.message(
      'Monitoring',
      name: 'status_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get status_none {
    return Intl.message(
      'None',
      name: 'status_none',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get status_progress {
    return Intl.message(
      'Progress',
      name: 'status_progress',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get status_ready {
    return Intl.message(
      'Ready',
      name: 'status_ready',
      desc: '',
      args: [],
    );
  }

  /// `Removed`
  String get status_removed {
    return Intl.message(
      'Removed',
      name: 'status_removed',
      desc: '',
      args: [],
    );
  }

  /// `Solved`
  String get status_solved {
    return Intl.message(
      'Solved',
      name: 'status_solved',
      desc: '',
      args: [],
    );
  }

  /// `Starting`
  String get status_starting {
    return Intl.message(
      'Starting',
      name: 'status_starting',
      desc: '',
      args: [],
    );
  }

  /// `Stopped`
  String get status_stopped {
    return Intl.message(
      'Stopped',
      name: 'status_stopped',
      desc: '',
      args: [],
    );
  }

  /// `Viewed`
  String get status_viewed {
    return Intl.message(
      'Viewed',
      name: 'status_viewed',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get status_waiting {
    return Intl.message(
      'Waiting',
      name: 'status_waiting',
      desc: '',
      args: [],
    );
  }

  /// `Working`
  String get status_working {
    return Intl.message(
      'Working',
      name: 'status_working',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get storage {
    return Intl.message(
      'Storage',
      name: 'storage',
      desc: '',
      args: [],
    );
  }

  /// `Backup`
  String get storageGoal_backup {
    return Intl.message(
      'Backup',
      name: 'storageGoal_backup',
      desc: '',
      args: [],
    );
  }

  /// `Cache`
  String get storageGoal_cache {
    return Intl.message(
      'Cache',
      name: 'storageGoal_cache',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get storageGoal_general {
    return Intl.message(
      'General',
      name: 'storageGoal_general',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get storageGoal_none {
    return Intl.message(
      'None',
      name: 'storageGoal_none',
      desc: '',
      args: [],
    );
  }

  /// `Output`
  String get storageGoal_output {
    return Intl.message(
      'Output',
      name: 'storageGoal_output',
      desc: '',
      args: [],
    );
  }

  /// `Recon`
  String get storageGoal_recon {
    return Intl.message(
      'Recon',
      name: 'storageGoal_recon',
      desc: '',
      args: [],
    );
  }

  /// `Temporal`
  String get storageGoal_temp {
    return Intl.message(
      'Temporal',
      name: 'storageGoal_temp',
      desc: '',
      args: [],
    );
  }

  /// `Uploads`
  String get storageGoal_uploads {
    return Intl.message(
      'Uploads',
      name: 'storageGoal_uploads',
      desc: '',
      args: [],
    );
  }

  /// `Storages`
  String get storages {
    return Intl.message(
      'Storages',
      name: 'storages',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get storageScope_general {
    return Intl.message(
      'General',
      name: 'storageScope_general',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get storageScope_none {
    return Intl.message(
      'None',
      name: 'storageScope_none',
      desc: '',
      args: [],
    );
  }

  /// `Organization`
  String get storageScope_organization {
    return Intl.message(
      'Organization',
      name: 'storageScope_organization',
      desc: '',
      args: [],
    );
  }

  /// `Project`
  String get storageScope_project {
    return Intl.message(
      'Project',
      name: 'storageScope_project',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get storageScope_service {
    return Intl.message(
      'Service',
      name: 'storageScope_service',
      desc: '',
      args: [],
    );
  }

  /// `The Storage was successfully created`
  String get storageSuccessfullyCreated {
    return Intl.message(
      'The Storage was successfully created',
      name: 'storageSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `The Storage was successfully deleted`
  String get storageSuccessfullyDeleted {
    return Intl.message(
      'The Storage was successfully deleted',
      name: 'storageSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `The Storage was successfully updated`
  String get storageSuccessfullyUpdated {
    return Intl.message(
      'The Storage was successfully updated',
      name: 'storageSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `system`
  String get system {
    return Intl.message(
      'system',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `*Tap to remove tag`
  String get tapToRemoveTag {
    return Intl.message(
      '*Tap to remove tag',
      name: 'tapToRemoveTag',
      desc: '',
      args: [],
    );
  }

  /// `The`
  String get the {
    return Intl.message(
      'The',
      name: 'the',
      desc: '',
      args: [],
    );
  }

  /// `This action can't be undone!`
  String get thisActionCantBeUndone {
    return Intl.message(
      'This action can\'t be undone!',
      name: 'thisActionCantBeUndone',
      desc: '',
      args: [],
    );
  }

  /// `This action can't be undone`
  String get thisCantBeUndone {
    return Intl.message(
      'This action can\'t be undone',
      name: 'thisCantBeUndone',
      desc: '',
      args: [],
    );
  }

  /// `Tier`
  String get tier {
    return Intl.message(
      'Tier',
      name: 'tier',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `tool`
  String get tool {
    return Intl.message(
      'tool',
      name: 'tool',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected`
  String get unexpected {
    return Intl.message(
      'Unexpected',
      name: 'unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Update Status`
  String get updateStatus {
    return Intl.message(
      'Update Status',
      name: 'updateStatus',
      desc: '',
      args: [],
    );
  }

  /// `User information`
  String get userInformation {
    return Intl.message(
      'User information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get userStatus_active {
    return Intl.message(
      'Active',
      name: 'userStatus_active',
      desc: '',
      args: [],
    );
  }

  /// `Blocked`
  String get userStatus_blocked {
    return Intl.message(
      'Blocked',
      name: 'userStatus_blocked',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get userStatus_inactive {
    return Intl.message(
      'Inactive',
      name: 'userStatus_inactive',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get userStatus_none {
    return Intl.message(
      'None',
      name: 'userStatus_none',
      desc: '',
      args: [],
    );
  }

  /// `Removed`
  String get userStatus_removed {
    return Intl.message(
      'Removed',
      name: 'userStatus_removed',
      desc: '',
      args: [],
    );
  }

  /// `User successfully created!`
  String get userSuccessfullyCreated {
    return Intl.message(
      'User successfully created!',
      name: 'userSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `User successfully updated!`
  String get userSuccessfullyUpdated {
    return Intl.message(
      'User successfully updated!',
      name: 'userSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message(
      'Value',
      name: 'value',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Web`
  String get web {
    return Intl.message(
      'Web',
      name: 'web',
      desc: '',
      args: [],
    );
  }

  /// `Average Weekly Access`
  String get weeklyAccess {
    return Intl.message(
      'Average Weekly Access',
      name: 'weeklyAccess',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back, {name}!`
  String welcomeBack(String name) {
    return Intl.message(
      'Welcome Back, $name!',
      name: 'welcomeBack',
      desc: '',
      args: [name],
    );
  }

  /// `Welcome Back!`
  String get welcomeBackNoName {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBackNoName',
      desc: '',
      args: [],
    );
  }

  /// `you needed to know everything about the`
  String get welcomeText1 {
    return Intl.message(
      'you needed to know everything about the',
      name: 'welcomeText1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message(
      'Welcome to',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Background`
  String get workerInstanceSpeed_background {
    return Intl.message(
      'Background',
      name: 'workerInstanceSpeed_background',
      desc: '',
      args: [],
    );
  }

  /// `Backup`
  String get workerInstanceSpeed_backup {
    return Intl.message(
      'Backup',
      name: 'workerInstanceSpeed_backup',
      desc: '',
      args: [],
    );
  }

  /// `Common`
  String get workerInstanceSpeed_common {
    return Intl.message(
      'Common',
      name: 'workerInstanceSpeed_common',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get workerInstanceSpeed_general {
    return Intl.message(
      'General',
      name: 'workerInstanceSpeed_general',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get workerInstanceSpeed_none {
    return Intl.message(
      'None',
      name: 'workerInstanceSpeed_none',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get workerInstanceSpeed_priority {
    return Intl.message(
      'Priority',
      name: 'workerInstanceSpeed_priority',
      desc: '',
      args: [],
    );
  }

  /// `Worker Resources`
  String get workerResources {
    return Intl.message(
      'Worker Resources',
      name: 'workerResources',
      desc: '',
      args: [],
    );
  }

  /// `Worker Resource successfully created`
  String get workerResourceSuccessfullyCreated {
    return Intl.message(
      'Worker Resource successfully created',
      name: 'workerResourceSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Worker Resource successfully deleted`
  String get workerResourceSuccessfullyDeleted {
    return Intl.message(
      'Worker Resource successfully deleted',
      name: 'workerResourceSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Worker Resource successfully updated`
  String get workerResourceSuccessfullyUpdated {
    return Intl.message(
      'Worker Resource successfully updated',
      name: 'workerResourceSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Workers`
  String get workers {
    return Intl.message(
      'Workers',
      name: 'workers',
      desc: '',
      args: [],
    );
  }

  /// `Worker successfully created`
  String get workerSuccessfullyCreated {
    return Intl.message(
      'Worker successfully created',
      name: 'workerSuccessfullyCreated',
      desc: '',
      args: [],
    );
  }

  /// `Worker successfully deleted`
  String get workerSuccessfullyDeleted {
    return Intl.message(
      'Worker successfully deleted',
      name: 'workerSuccessfullyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Worker successfully updated`
  String get workerSuccessfullyUpdated {
    return Intl.message(
      'Worker successfully updated',
      name: 'workerSuccessfullyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get yourAccount {
    return Intl.message(
      'Account',
      name: 'yourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Zone`
  String get zone {
    return Intl.message(
      'Zone',
      name: 'zone',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
