# ECM-CustomerReports

This is an extension for Business Central 13 (Fall Release) CU3. There are example for customizing reports to TRASER ECM-BC extension. This extension includes all reports that were in the prior NAV-Versions of the ECM Interface:

* 117 - Reminder
* 204 - Sales - Quote
* 205 - Order Confirmation
* 206 - Sales - Invoice
* 207 - Sales - Credit Memo
* 208 - Sales - Shipment
* 405 - Order
* 5900 - Service Order
* 5902 - Service Quote
* 5911 - Service - Invoice
* 5912 - Service - Credit Memo
* 5913 - Service - Shipment
* 5936 - Service Item Worksheet
* 5970 - Service Contract
* 6636 - Purchase - Return Shipment
* 6646 - Sales - Return Receipt

You need this report customizations to support document archiving to d3 with the ECM Interface. This extension can be used if your customer is using standard reports. If you have to customize customer specific reports you can use the extension as an example. Please notice the dependencies in the app.json file.

The important changes in the reports are the *ArchiveReport* function and the exclusion of the printer counter and the LogManagement in *Archive Mode*. The *Archive Mode* is a background call of the report performed by the ECM Interface to archive documents to d3.
