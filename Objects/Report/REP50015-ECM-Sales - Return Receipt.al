report 50015 "ECM - Sales - Return Receipt"
{
    // version NAVW113.02,ECM130.1.00

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Sales - Return Receipt.rdlc';

    Caption = 'Sales - Return Receipt';

    dataset
    {
        dataitem("Return Receipt Header"; "Return Receipt Header")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Return Receipt';
            column(No_ReturnRcptHeader; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(SalesReturnRcptCopyText; STRSUBSTNO(Text002, CopyText))
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
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
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
                    column(SellCustNo_ReturnRcptHdr; "Return Receipt Header"."Sell-to Customer No.")
                    {
                    }
                    column(SellCustNo_ReturnRcptHdrCaption; "Return Receipt Header".FIELDCAPTION("Sell-to Customer No."))
                    {
                    }
                    column(DocDate_ReturnRcptHeader; FORMAT("Return Receipt Header"."Document Date", 0, 4))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_ReturnRcptHeader; "Return Receipt Header"."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_ReturnRcptHeader; "Return Receipt Header"."Your Reference")
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
                    column(ShptDt_ReturnRcptHeader; FORMAT("Return Receipt Header"."Shipment Date"))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text003, ''))
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegNoCptn; CompanyInfoVATRegNoCptnLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCptn; CompanyInfoBankNameCptnLbl)
                    {
                    }
                    column(CompanyInfoBankAccNoCptn; CompanyInfoBankAccNoCptnLbl)
                    {
                    }
                    column(ReturnReceiptHeaderNoCptn; ReturnReceiptHeaderNoCptnLbl)
                    {
                    }
                    column(ReturnRcptHdrShptDtCptn; ReturnRcptHdrShptDtCptnLbl)
                    {
                    }
                    column(DocumentDateCaption; DocumentDateCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Return Receipt Header";
                        DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Number; Number)
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
                    dataitem("Return Receipt Line"; "Return Receipt Line")
                    {
                        DataItemLink = "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Return Receipt Header";
                        DataItemTableView = SORTING ("Document No.", "Line No.");
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(TypeInt; TypeInt)
                        {
                        }
                        column(Desc_ReturnReceiptLine; Description)
                        {
                        }
                        column(UOM_ReturnReceiptLine; "Unit of Measure")
                        {
                        }
                        column(Qty_ReturnReceiptLine; Quantity)
                        {
                        }
                        column(No_ReturnReceiptLine; "No.")
                        {
                        }
                        column(UOM_ReturnReceiptLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(Qty_ReturnReceiptLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(Desc_ReturnReceiptLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(No_ReturnReceiptLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(LineNo_ReturnReceiptLine; "Line No.")
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(DimensionLoop2Number; Number)
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
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(BilltoCustNo_ReturnRcptHdr; "Return Receipt Header"."Bill-to Customer No.")
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
                        column(BilltoAddressCaption; BilltoAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowCustAddr THEN
                                CurrReport.BREAK;
                        end;
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
                            CODEUNIT.RUN(CODEUNIT::"Return Receipt - Printed", "Return Receipt Header");
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
            var
                Language: Record Language;
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                FormatAddressFields("Return Receipt Header");
                FormatDocumentFields("Return Receipt Header");

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
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ShowCorrectionLines; ShowCorrectionLines)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to record the sales return receipts you print as Interactions and add them to the Interaction Log Entry table.';
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
        SalesSetup.GET;
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);
    end;

    trigger OnPostReport()
    begin
        //+++TRASER-ECM
        IF NOT ECMReportMgt.IsArchiveModus THEN
            //---TRASER-ECM
            IF LogInteraction AND NOT IsReportInPreviewMode THEN
                IF "Return Receipt Header".FINDSET THEN
                    REPEAT
                        SegManagement.LogDocument(20, "Return Receipt Header"."No.", 0, 0, DATABASE::Customer,
                          "Return Receipt Header"."Bill-to Customer No.", "Return Receipt Header"."Salesperson Code",
                          "Return Receipt Header"."Campaign No.", "Return Receipt Header"."Posting Description", '');
                    UNTIL "Return Receipt Header".NEXT = 0;
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text002: Label 'Sales - Return Receipt %1', Comment = '%1 = Document No.';
        Text003: Label 'Page %1';
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        SalesSetup: Record "Sales & Receivables Setup";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        SalesPersonText: Text[20];
        ReferenceText: Text[80];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        MoreLines: Boolean;
        ShowCustAddr: Boolean;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        ShowCorrectionLines: Boolean;
        LogInteraction: Boolean;
        OutputNo: Integer;
        TypeInt: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCptnLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCptnLbl: Label 'Bank';
        CompanyInfoBankAccNoCptnLbl: Label 'Account No.';
        ReturnReceiptHeaderNoCptnLbl: Label 'Receipt No.';
        ReturnRcptHdrShptDtCptnLbl: Label 'Shipment Date';
        DocumentDateCaptionLbl: Label 'Document Date';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        BilltoAddressCaptionLbl: Label 'Bill-to Address';
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    [Scope('Personalization')]
    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(20) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(ReturnReceiptHeader: Record "Return Receipt Header")
    begin
        FormatAddr.GetCompanyAddr(ReturnReceiptHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesRcptShipTo(ShipToAddr, ReturnReceiptHeader);
        ShowCustAddr := FormatAddr.SalesRcptBillTo(CustAddr, ShipToAddr, ReturnReceiptHeader);
    end;

    local procedure FormatDocumentFields(ReturnReceiptHeader: Record "Return Receipt Header")
    begin
        WITH ReturnReceiptHeader DO BEGIN
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
        END;
    end;

    local procedure ___TRASER_ECM()
    begin
    end;

    local procedure ArchiveReport()
    var
        ReturnReceiptHeader: Record "Return Receipt Header";
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
            ReturnReceiptHeader.SETRANGE("No.", "Return Receipt Header"."No.");
            ReturnReceiptHeader.FINDFIRST;
            RecRef.GETTABLE(ReturnReceiptHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

