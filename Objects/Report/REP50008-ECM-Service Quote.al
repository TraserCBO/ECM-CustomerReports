report 50008 "ECM - Service Quote"
{
    // version NAVW113.00,ECM130.1.00

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Service Quote.rdlc';

    Caption = 'Service Quote';

    dataset
    {
        dataitem("Service Header"; "Service Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.") WHERE ("Document Type" = CONST (Quote));
            RequestFilterFields = "No.", "Customer No.";
            column(DocumentType_ServHeader; "Document Type")
            {
            }
            column(No_ServHeader; "No.")
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EmailCaption; EmailCaptionLbl)
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
                    column(HomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(Email; CompanyInfo."E-Mail")
                    {
                    }
                    column(OrderTime_ServHeader; "Service Header"."Order Time")
                    {
                    }
                    column(OrderDate_ServHeader; FORMAT("Service Header"."Order Date"))
                    {
                    }
                    column(Status_ServHeader; "Service Header".Status)
                    {
                    }
                    column(No1_ServHeader; "Service Header"."No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(BilltoName_ServHeader; "Service Header"."Bill-to Name")
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(OrderConfirmationCopyText; STRSUBSTNO(Text001, CopyText))
                    {
                    }
                    column(CurrReportPageNo; STRSUBSTNO(Text002, FORMAT(CurrReport.PAGENO)))
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(EMail_ServHeader; "Service Header"."E-Mail")
                    {
                    }
                    column(PhoneNo_ServHeader; "Service Header"."Phone No.")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text002, ''))
                    {
                    }
                    column(SerHdrOrderDateCaption; SerHdrOrderDateCaptionLbl)
                    {
                    }
                    column(InvoicetoCaption; InvoicetoCaptionLbl)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(ServiceHeaderEMailCaption; ServiceHeaderEMailCaptionLbl)
                    {
                    }
                    column(OrderTime_ServHeaderCaption; "Service Header".FIELDCAPTION("Order Time"))
                    {
                    }
                    column(Status_ServHeaderCaption; "Service Header".FIELDCAPTION(Status))
                    {
                    }
                    column(No1_ServHeaderCaption; "Service Header".FIELDCAPTION("No."))
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoopNumber; Number)
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
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText,
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
                    dataitem("Service Order Comment"; "Service Comment Line")
                    {
                        DataItemLink = "Table Subtype" = FIELD ("Document Type"), "No." = FIELD ("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING ("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE ("Table Name" = CONST ("Service Header"), Type = CONST (General));
                        column(LineNo_ServOrderComment; "Line No.")
                        {
                        }
                        column(TblSubtype_ServOrderComm; "Table Subtype")
                        {
                        }
                        column(Type_ServOrderComment; Type)
                        {
                        }
                    }
                    dataitem("Service Item Line"; "Service Item Line")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(SerialNo_ServLineType; "Serial No.")
                        {
                        }
                        column(Description_ServLineType; Description)
                        {
                        }
                        column(ServItemNo_ServLineType; "Service Item No.")
                        {
                        }
                        column(SerItmGrCode_ServLineType; "Service Item Group Code")
                        {
                        }
                        column(Warranty_ServLineType; Warranty)
                        {
                        }
                        column(ItemNo_ServLineType; "Item No.")
                        {
                        }
                        column(LoanerNo_ServLineType; "Loaner No.")
                        {
                        }
                        column(ServShelfNo_ServLineType; "Service Shelf No.")
                        {
                        }
                        column(Warranty1_ServLineType; FORMAT(Warranty))
                        {
                        }
                        column(DocNo_ServLineType; "Document No.")
                        {
                        }
                        column(LineNo_ServLineType; "Line No.")
                        {
                        }
                        column(ServiceItemLinesCaption; ServiceItemLinesCaptionLbl)
                        {
                        }
                        column(SerialNo_ServLineTypeCaption; FIELDCAPTION("Serial No."))
                        {
                        }
                        column(Description_ServLineTypeCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(ServItemNo_ServLineTypeCaption; FIELDCAPTION("Service Item No."))
                        {
                        }
                        column(SerItmGrCode_ServLineTypeCaption; FIELDCAPTION("Service Item Group Code"))
                        {
                        }
                        column(Warranty_ServLineTypeCaption; FIELDCAPTION(Warranty))
                        {
                        }
                        column(ItemNo_ServLineTypeCaption; FIELDCAPTION("Item No."))
                        {
                        }
                        column(LoanerNo_ServLineTypeCaption; FIELDCAPTION("Loaner No."))
                        {
                        }
                        column(ServShelfNo_ServLineTypeCaption; FIELDCAPTION("Service Shelf No."))
                        {
                        }
                        dataitem("Fault Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = FIELD ("Document Type"), "No." = FIELD ("Document No."), "Table Line No." = FIELD ("Line No.");
                            DataItemTableView = SORTING ("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE ("Table Name" = CONST ("Service Header"), Type = CONST (Fault));
                            column(Comment_FaultComment; Comment)
                            {
                            }
                            column(Number_FaultComment; Number1)
                            {
                            }
                            column(TableSubtype_FaultComment; "Table Subtype")
                            {
                            }
                            column(Type_FaultComment; Type)
                            {
                            }
                            column(LineNo_FaultComment; "Line No.")
                            {
                            }
                            column(FaultCommentsCaption; FaultCommentsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                Number2 := 0;
                                Number1 := Number1 + 1;
                            end;
                        }
                        dataitem("Resolution Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = FIELD ("Document Type"), "No." = FIELD ("Document No."), "Table Line No." = FIELD ("Line No.");
                            DataItemTableView = SORTING ("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE ("Table Name" = CONST ("Service Header"), Type = CONST (Resolution));
                            column(Comment_ResolutionComment; Comment)
                            {
                            }
                            column(Number_ResolutionComment; Number2)
                            {
                            }
                            column(TblSubtype_ResolComment; "Table Subtype")
                            {
                            }
                            column(Type_ResolutionComment; Type)
                            {
                            }
                            column(LineNo_ResolutionComment; "Line No.")
                            {
                            }
                            column(ResolutionCommentsCaption; ResolutionCommentsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                Number1 := 0;
                                Number2 := Number2 + 1;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            Number1 := 0;
                            Number2 := 0;
                        end;
                    }
                    dataitem("Service Line"; "Service Line")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                        column(SerItemSlNo_ServLine; "Service Item Serial No.")
                        {
                        }
                        column(Type_ServLine; Type)
                        {
                        }
                        column(No_ServLine; "No.")
                        {
                        }
                        column(Description_ServLine; Description)
                        {
                        }
                        column(UnitPrice_ServLine; "Unit Price")
                        {
                        }
                        column(LineDiscount_ServLine; "Line Discount %")
                        {
                        }
                        column(Amt; Amt)
                        {
                        }
                        column(VariantCode_ServLine; "Variant Code")
                        {
                        }
                        column(GrossAmt; GrossAmt)
                        {
                        }
                        column(Quantity_ServLine; Quantity)
                        {
                        }
                        column(TotAmt; TotAmt)
                        {
                        }
                        column(TotGrossAmt; TotGrossAmt)
                        {
                        }
                        column(DocumentNo_ServLine; "Document No.")
                        {
                        }
                        column(LineNo_ServLine; "Line No.")
                        {
                        }
                        column(ServiceLineCaption; ServiceLineCaptionLbl)
                        {
                        }
                        column(AmtCaption; AmtCaptionLbl)
                        {
                        }
                        column(GrossAmountCaption; GrossAmountCaptionLbl)
                        {
                        }
                        column(SerItemSlNo_ServLineCaption; FIELDCAPTION("Service Item Serial No."))
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(Type_ServLineCaption; FIELDCAPTION(Type))
                        {
                        }
                        column(No_ServLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(Description_ServLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(UnitPrice_ServLineCaption; FIELDCAPTION("Unit Price"))
                        {
                        }
                        column(LineDiscount_ServLineCaption; FIELDCAPTION("Line Discount %"))
                        {
                        }
                        column(VariantCode_ServLineCaption; FIELDCAPTION("Variant Code"))
                        {
                        }
                        column(Quantity_ServLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        dataitem(DimesionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DimText1; DimText)
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
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Service Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            Amt := "Line Amount";
                            GrossAmt := "Amount Including VAT";

                            TotAmt := TotAmt + Amt;
                            TotGrossAmt := TotGrossAmt + GrossAmt;
                        end;
                    }
                    dataitem(Shipto; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddressCaption; ShipToAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    TotAmt := 0;
                    TotGrossAmt := 0;

                    IF Number > 1 THEN
                        CopyText := FormatDocument.GetCOPYText;
                    OutputNo += 1;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem()
                begin
                    //+++TRASER-ECM
                    IF NOT ECMReportMgt.IsArchiveModus THEN
                        //---TRASER-ECM
                        IF NOT IsReportInPreviewMode THEN
                            CODEUNIT.RUN(CODEUNIT::"Service-Printed", "Service Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                FormatAddressFields("Service Header");

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
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Service;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the service quotes that you want to print as interactions and add them to the Interaction Log Entry table.';
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
            LogInteraction := SegManagement.FindInteractTmplCode(25) <> '';
            LogInteractionEnable := LogInteraction;
        end;
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

    trigger OnPostReport()
    begin
        //+++TRASER-ECM
        IF NOT ECMReportMgt.IsArchiveModus THEN
            //---TRASER-ECM
            IF LogInteraction AND NOT IsReportInPreviewMode THEN
                IF "Service Header".FINDSET THEN
                    REPEAT
                        IF "Service Header"."Contact No." <> '' THEN
                            SegManagement.LogDocument(25, "Service Header"."No.", 0, 0, DATABASE::Contact, "Service Header"."Contact No.",
                              "Service Header"."Salesperson Code", '', '', '')
                        ELSE
                            SegManagement.LogDocument(25, "Service Header"."No.", 0, 0, DATABASE::Customer, "Service Header"."Customer No.",
                              "Service Header"."Salesperson Code", '', '', '');
                    UNTIL "Service Header".NEXT = 0;
    end;

    var
        Text001: Label 'Service Quote%1';
        Text002: Label 'Page %1';
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        ServiceSetup: Record "Service Mgt. Setup";
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        Number1: Integer;
        Number2: Integer;
        ShowInternalInfo: Boolean;
        ShowShippingAddr: Boolean;
        Continue: Boolean;
        CopyText: Text[30];
        CompanyAddr: array[8] of Text[50];
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        DimText: Text[120];
        OldDimText: Text[120];
        Amt: Decimal;
        TotAmt: Decimal;
        LogInteraction: Boolean;
        GrossAmt: Decimal;
        TotGrossAmt: Decimal;
        OutputNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        SerHdrOrderDateCaptionLbl: Label 'Order Date';
        InvoicetoCaptionLbl: Label 'Invoice to';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        ServiceHeaderEMailCaptionLbl: Label 'Email';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        ServiceItemLinesCaptionLbl: Label 'Service Item Lines';
        FaultCommentsCaptionLbl: Label 'Fault Comments';
        ResolutionCommentsCaptionLbl: Label 'Resolution Comments';
        ServiceLineCaptionLbl: Label 'Service Line';
        AmtCaptionLbl: Label 'Amount';
        GrossAmountCaptionLbl: Label 'Gross Amount';
        TotalCaptionLbl: Label 'Total';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        ShipToAddressCaptionLbl: Label 'Ship-to Address';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'Email';
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var ServiceHeader: Record "Service Header")
    begin
        FormatAddr.GetCompanyAddr(ServiceHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.ServiceOrderSellto(CustAddr, ServiceHeader);
        ShowShippingAddr := ServiceHeader."Ship-to Code" <> '';
        IF ShowShippingAddr THEN
            FormatAddr.ServiceOrderShipto(ShipToAddr, ServiceHeader);
    end;

    local procedure ___TRASER_ECM()
    begin
    end;

    local procedure ArchiveReport()
    var
        ServiceHeader: Record "Service Header";
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
            ECMReportMgt.AddReportOption('LogInteraction', ECMReportMgt.GetBooleanValue(LogInteraction));
            ServiceHeader.SETRANGE("Document Type", "Service Header"."Document Type");
            ServiceHeader.SETRANGE("No.", "Service Header"."No.");
            ServiceHeader.FINDFIRST;
            RecRef.GETTABLE(ServiceHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

