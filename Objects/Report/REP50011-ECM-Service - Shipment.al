report 50011 "ECM - Service - Shipment"
{
    // version NAVW113.02,ECM130.1.00

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Service - Shipment.rdlc';

    Caption = 'Service - Shipment';

    dataset
    {
        dataitem("Service Shipment Header"; "Service Shipment Header")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Service Shipment';
            column(No_ServiceShptHrd; "No.")
            {
            }
            column(DocumentDate; DocumentDateLbl)
            {
            }
            column(EmailIdCaption; EmailIdCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(SrvcShipHeaderCustNoCaption; SrvcShipHeaderCustNoCaptionLbl)
            {
            }
            column(WarrantyCaption; WarrantyCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(ServiceShptCopyText; STRSUBSTNO(Text002, CopyText))
                    {
                    }
                    column(CurrReportPageNo; STRSUBSTNO(Text003, FORMAT(CurrReport.PAGENO)))
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(HomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(EMailId; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegnNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CustNo_ServShptHrd; "Service Shipment Header"."Customer No.")
                    {
                    }
                    column(ServShptHrdDocDt; FORMAT("Service Shipment Header"."Document Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_ServiceShptHrd; "Service Shipment Header"."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_ServShptHrd; "Service Shipment Header"."Your Reference")
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(PostingDate_ServShptHrd; FORMAT("Service Shipment Header"."Posting Date"))
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text003, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ItemTrackingAppendixCaption; ItemTrackingAppendixCaptionLbl)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(ServiceShpHdrNoCaption; ServiceShpHdrNoCaptionLbl)
                    {
                    }
                    column(ServiceShpHdrPostingDateCaption; ServiceShpHdrPostingDateCaptionLbl)
                    {
                    }
                    column(CustNo_ServShptHrdCaption; "Service Shipment Header".FIELDCAPTION("Customer No."))
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Service Shipment Header";
                        DataItemTableView = SORTING (Number);
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Number; Number)
                        {
                        }
                        column(HdrDimsCaption; HdrDimsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            DimText := DimTxtArr[Number];
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                            FindDimTxt("Service Shipment Header"."Dimension Set ID");
                            SETRANGE(Number, 1, DimTxtArrLength);
                        end;
                    }
                    dataitem("Service Shipment Item Line"; "Service Shipment Item Line")
                    {
                        DataItemLink = "No." = FIELD ("No.");
                        DataItemLinkReference = "Service Shipment Header";
                        DataItemTableView = SORTING ("No.", "Line No.");
                        column(ContractNo_ServShptItemLn; "Contract No.")
                        {
                        }
                        column(Des_ServShptItemLn; Description)
                        {
                        }
                        column(SerialNo_ServShptItemLn; "Serial No.")
                        {
                        }
                        column(ItemNo_ServShptItemLn; "Item No.")
                        {
                        }
                        column(ItemGrpCode_ServShptLn; "Service Item Group Code")
                        {
                        }
                        column(ServItemNo_ServShptItemLn; "Service Item No.")
                        {
                        }
                        column(Warranty; FORMAT(Warranty))
                        {
                        }
                        column(LnNo_ServShptItemLn; "Line No.")
                        {
                        }
                        column(SrvcShpItemLineCaption; SrvcShpItemLineCaptionLbl)
                        {
                        }
                        column(ContractNo_ServShptItemLnCaption; FIELDCAPTION("Contract No."))
                        {
                        }
                        column(Des_ServShptItemLnCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(SerialNo_ServShptItemLnCaption; FIELDCAPTION("Serial No."))
                        {
                        }
                        column(ItemNo_ServShptItemLnCaption; FIELDCAPTION("Item No."))
                        {
                        }
                        column(ItemGrpCode_ServShptLnCaption; FIELDCAPTION("Service Item Group Code"))
                        {
                        }
                        column(ServItemNo_ServShptItemLnCaption; FIELDCAPTION("Service Item No."))
                        {
                        }
                    }
                    dataitem("Service Shipment Line"; "Service Shipment Line")
                    {
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Service Shipment Header";
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        column(ServShptLnDescription; Description)
                        {
                        }
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(ShowCorrectionLines; ShowCorrectionLines)
                        {
                        }
                        column(ShowLotSN; ShowLotSN)
                        {
                        }
                        column(Type_ServiceShptItemLn; Type)
                        {
                        }
                        column(Qty_ServiceShptItemLn; Quantity)
                        {
                        }
                        column(UnitofMeasure_ServShptLn; "Unit of Measure")
                        {
                        }
                        column(No_ServiceShptItemLn; "No.")
                        {
                        }
                        column(QtyInvoiced_ServShptLine; "Quantity Invoiced")
                        {
                        }
                        column(QtyConsumed_ServShptLine; "Quantity Consumed")
                        {
                        }
                        column(LnNo_ServiceShptItemLn; "Line No.")
                        {
                        }
                        column(ServiceShpLineCaption; ServiceShpLineCaptionLbl)
                        {
                        }
                        column(QtyInvoicedCaption; QtyInvoicedCaptionLbl)
                        {
                        }
                        column(QtyConsumedCaption; QtyConsumedCaptionLbl)
                        {
                        }
                        column(ServShptLnDescriptionCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(Qty_ServiceShptItemLnCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(UnitofMeasure_ServShptLnCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(No_ServiceShptItemLnCaption; FIELDCAPTION("No."))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number);
                            column(DimText_DimLoop2; DimText)
                            {
                            }
                            column(DimensionLoop2Number; Number)
                            {
                            }
                            column(LineDimsCaption; LineDimsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                DimText := DimTxtArr[Number];
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;
                                FindDimTxt("Service Shipment Line"."Dimension Set ID");
                                SETRANGE(Number, 1, DimTxtArrLength);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF NOT ShowCorrectionLines AND Correction THEN
                                CurrReport.SKIP;
                        end;

                        trigger OnPostDataItem()
                        begin
                            IF ShowLotSN THEN
                                TrackingSpecCount :=
                                  ItemTrackingDocMgt.RetrieveDocumentItemTracking(TrackingSpecBuffer,
                                    "Service Shipment Header"."No.", DATABASE::"Service Shipment Header", 0);
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(BilltoCustNo_ServShptHrd; "Service Shipment Header"."Bill-to Customer No.")
                        {
                        }
                        column(CustAddr1; CustAddr[1])
                        {
                        }
                        column(CustAddr2; CustAddr[2])
                        {
                        }
                        column(CustAddr3; CustAddr[3])
                        {
                        }
                        column(CustAddr4; CustAddr[4])
                        {
                        }
                        column(CustAddr5; CustAddr[5])
                        {
                        }
                        column(CustAddr6; CustAddr[6])
                        {
                        }
                        column(CustAddr7; CustAddr[7])
                        {
                        }
                        column(CustAddr8; CustAddr[8])
                        {
                        }
                        column(BilltoAddrCaption; BilltoAddrCaptionLbl)
                        {
                        }
                        column(BilltoCustNo_ServShptHrdCaption; "Service Shipment Header".FIELDCAPTION("Bill-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowCustAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(ItemTrackingLine; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(TrackingSpecBufItemNo; TrackingSpecBuffer."Item No.")
                        {
                        }
                        column(TrackingSpecBufDesc; TrackingSpecBuffer.Description)
                        {
                        }
                        column(TrackingSpecBufLotNo; TrackingSpecBuffer."Lot No.")
                        {
                        }
                        column(TrackingSpecBufSerialNo; TrackingSpecBuffer."Serial No.")
                        {
                        }
                        column(TrackingSpecBufQty; TrackingSpecBuffer."Quantity (Base)")
                        {
                        }
                        column(ShowTotal; ShowTotal)
                        {
                        }
                        column(ShowGroup; ShowGroup)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(SerialNoCaption; SerialNoCaptionLbl)
                        {
                        }
                        column(LotNoCaption; LotNoCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        dataitem(TotalItemTracking; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                            column(TotalQty; TotalQty)
                            {
                            }
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN
                                TrackingSpecBuffer.FINDSET
                            ELSE
                                TrackingSpecBuffer.NEXT;

                            IF NOT ShowCorrectionLines AND TrackingSpecBuffer.Correction THEN
                                CurrReport.SKIP;
                            IF TrackingSpecBuffer.Correction THEN
                                TrackingSpecBuffer."Quantity (Base)" := -TrackingSpecBuffer."Quantity (Base)";

                            ShowTotal := FALSE;
                            IF ItemTrackingAppendix.IsStartNewGroup(TrackingSpecBuffer) THEN
                                ShowTotal := TRUE;

                            ShowGroup := FALSE;
                            IF (TrackingSpecBuffer."Source Ref. No." <> OldRefNo) OR
                               (TrackingSpecBuffer."Item No." <> OldNo)
                            THEN BEGIN
                                OldRefNo := TrackingSpecBuffer."Source Ref. No.";
                                OldNo := TrackingSpecBuffer."Item No.";
                                TotalQty := 0;
                            END ELSE
                                ShowGroup := TRUE;
                            TotalQty += TrackingSpecBuffer."Quantity (Base)";
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF TrackingSpecCount = 0 THEN
                                CurrReport.BREAK;
                            CurrReport.NEWPAGE;
                            SETRANGE(Number, 1, TrackingSpecCount);
                            TrackingSpecBuffer.SETCURRENTKEY("Source ID", "Source Type", "Source Subtype", "Source Batch Name",
                              "Source Prod. Order Line", "Source Ref. No.");
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        // Item Tracking:
                        IF ShowLotSN THEN BEGIN
                            TrackingSpecCount := 0;
                            OldRefNo := 0;
                            ShowGroup := FALSE;
                        END;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;
                    TotalQty := 0;           // Item Tracking
                end;

                trigger OnPostDataItem()
                begin
                    //+++TRASER-ECM
                    IF NOT ECMReportMgt.IsArchiveModus THEN
                        //---TRASER-ECM
                        IF NOT IsReportInPreviewMode THEN
                            CODEUNIT.RUN(CODEUNIT::"Service Shpt.-Printed", "Service Shipment Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := 1 + ABS(NoOfCopies);
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                FormatAddressFields("Service Shipment Header");
                FormatDocumentFields("Service Shipment Header");
                //+++TRASER ECM
                ArchiveReport;
                //---TRASER ECM
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Optionen)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Service;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Service;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field("Show Correction Lines"; ShowCorrectionLines)
                    {
                        ApplicationArea = Service;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(ShowLotSN; ShowLotSN)
                    {
                        ApplicationArea = Service;
                        Caption = 'Show Lot/Serial No. Appendix';
                        ToolTip = 'Specifies if you want to print an appendix to the service shipment report that shows the lot and serial numbers that are in the shipment.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.GET;
        ServiceSetup.GET;
        FormatDocument.SetLogoPosition(ServiceSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);
    end;

    var
        Text002: Label 'Service - Shipment %1';
        Text003: Label 'Page %1';
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        ServiceSetup: Record "Service Mgt. Setup";
        DimSetEntry: Record "Dimension Set Entry";
        Language: Record Language;
        RespCenter: Record "Responsibility Center";
        TrackingSpecBuffer: Record "Tracking Specification" temporary;
        ItemTrackingAppendix: Report "Item Tracking Appendix";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        TrackingSpecCount: Integer;
        OldRefNo: Integer;
        TotalQty: Decimal;
        OldNo: Code[20];
        CopyText: Text[30];
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        SalesPersonText: Text[20];
        ReferenceText: Text[80];
        DimText: Text[120];
        ShowCustAddr: Boolean;
        MoreLines: Boolean;
        ShowInternalInfo: Boolean;
        ShowCorrectionLines: Boolean;
        ShowLotSN: Boolean;
        ShowTotal: Boolean;
        ShowGroup: Boolean;
        OutputNo: Integer;
        DimTxtArrLength: Integer;
        DimTxtArr: array[500] of Text[50];
        ItemTrackingAppendixCaptionLbl: Label 'Item Tracking - Appendix';
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccNoCaptionLbl: Label 'Account No.';
        ServiceShpHdrNoCaptionLbl: Label 'Shipment No.';
        ServiceShpHdrPostingDateCaptionLbl: Label 'Posting Date';
        HdrDimsCaptionLbl: Label 'Header Dimensions';
        SrvcShpItemLineCaptionLbl: Label 'Service Shipment Item Line';
        ServiceShpLineCaptionLbl: Label 'Service Shipment Line';
        QtyInvoicedCaptionLbl: Label 'Quantity Invoiced';
        QtyConsumedCaptionLbl: Label 'Quantity Consumed';
        LineDimsCaptionLbl: Label 'Line Dimensions';
        BilltoAddrCaptionLbl: Label 'Bill-to Address';
        QuantityCaptionLbl: Label 'Quantity';
        SerialNoCaptionLbl: Label 'Serial No.';
        LotNoCaptionLbl: Label 'Lot No.';
        DescriptionCaptionLbl: Label 'Description';
        DocumentDateLbl: Label 'Document Date';
        EmailIdCaptionLbl: Label 'Email';
        HomePageCaptionLbl: Label 'HomePage';
        SrvcShipHeaderCustNoCaptionLbl: Label 'Customer No';
        WarrantyCaptionLbl: Label 'Warranty';
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    local procedure FindDimTxt(DimSetID: Integer)
    var
        Separation: Text[5];
        i: Integer;
        TxtToAdd: Text[120];
        StartNewLine: Boolean;
    begin
        DimSetEntry.SETRANGE("Dimension Set ID", DimSetID);
        DimTxtArrLength := 0;
        FOR i := 1 TO ARRAYLEN(DimTxtArr) DO
            DimTxtArr[i] := '';
        IF NOT DimSetEntry.FINDSET THEN
            EXIT;
        Separation := '; ';
        REPEAT
            TxtToAdd := DimSetEntry."Dimension Code" + ' - ' + DimSetEntry."Dimension Value Code";
            IF DimTxtArrLength = 0 THEN
                StartNewLine := TRUE
            ELSE
                StartNewLine := STRLEN(DimTxtArr[DimTxtArrLength]) + STRLEN(Separation) + STRLEN(TxtToAdd) > MAXSTRLEN(DimTxtArr[1]);
            IF StartNewLine THEN BEGIN
                DimTxtArrLength += 1;
                DimTxtArr[DimTxtArrLength] := TxtToAdd
            END ELSE
                DimTxtArr[DimTxtArrLength] := DimTxtArr[DimTxtArrLength] + Separation + TxtToAdd;
        UNTIL DimSetEntry.NEXT = 0;
    end;

    [Scope('Personalization')]
    procedure InitializeRequest(NewShowInternalInfo: Boolean; NewShowCorrectionLines: Boolean; NewShowLotSN: Boolean)
    begin
        ShowInternalInfo := NewShowInternalInfo;
        ShowCorrectionLines := NewShowCorrectionLines;
        ShowLotSN := NewShowLotSN;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var ServiceShipmentHeader: Record "Service Shipment Header")
    begin
        FormatAddr.GetCompanyAddr(ServiceShipmentHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.ServiceShptShipTo(ShipToAddr, ServiceShipmentHeader);
        ShowCustAddr := FormatAddr.ServiceShptBillTo(CustAddr, ShipToAddr, ServiceShipmentHeader);
    end;

    local procedure FormatDocumentFields(ServiceShipmentHeader: Record "Service Shipment Header")
    begin
        WITH ServiceShipmentHeader DO BEGIN
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
        END;
    end;

    local procedure ___TRASER_ECM()
    begin
    end;

    local procedure ArchiveReport()
    var
        ServiceShipmentHeader: Record "Service Shipment Header";
        RecRef: RecordRef;
        OptionInt: Integer;
    begin
        IF (ECMReportMgt.IsArchiveModus = FALSE) AND
           (CurrReport.PREVIEW = FALSE) AND
           (ECMReportMgt.RepArchivingIsActive(CurrReport.OBJECTID(FALSE)) = TRUE)
        THEN BEGIN
            CLEAR(ECMReportMgt);
            ECMReportMgt.InitializeExport(CurrReport.OBJECTID(TRUE), CurrReport.OBJECTID(FALSE));
            ECMReportMgt.AddReportOption('NoOfCopies', FORMAT(NoOfCopies));
            ECMReportMgt.AddReportOption('ShowInternalInfo', ECMReportMgt.GetBooleanValue(ShowInternalInfo));
            ECMReportMgt.AddReportOption('ShowCorrectionLines', ECMReportMgt.GetBooleanValue(ShowCorrectionLines));
            ECMReportMgt.AddReportOption('ShowLotSN', ECMReportMgt.GetBooleanValue(ShowLotSN));
            ServiceShipmentHeader.SETRANGE("No.", "Service Shipment Header"."No.");
            ServiceShipmentHeader.FINDFIRST;
            RecRef.GETTABLE(ServiceShipmentHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

