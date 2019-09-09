report 50007 "ECM - Service Order"
{
    // version NAVW113.02,ECM130.1.0

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Service Order.rdlc';

    Caption = 'Service Order';

    dataset
    {
        dataitem("Service Header"; "Service Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.") WHERE ("Document Type" = CONST (Order));
            RequestFilterFields = "No.", "Customer No.";
            column(No_ServHeader; "No.")
            {
            }
            column(No_ServHeaderCaption; FIELDCAPTION("No."))
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(CompanyInfoPicture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(ContractNo_ServHeader; "Service Header"."Contract No.")
                    {
                    }
                    column(OrderTime_ServHeader; "Service Header"."Order Time")
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
                    column(OrderDate_ServHeader; FORMAT("Service Header"."Order Date"))
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(Status_ServHeader; "Service Header".Status)
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
                    column(ServOrderCopyText; STRSUBSTNO(Text001, CopyText))
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(PhoneNo_ServHeader; "Service Header"."Phone No.")
                    {
                    }
                    column(Email_ServHeader; "Service Header"."E-Mail")
                    {
                    }
                    column(Description_ServHeader; "Service Header".Description)
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text002, ' '))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(ContractNoCaption; ContractNoCaptionLbl)
                    {
                    }
                    column(ServiceHeaderOrderDateCaption; ServiceHeaderOrderDateCaptionLbl)
                    {
                    }
                    column(InvoicetoCaption; InvoicetoCaptionLbl)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoFaxNoCaption; CompanyInfoFaxNoCaptionLbl)
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
                    column(Description_ServHeaderCaption; "Service Header".FIELDCAPTION(Description))
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_DimensionLoop1; Number)
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
                        column(Comment_ServOrderComment; Comment)
                        {
                        }
                        column(TabName_ServOrderComment; "Table Name")
                        {
                        }
                        column(No_ServOrderComment; "No.")
                        {
                        }
                        column(TableLineNo_ServOrderComment; "Table Line No.")
                        {
                        }
                    }
                    dataitem("Service Item Line"; "Service Item Line")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                        column(LineNo_ServItemLine; "Line No.")
                        {
                        }
                        column(SerialNo_ServItemLine; "Serial No.")
                        {
                        }
                        column(Description_ServItemLine; Description)
                        {
                        }
                        column(ItemNo_ServItemLineServ; "Service Item No.")
                        {
                        }
                        column(ServItemGroupCode_ServItemLine; "Service Item Group Code")
                        {
                        }
                        column(Warranty_ServItemLine; FORMAT(Warranty))
                        {
                        }
                        column(LoanerNo_ServItemLine; "Loaner No.")
                        {
                        }
                        column(RepairStatusCode_ServItemLine; "Repair Status Code")
                        {
                        }
                        column(ServShelfNo_ServItemLine; "Service Shelf No.")
                        {
                        }
                        column(ResponseTime_ServItemLine; FORMAT("Response Time"))
                        {
                        }
                        column(ResponseDate_ServItemLine; FORMAT("Response Date"))
                        {
                        }
                        column(DocumentNo_ServItemLine; "Document No.")
                        {
                        }
                        column(ServiceItemLineWarrantyCaption; CAPTIONCLASSTRANSLATE(FIELDCAPTION(Warranty)))
                        {
                        }
                        column(ServiceItemLinesCaption; ServiceItemLinesCaptionLbl)
                        {
                        }
                        column(ServiceItemLineResponseDateCaption; ServiceItemLineResponseDateCaptionLbl)
                        {
                        }
                        column(ServiceItemLineResponseTimeCaption; ServiceItemLineResponseTimeCaptionLbl)
                        {
                        }
                        column(SerialNo_ServItemLineCaption; FIELDCAPTION("Serial No."))
                        {
                        }
                        column(Description_ServItemLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(ItemNo_ServItemLineServCaption; FIELDCAPTION("Service Item No."))
                        {
                        }
                        column(ServItemGroupCode_ServItemLineCaption; FIELDCAPTION("Service Item Group Code"))
                        {
                        }
                        column(LoanerNo_ServItemLineCaption; FIELDCAPTION("Loaner No."))
                        {
                        }
                        column(RepairStatusCode_ServItemLineCaption; FIELDCAPTION("Repair Status Code"))
                        {
                        }
                        column(ServShelfNo_ServItemLineCaption; FIELDCAPTION("Service Shelf No."))
                        {
                        }
                        dataitem("Fault Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = FIELD ("Document Type"), "No." = FIELD ("Document No."), "Table Line No." = FIELD ("Line No.");
                            DataItemTableView = SORTING ("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE ("Table Name" = CONST ("Service Header"), Type = CONST (Fault));
                            column(Comment_FaultComment; Comment)
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
                        }
                        dataitem("Resolution Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = FIELD ("Document Type"), "No." = FIELD ("Document No."), "Table Line No." = FIELD ("Line No.");
                            DataItemTableView = SORTING ("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") WHERE ("Table Name" = CONST ("Service Header"), Type = CONST (Resolution));
                            column(Comment_ResolutionComment; Comment)
                            {
                            }
                            column(TableSubtype_ResolutionComment; "Table Subtype")
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
                        }
                    }
                    dataitem("Service Line"; "Service Line")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                        column(ServLineLineNo; "Line No.")
                        {
                        }
                        column(TotalAmt; TotalAmt)
                        {
                        }
                        column(TotalGrossAmt; TotalGrossAmt)
                        {
                        }
                        column(ServItemSerialNo_ServLine; "Service Item Serial No.")
                        {
                        }
                        column(Type_ServLine; Type)
                        {
                        }
                        column(No_ServLine; "No.")
                        {
                        }
                        column(VariantCode_ServLine; "Variant Code")
                        {
                        }
                        column(Description_ServLine; Description)
                        {
                        }
                        column(Qty; Qty)
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
                        column(GrossAmt; GrossAmt)
                        {
                        }
                        column(QtyConsumed_ServLine; "Quantity Consumed")
                        {
                        }
                        column(QtytoConsume_ServLine; "Qty. to Consume")
                        {
                        }
                        column(DocumentNo_ServLine; "Document No.")
                        {
                        }
                        column(QtyCaption; QtyCaptionLbl)
                        {
                        }
                        column(ServiceLinesCaption; ServiceLinesCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(GrossAmountCaption; GrossAmountCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(ServItemSerialNo_ServLineCaption; FIELDCAPTION("Service Item Serial No."))
                        {
                        }
                        column(Type_ServLineCaption; FIELDCAPTION(Type))
                        {
                        }
                        column(No_ServLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(VariantCode_ServLineCaption; FIELDCAPTION("Variant Code"))
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
                        column(QtyConsumed_ServLineCaption; FIELDCAPTION("Quantity Consumed"))
                        {
                        }
                        column(QtytoConsume_ServLineCaption; FIELDCAPTION("Qty. to Consume"))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DimText2; DimText)
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
                            IF ShowQty = ShowQty::Quantity THEN BEGIN
                                Qty := Quantity;
                                Amt := "Line Amount";
                                GrossAmt := "Amount Including VAT";
                            END ELSE BEGIN
                                IF "Quantity Invoiced" = 0 THEN
                                    CurrReport.SKIP;
                                Qty := "Quantity Invoiced";

                                Amt := ROUND((Qty * "Unit Price") * (1 - "Line Discount %" / 100));
                                GrossAmt := (1 + "VAT %" / 100) * Amt;
                            END;

                            TotalAmt += Amt;
                            TotalGrossAmt += GrossAmt;
                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.CREATETOTALS(Amt, GrossAmt);

                            TotalAmt := 0;
                            TotalGrossAmt := 0;
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
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
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
                    IF Number > 1 THEN BEGIN
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    END;

                    CurrReport.PAGENO := 1;
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
                    field(ShowQty; ShowQty)
                    {
                        ApplicationArea = Service;
                        Caption = 'Amounts Based on';
                        OptionCaption = 'Quantity,Quantity Invoiced';
                        ToolTip = 'Specifies the amounts that the service order is based on.';
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
        Text001: Label 'Service Order %1';
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
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutputNo: Integer;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ShowShippingAddr: Boolean;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[120];
        Qty: Decimal;
        Amt: Decimal;
        ShowQty: Option Quantity,"Quantity Invoiced";
        GrossAmt: Decimal;
        TotalAmt: Decimal;
        TotalGrossAmt: Decimal;
        ContractNoCaptionLbl: Label 'Contract No.';
        ServiceHeaderOrderDateCaptionLbl: Label 'Order Date';
        InvoicetoCaptionLbl: Label 'Invoice to';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoFaxNoCaptionLbl: Label 'Fax No.';
        ServiceHeaderEMailCaptionLbl: Label 'Email';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        ServiceItemLinesCaptionLbl: Label 'Service Item Lines';
        ServiceItemLineResponseDateCaptionLbl: Label 'Response Date';
        ServiceItemLineResponseTimeCaptionLbl: Label 'Response Time';
        FaultCommentsCaptionLbl: Label 'Fault Comments';
        ResolutionCommentsCaptionLbl: Label 'Resolution Comments';
        QtyCaptionLbl: Label 'Quantity';
        ServiceLinesCaptionLbl: Label 'Service Lines';
        AmountCaptionLbl: Label 'Amount';
        GrossAmountCaptionLbl: Label 'Gross Amount';
        TotalCaptionLbl: Label 'Total';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    [Scope('Personalization')]
    procedure InitializeRequest(ShowInternalInfoFrom: Boolean; ShowQtyFrom: Option)
    begin
        ShowInternalInfo := ShowInternalInfoFrom;
        ShowQty := ShowQtyFrom;
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
            OptionInt := ShowQty;
            ECMReportMgt.AddReportOption('ShowQty', FORMAT(OptionInt));
            ServiceHeader.SETRANGE("Document Type", "Service Header"."Document Type");
            ServiceHeader.SETRANGE("No.", "Service Header"."No.");
            ServiceHeader.FINDFIRST;
            RecRef.GETTABLE(ServiceHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

