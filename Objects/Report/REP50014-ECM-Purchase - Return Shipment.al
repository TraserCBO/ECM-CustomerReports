report 50014 "ECM-Purchase - Return Shipment"
{
    // version NAVW113.02,ECM130.1.00

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Purchase - Return Shipment.rdlc';

    Caption = 'Purchase - Return Shipment';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Return Shipment Header"; "Return Shipment Header")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Posted Return Shipment';
            column(No_ReturnShipmentHeader; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(PurchReturnShpCaption; STRSUBSTNO(Text002, CopyText))
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEMail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(DocDate_ReturnShpHeader; FORMAT("Return Shipment Header"."Document Date", 0, 4))
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourReference_ReturnShpHdr; "Return Shipment Header"."Your Reference")
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(BuyfromVendNo_ReturnShpHdr; "Return Shipment Header"."Buy-from Vendor No.")
                    {
                    }
                    column(BuyfromVendNo_ReturnShpHdrCaption; "Return Shipment Header".FIELDCAPTION("Buy-from Vendor No."))
                    {
                    }
                    column(ShptBuyFromAddr1; ShptBuyFromAddr[1])
                    {
                    }
                    column(ShptBuyFromAddr2; ShptBuyFromAddr[2])
                    {
                    }
                    column(ShptBuyFromAddr3; ShptBuyFromAddr[3])
                    {
                    }
                    column(ShptBuyFromAddr4; ShptBuyFromAddr[4])
                    {
                    }
                    column(ShptBuyFromAddr5; ShptBuyFromAddr[5])
                    {
                    }
                    column(ShptBuyFromAddr6; ShptBuyFromAddr[6])
                    {
                    }
                    column(ShptBuyFromAddr7; ShptBuyFromAddr[7])
                    {
                    }
                    column(ShptBuyFromAddr8; ShptBuyFromAddr[8])
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text003, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegNoCaption; CompanyInfoVATRegNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankAccountNoCaption; CompanyInfoBankAccountNoCaptionLbl)
                    {
                    }
                    column(ReturnShipmentHeaderNoCaption; ReturnShipmentHeaderNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoHomePageCaption; CompanyInfoHomePageCaptionLbl)
                    {
                    }
                    column(CompanyEmailCaption; CompanyEmailCaptionLbl)
                    {
                    }
                    column(DocumentDataCaption; DocumentDataCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Return Shipment Header";
                        DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_Integer; Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Return Shipment Line"; "Return Shipment Line")
                    {
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Return Shipment Header";
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        column(TypeInt; TypeInt)
                        {
                        }
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(Description_ReturnShpLine; Description)
                        {
                        }
                        column(UOM_ReturnShpLine; "Unit of Measure")
                        {
                        }
                        column(Qty_ReturnShipmentLine; Quantity)
                        {
                        }
                        column(No_ReturnShipmentLine; "No.")
                        {
                        }
                        column(LineNo_ReturnShipmentLine; "Line No.")
                        {
                        }
                        column(UOM_ReturnShpLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(Qty_ReturnShipmentLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(Description_ReturnShpLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(No_ReturnShipmentLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DimText_DimensionLoop2; DimText)
                            {
                            }
                            column(Number_DimensionLoop2; Number)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF (NOT ShowCorrectionLines) AND Correction THEN
                                CurrReport.SKIP;

                            DimSetEntry2.SETRANGE("Dimension Set ID", "Dimension Set ID");
                            TypeInt := Type;
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

                        trigger OnAfterGetRecord()
                        begin
                            PayToVendorNo := "Return Shipment Header"."Pay-to Vendor No.";
                            BuyFromVendorNo := "Return Shipment Header"."Buy-from Vendor No.";
                            PayToCaption := "Return Shipment Header".FIELDCAPTION("Pay-to Vendor No.");
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF "Return Shipment Header"."Buy-from Vendor No." = "Return Shipment Header"."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(ShptShipToAddr1; ShptShipToAddr[1])
                        {
                        }
                        column(ShptShipToAddr2; ShptShipToAddr[2])
                        {
                        }
                        column(ShptShipToAddr3; ShptShipToAddr[3])
                        {
                        }
                        column(ShptShipToAddr4; ShptShipToAddr[4])
                        {
                        }
                        column(ShptShipToAddr5; ShptShipToAddr[5])
                        {
                        }
                        column(ShptShipToAddr6; ShptShipToAddr[6])
                        {
                        }
                        column(ShptShipToAddr7; ShptShipToAddr[7])
                        {
                        }
                        column(ShptShipToAddr8; ShptShipToAddr[8])
                        {
                        }
                        column(PayToVendorNo; PayToVendorNo)
                        {
                        }
                        column(BuyFromVendorNo; BuyFromVendorNo)
                        {
                        }
                        column(PayToVendorNo_Total2; PayToCaption)
                        {
                        }
                        column(ShptShipToAddrCaption; ShptShipToAddrCaptionLbl)
                        {
                        }
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem()
                begin
                    //+++TRASER-ECM
                    IF NOT ECMReportMgt.IsArchiveModus THEN
                        //---TRASER-ECM
                        IF NOT IsReportInPreviewMode THEN
                            CODEUNIT.RUN(CODEUNIT::"Return Shipment - Printed", "Return Shipment Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                Language: Record Language;
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                FormatAddressFields("Return Shipment Header");
                FormatDocumentFields("Return Shipment Header");

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");
                //+++TRASER-ECM
                ArchiveReport;
                //---TRASER-ECM
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
                        ApplicationArea = PurchReturnOrder;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = PurchReturnOrder;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ShowCorrectionLines; ShowCorrectionLines)
                    {
                        ApplicationArea = PurchReturnOrder;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = PurchReturnOrder;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to log this interaction.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.GET;
    end;

    trigger OnPostReport()
    begin
        //+++TRASER-ECM
        IF NOT ECMReportMgt.IsArchiveModus THEN
            //---TRASER-ECM
            IF LogInteraction AND NOT IsReportInPreviewMode THEN
                IF "Return Shipment Header".FINDSET THEN
                    REPEAT
                        SegManagement.LogDocument(21, "Return Shipment Header"."No.", 0, 0, DATABASE::Vendor,
                          "Return Shipment Header"."Buy-from Vendor No.", "Return Shipment Header"."Purchaser Code", '',
                          "Return Shipment Header"."Posting Description", '');
                    UNTIL "Return Shipment Header".NEXT = 0;
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text002: Label 'Purchase - Return Shipment %1', Comment = '%1 = Document No.';
        Text003: Label 'Page %1';
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ShptShipToAddr: array[8] of Text[50];
        ShptBuyFromAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        ReferenceText: Text[80];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        MoreLines: Boolean;
        ShowCorrectionLines: Boolean;
        LogInteraction: Boolean;
        OutputNo: Integer;
        TypeInt: Integer;
        PayToVendorNo: Code[20];
        BuyFromVendorNo: Code[20];
        PayToCaption: Text[30];
        [InDataSet]
        LogInteractionEnable: Boolean;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCaptionLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccountNoCaptionLbl: Label 'Account No.';
        ReturnShipmentHeaderNoCaptionLbl: Label 'Shipment No.';
        CompanyInfoHomePageCaptionLbl: Label 'Home Page';
        CompanyEmailCaptionLbl: Label 'Email';
        DocumentDataCaptionLbl: Label 'Document Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        ShptShipToAddrCaptionLbl: Label 'Ship-to Address';
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    [Scope('Personalization')]
    procedure InitializeRequest(NewNoOfCopies: Decimal; NewShowInternalInfo: Boolean; NewShowCorrectionLines: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        ShowCorrectionLines := NewShowCorrectionLines;
        LogInteraction := NewLogInteraction;
    end;

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(21) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var ReturnShipmentHeader: Record "Return Shipment Header")
    begin
        FormatAddr.GetCompanyAddr(ReturnShipmentHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.PurchShptBuyFrom(ShptBuyFromAddr, ReturnShipmentHeader);
        FormatAddr.PurchShptShipTo(ShptShipToAddr, ReturnShipmentHeader);
    end;

    local procedure FormatDocumentFields(ReturnShipmentHeader: Record "Return Shipment Header")
    begin
        WITH ReturnShipmentHeader DO BEGIN
            FormatDocument.SetPurchaser(SalesPurchPerson, "Purchaser Code", PurchaserText);

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
        END;
    end;

    local procedure ___TRASER_ECM()
    begin
    end;

    local procedure ArchiveReport()
    var
        ReturnShipmentHeader: Record "Return Shipment Header";
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
            ECMReportMgt.AddReportOption('LogInteraction', ECMReportMgt.GetBooleanValue(LogInteraction));
            ReturnShipmentHeader.SETRANGE("No.", "Return Shipment Header"."No.");
            ReturnShipmentHeader.FINDFIRST;
            RecRef.GETTABLE(ReturnShipmentHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

