report 50006 "ECM - Order"
{
    // version NAVW113.02,NAVDACH13.02,ECM130.2.00

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Order.rdlc';

    Caption = 'Order';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.") WHERE ("Document Type" = CONST (Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Purchase Order';
            column(Purchase_Header_Document_Type; "Document Type")
            {
            }
            column(Purchase_Header_No_; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(STRSUBSTNO_Text004_CopyText_; STRSUBSTNO(Text004, CopyText))
                    {
                    }
                    column(STRSUBSTNO_Text005_FORMAT_CurrReport_PAGENO__; STRSUBSTNO(Text005, FORMAT(CurrReport.PAGENO)))
                    {
                    }
                    column(CompanyAddr_1_; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr_2_; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr_3_; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr_4_; CompanyAddr[4])
                    {
                    }
                    column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfo__VAT_Registration_No__; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfo__Giro_No__; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfo__Bank_Name_; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfo__Bank_Account_No__; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(FORMAT__Purchase_Header___Document_Date__0_4_; FORMAT("Purchase Header"."Document Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(Purchase_Header___VAT_Registration_No__; "Purchase Header"."VAT Registration No.")
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPerson_Name; SalesPurchPerson.Name)
                    {
                    }
                    column(Purchase_Header___No__; "Purchase Header"."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(Purchase_Header___Your_Reference_; "Purchase Header"."Your Reference")
                    {
                    }
                    column(CompanyAddr_5_; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr_6_; CompanyAddr[6])
                    {
                    }
                    column(Purchase_Header___Buy_from_Vendor_No__; "Purchase Header"."Buy-from Vendor No.")
                    {
                    }
                    column(BuyFromAddr_1_; BuyFromAddr[1])
                    {
                    }
                    column(BuyFromAddr_2_; BuyFromAddr[2])
                    {
                    }
                    column(BuyFromAddr_3_; BuyFromAddr[3])
                    {
                    }
                    column(BuyFromAddr_4_; BuyFromAddr[4])
                    {
                    }
                    column(BuyFromAddr_5_; BuyFromAddr[5])
                    {
                    }
                    column(BuyFromAddr_6_; BuyFromAddr[6])
                    {
                    }
                    column(BuyFromAddr_7_; BuyFromAddr[7])
                    {
                    }
                    column(BuyFromAddr_8_; BuyFromAddr[8])
                    {
                    }
                    column(Purchase_Header___Prices_Including_VAT_; "Purchase Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(Purchase_Header___VAT_Base_Discount___; "Purchase Header"."VAT Base Discount %")
                    {
                    }
                    column(PricesInclVATtxt; PricesInclVATtxt)
                    {
                    }
                    column(ShowInternalInfo; ShowInternalInfo)
                    {
                    }
                    column(DimText; DimText)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    column(CompanyInfo__Phone_No__Caption; CompanyInfo__Phone_No__CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Fax_No__Caption; CompanyInfo__Fax_No__CaptionLbl)
                    {
                    }
                    column(CompanyInfo__VAT_Registration_No__Caption; CompanyInfo__VAT_Registration_No__CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Giro_No__Caption; CompanyInfo__Giro_No__CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Bank_Name_Caption; CompanyInfo__Bank_Name_CaptionLbl)
                    {
                    }
                    column(CompanyInfo__Bank_Account_No__Caption; CompanyInfo__Bank_Account_No__CaptionLbl)
                    {
                    }
                    column(Order_No_Caption; Order_No_CaptionLbl)
                    {
                    }
                    column(Purchase_Header___Buy_from_Vendor_No__Caption; "Purchase Header".FIELDCAPTION("Buy-from Vendor No."))
                    {
                    }
                    column(Purchase_Header___Prices_Including_VAT_Caption; "Purchase Header".FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                        column(DimensionLoop1_Number; Number)
                        {
                        }
                        column(Header_DimensionsCaption; Header_DimensionsCaptionLbl)
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
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem()
                        begin
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(PurchLine__Line_Amount_; PurchLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Purchase_Line__Description; "Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line___Line_No__; "Purchase Line"."Line No.")
                        {
                        }
                        column(AllowInvDisctxt; AllowInvDisctxt)
                        {
                        }
                        column(Purchase_Line__Type; FORMAT("Purchase Line".Type, 0, 2))
                        {
                        }
                        column(Purchase_Line___No__; "Purchase Line"."No.")
                        {
                        }
                        column(Purchase_Line__Description_Control63; "Purchase Line".Description)
                        {
                        }
                        column(Purchase_Line__Quantity; "Purchase Line".Quantity)
                        {
                        }
                        column(Purchase_Line___Unit_of_Measure_; "Purchase Line"."Unit of Measure")
                        {
                        }
                        column(Purchase_Line___Direct_Unit_Cost_; "Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Purchase_Line___Line_Discount___; "Purchase Line"."Line Discount %")
                        {
                        }
                        column(Purchase_Line___Line_Amount_; "Purchase Line"."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Purchase_Line___Allow_Invoice_Disc__; "Purchase Line"."Allow Invoice Disc.")
                        {
                        }
                        column(Purchase_Line___VAT_Identifier_; "Purchase Line"."VAT Identifier")
                        {
                        }
                        column(PurchLine__Line_Amount__Control77; PurchLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PurchLine__Inv__Discount_Amount_; -PurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PurchLine__Line_Amount__Control109; PurchLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(PurchLine__Line_Amount__PurchLine__Inv__Discount_Amount_; PurchLine."Line Amount" - PurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATAmountLine_VATAmountText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PurchLine__Line_Amount__PurchLine__Inv__Discount_Amount____VATAmount; PurchLine."Line Amount" - PurchLine."Inv. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(PurchLine__Line_Amount__PurchLine__Inv__Discount_Amount__Control147; PurchLine."Line Amount" - PurchLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine_VATAmountText_Control32; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText_Control51; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText_Control69; TotalInclVATText)
                        {
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount_Control83; VATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(RoundLoop_Number; Number)
                        {
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscountAmount; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Purchase_Line___No__Caption; "Purchase Line".FIELDCAPTION("No."))
                        {
                        }
                        column(Purchase_Line__Description_Control63Caption; "Purchase Line".FIELDCAPTION(Description))
                        {
                        }
                        column(Purchase_Line__QuantityCaption; "Purchase Line".FIELDCAPTION(Quantity))
                        {
                        }
                        column(Purchase_Line___Unit_of_Measure_Caption; "Purchase Line".FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(Direct_Unit_CostCaption; Direct_Unit_CostCaptionLbl)
                        {
                        }
                        column(Purchase_Line___Line_Discount___Caption; Purchase_Line___Line_Discount___CaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(Purchase_Line___Allow_Invoice_Disc__Caption; "Purchase Line".FIELDCAPTION("Allow Invoice Disc."))
                        {
                        }
                        column(Purchase_Line___VAT_Identifier_Caption; "Purchase Line".FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(ContinuedCaption; ContinuedCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control76; ContinuedCaption_Control76Lbl)
                        {
                        }
                        column(PurchLine__Inv__Discount_Amount_Caption; PurchLine__Inv__Discount_Amount_CaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(VATDiscountAmountCaption; VATDiscountAmountCaptionLbl)
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DimensionLoop2_Number; Number)
                            {
                            }
                            column(Line_DimensionsCaption; Line_DimensionsCaptionLbl)
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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Purchase Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN
                                PurchLine.FIND('-')
                            ELSE
                                PurchLine.NEXT;
                            "Purchase Line" := PurchLine;

                            IF NOT "Purchase Header"."Prices Including VAT" AND
                               (PurchLine."VAT Calculation Type" = PurchLine."VAT Calculation Type"::"Full VAT")
                            THEN
                                PurchLine."Line Amount" := 0;

                            IF ("Purchase Line"."Cross-Reference No." <> '') AND (NOT ShowInternalInfo) THEN
                                "Purchase Line"."No." := "Purchase Line"."Cross-Reference No.";
                            IF (PurchLine.Type = PurchLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Purchase Line"."No." := '';
                            AllowInvDisctxt := FORMAT("Purchase Line"."Allow Invoice Disc.");
                            TotalSubTotal += "Purchase Line"."Line Amount";
                            TotalInvoiceDiscountAmount -= "Purchase Line"."Inv. Discount Amount";
                            TotalAmount += "Purchase Line".Amount;
                        end;

                        trigger OnPostDataItem()
                        begin
                            PurchLine.DELETEALL;
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := PurchLine.FIND('+');
                            WHILE MoreLines AND (PurchLine.Description = '') AND (PurchLine."Description 2" = '') AND
                                  (PurchLine."No." = '') AND (PurchLine.Quantity = 0) AND
                                  (PurchLine.Amount = 0)
                            DO
                                MoreLines := PurchLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            PurchLine.SETRANGE("Line No.", 0, PurchLine."Line No.");
                            SETRANGE(Number, 1, PurchLine.COUNT);
                            CurrReport.CREATETOTALS(PurchLine."Line Amount", PurchLine."Inv. Discount Amount");
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VATAmountLine__VAT_Base_; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount_; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount_; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount_; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount_; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT___; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmountLine__VAT_Base__Control99; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control100; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Identifier_; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmountLine__Line_Amount__Control131; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control132; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control133; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control103; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control104; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control56; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control57; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control58; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control107; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control108; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control59; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control60; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control61; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATCounter_Number; Number)
                        {
                        }
                        column(VATAmountLine__VAT___Caption; VATAmountLine__VAT___CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control99Caption; VATAmountLine__VAT_Base__Control99CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Amount__Control100Caption; VATAmountLine__VAT_Amount__Control100CaptionLbl)
                        {
                        }
                        column(VAT_Amount_SpecificationCaption; VAT_Amount_SpecificationCaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier_Caption; VATAmountLine__VAT_Identifier_CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control132Caption; VATAmountLine__Inv__Disc__Base_Amount__Control132CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Line_Amount__Control131Caption; VATAmountLine__Line_Amount__Control131CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control133Caption; VATAmountLine__Invoice_Discount_Amount__Control133CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base_Caption; VATAmountLine__VAT_Base_CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control103Caption; VATAmountLine__VAT_Base__Control103CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control107Caption; VATAmountLine__VAT_Base__Control107CaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF VATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY_Control158; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control159; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT____Control160; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmountLine__VAT_Identifier__Control161; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VALVATAmountLCY_Control162; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control163; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY_Control165; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY_Control166; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATCounterLCY_Number; Number)
                        {
                        }
                        column(VALVATAmountLCY_Control158Caption; VALVATAmountLCY_Control158CaptionLbl)
                        {
                        }
                        column(VALVATBaseLCY_Control159Caption; VALVATBaseLCY_Control159CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT____Control160Caption; VATAmountLine__VAT____Control160CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier__Control161Caption; VATAmountLine__VAT_Identifier__Control161CaptionLbl)
                        {
                        }
                        column(VALVATBaseLCYCaption; VALVATBaseLCYCaptionLbl)
                        {
                        }
                        column(VALVATBaseLCY_Control163Caption; VALVATBaseLCY_Control163CaptionLbl)
                        {
                        }
                        column(VALVATBaseLCY_Control166Caption; VALVATBaseLCY_Control166CaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                "Purchase Header"."Posting Date", "Purchase Header"."Currency Code", "Purchase Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Purchase Header"."Currency Code" = '') OR
                               (VATAmountLine.GetTotalVATAmount = 0)
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Purchase Header"."Posting Date", "Purchase Header"."Currency Code", 1);
                            VALExchRate := STRSUBSTNO(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(PaymentTerms_Description; PaymentTerms.Description)
                        {
                        }
                        column(ShipmentMethod_Description; ShipmentMethod.Description)
                        {
                        }
                        column(Total_Number; Number)
                        {
                        }
                        column(PaymentTerms_DescriptionCaption; PaymentTerms_DescriptionCaptionLbl)
                        {
                        }
                        column(ShipmentMethod_DescriptionCaption; ShipmentMethod_DescriptionCaptionLbl)
                        {
                        }
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(Purchase_Header___Pay_to_Vendor_No__; "Purchase Header"."Pay-to Vendor No.")
                        {
                        }
                        column(VendAddr_8_; VendAddr[8])
                        {
                        }
                        column(VendAddr_7_; VendAddr[7])
                        {
                        }
                        column(VendAddr_6_; VendAddr[6])
                        {
                        }
                        column(VendAddr_5_; VendAddr[5])
                        {
                        }
                        column(VendAddr_4_; VendAddr[4])
                        {
                        }
                        column(VendAddr_3_; VendAddr[3])
                        {
                        }
                        column(VendAddr_2_; VendAddr[2])
                        {
                        }
                        column(VendAddr_1_; VendAddr[1])
                        {
                        }
                        column(Total2_Number; Number)
                        {
                        }
                        column(Payment_DetailsCaption; Payment_DetailsCaptionLbl)
                        {
                        }
                        column(Vendor_No_Caption; Vendor_No_CaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF "Purchase Header"."Buy-from Vendor No." = "Purchase Header"."Pay-to Vendor No." THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(Total3; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(Purchase_Header___Sell_to_Customer_No__; "Purchase Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr_1_; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr_2_; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr_3_; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr_4_; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr_5_; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr_6_; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr_7_; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr_8_; ShipToAddr[8])
                        {
                        }
                        column(Total3_Number; Number)
                        {
                        }
                        column(Ship_to_AddressCaption; Ship_to_AddressCaptionLbl)
                        {
                        }
                        column(Purchase_Header___Sell_to_Customer_No__Caption; "Purchase Header".FIELDCAPTION("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF ("Purchase Header"."Sell-to Customer No." = '') AND (ShipToAddr[1] = '') THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem(PrepmtLoop; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                        column(PrepmtLineAmount; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalPrepmtLineAmount; TotalPrepmtLineAmount)
                        {
                        }
                        column(PrepmtInvBuf__G_L_Account_No__; PrepmtInvBuf."G/L Account No.")
                        {
                        }
                        column(PrepmtLineAmount_Control173; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                        }
                        column(PrepmtInvBuf_Description; PrepmtInvBuf.Description)
                        {
                        }
                        column(PrepmtLineAmount_Control177; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText_Control182; TotalExclVATText)
                        {
                        }
                        column(PrepmtInvBuf_Amount; PrepmtInvBuf.Amount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine_VATAmountText; PrepmtVATAmountLine.VATAmountText)
                        {
                        }
                        column(PrepmtVATAmount; PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_Control186; TotalInclVATText)
                        {
                        }
                        column(PrepmtInvBuf_Amount___PrepmtVATAmount; PrepmtInvBuf.Amount + PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_Control188; TotalInclVATText)
                        {
                        }
                        column(VATAmountLine_VATAmountText_Control189; VATAmountLine.VATAmountText)
                        {
                        }
                        column(PrepmtVATAmount_Control190; PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText_Control192; TotalExclVATText)
                        {
                        }
                        column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtLoop_Number; Number)
                        {
                        }
                        column(PrepmtLineAmount_Control173Caption; PrepmtLineAmount_Control173CaptionLbl)
                        {
                        }
                        column(PrepmtInvBuf_DescriptionCaption; PrepmtInvBuf_DescriptionCaptionLbl)
                        {
                        }
                        column(PrepmtLoopLineNo; PrepmtLoopLineNo)
                        {
                        }
                        column(PrepmtInvBuf__G_L_Account_No__Caption; PrepmtInvBuf__G_L_Account_No__CaptionLbl)
                        {
                        }
                        column(Prepayment_SpecificationCaption; Prepayment_SpecificationCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control176; ContinuedCaption_Control176Lbl)
                        {
                        }
                        column(ContinuedCaption_Control178; ContinuedCaption_Control178Lbl)
                        {
                        }
                        column(Line_DimensionsCaption_Control180; Line_DimensionsCaption_Control180Lbl)
                        {
                        }
                        dataitem(PrepmtDimLoop; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DummyColumn; 0)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT PrepmtDimSetEntry.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', PrepmtDimSetEntry."Dimension Code", PrepmtDimSetEntry."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            PrepmtDimSetEntry."Dimension Code", PrepmtDimSetEntry."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL PrepmtDimSetEntry.NEXT = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                PrepmtDimSetEntry.SETRANGE("Dimension Set ID", PrepmtInvBuf."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT PrepmtInvBuf.FIND('-') THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF PrepmtInvBuf.NEXT = 0 THEN
                                    CurrReport.BREAK;

                            IF "Purchase Header"."Prices Including VAT" THEN
                                PrepmtLineAmount := PrepmtInvBuf."Amount Incl. VAT"
                            ELSE
                                PrepmtLineAmount := PrepmtInvBuf.Amount;

                            PrepmtLoopLineNo += 1;
                            TotalPrepmtLineAmount += PrepmtLineAmount;
                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.CREATETOTALS(
                              PrepmtInvBuf.Amount, PrepmtInvBuf."Amount Incl. VAT",
                              PrepmtVATAmountLine."Line Amount", PrepmtVATAmountLine."VAT Base",
                              PrepmtVATAmountLine."VAT Amount",
                              PrepmtLineAmount);
                            PrepmtLoopLineNo := 0;
                            TotalPrepmtLineAmount := 0;
                        end;
                    }
                    dataitem(PrepmtVATCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(PrepmtVATAmountLine__VAT_Amount_; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT_Base_; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__Line_Amount_; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT___; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(PrepmtVATAmountLine__VAT_Amount__Control194; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT_Base__Control195; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__Line_Amount__Control196; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT____Control197; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(PrepmtVATAmountLine__VAT_Identifier_; PrepmtVATAmountLine."VAT Identifier")
                        {
                        }
                        column(PrepmtVATAmountLine__VAT_Amount__Control210; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT_Base__Control211; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__Line_Amount__Control212; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT____Control213; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(PrepmtVATAmountLine__VAT_Amount__Control215; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__VAT_Base__Control216; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmountLine__Line_Amount__Control217; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATCounter_Number; Number)
                        {
                        }
                        column(PrepmtVATAmountLine__VAT_Amount__Control194Caption; PrepmtVATAmountLine__VAT_Amount__Control194CaptionLbl)
                        {
                        }
                        column(PrepmtVATAmountLine__VAT_Base__Control195Caption; PrepmtVATAmountLine__VAT_Base__Control195CaptionLbl)
                        {
                        }
                        column(PrepmtVATAmountLine__Line_Amount__Control196Caption; PrepmtVATAmountLine__Line_Amount__Control196CaptionLbl)
                        {
                        }
                        column(PrepmtVATAmountLine__VAT____Control197Caption; PrepmtVATAmountLine__VAT____Control197CaptionLbl)
                        {
                        }
                        column(Prepayment_VAT_Amount_SpecificationCaption; Prepayment_VAT_Amount_SpecificationCaptionLbl)
                        {
                        }
                        column(PrepmtVATAmountLine__VAT_Identifier_Caption; PrepmtVATAmountLine__VAT_Identifier_CaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control209; ContinuedCaption_Control209Lbl)
                        {
                        }
                        column(ContinuedCaption_Control214; ContinuedCaption_Control214Lbl)
                        {
                        }
                        column(PrepmtVATAmountLine__VAT_Base__Control216Caption; PrepmtVATAmountLine__VAT_Base__Control216CaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            PrepmtVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SETRANGE(Number, 1, PrepmtVATAmountLine.COUNT);
                        end;
                    }
                    dataitem(PrepmtTotal; "Integer")
                    {
                        DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                        column(PrepmtPaymentTerms_Description; PrepmtPaymentTerms.Description)
                        {
                        }
                        column(PrepmtTotal_Number; Number)
                        {
                        }
                        column(PrepmtPaymentTerms_DescriptionCaption; PrepmtPaymentTerms_DescriptionCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            IF NOT PrepmtInvBuf.FIND('-') THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    PrepmtPurchLine: Record "Purchase Line" temporary;
                    TempPurchLine: Record "Purchase Line" temporary;
                begin
                    CLEAR(PurchLine);
                    CLEAR(PurchPost);
                    PurchLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    PurchPost.GetPurchLines("Purchase Header", PurchLine, 0);
                    PurchLine.CalcVATAmountLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    PurchLine.UpdateVATOnLines(0, "Purchase Header", PurchLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Purchase Header"."Currency Code", "Purchase Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    PrepmtInvBuf.DELETEALL;
                    PurchPostPrepmt.GetPurchLines("Purchase Header", 0, PrepmtPurchLine);
                    IF NOT PrepmtPurchLine.ISEMPTY THEN BEGIN
                        PurchPostPrepmt.GetPurchLinesToDeduct("Purchase Header", TempPurchLine);
                        IF NOT TempPurchLine.ISEMPTY THEN
                            PurchPostPrepmt.CalcVATAmountLines("Purchase Header", TempPurchLine, PrePmtVATAmountLineDeduct, 1);
                    END;
                    PurchPostPrepmt.CalcVATAmountLines("Purchase Header", PrepmtPurchLine, PrepmtVATAmountLine, 0);
                    PrepmtVATAmountLine.DeductVATAmountLine(PrePmtVATAmountLineDeduct);
                    PurchPostPrepmt.UpdateVATOnLines("Purchase Header", PrepmtPurchLine, PrepmtVATAmountLine, 0);
                    PurchPostPrepmt.BuildInvLineBuffer2("Purchase Header", PrepmtPurchLine, 0, PrepmtInvBuf);
                    PrepmtVATAmount := PrepmtVATAmountLine.GetTotalVATAmount;
                    PrepmtVATBaseAmount := PrepmtVATAmountLine.GetTotalVATBase;
                    PrepmtTotalAmountInclVAT := PrepmtVATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN
                        CopyText := FormatDocument.GetCOPYText;
                    CurrReport.PAGENO := 1;
                    OutputNo := OutputNo + 1;

                    TotalSubTotal := 0;
                    TotalAmount := 0;
                end;

                trigger OnPostDataItem()
                begin
                    IF NOT IsReportInPreviewMode THEN
                        CODEUNIT.RUN(CODEUNIT::"Purch.Header-Printed", "Purchase Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                FormatAddressFields("Purchase Header");
                FormatDocumentFields("Purchase Header");
                PricesInclVATtxt := FORMAT("Prices Including VAT");

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                //+++TRASER-ECM
                IF NOT ECMReportMgt.IsArchiveModus THEN
                    //---TRASER-ECM
                    IF NOT IsReportInPreviewMode THEN
                        IF ArchiveDocument THEN
                            ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);
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
                    field(NoofCopies; NoOfCopies)
                    {
                        ApplicationArea = Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInformation; ShowInternalInfo)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies whether to archive the order.';

                        trigger OnValidate()
                        begin
                            IF NOT ArchiveDocument THEN
                                LogInteraction := FALSE;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to log this interaction.';

                        trigger OnValidate()
                        begin
                            IF LogInteraction THEN
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
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
            ArchiveDocument := PurchSetup."Archive Orders";
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
        GLSetup.GET;
        CompanyInfo.GET;
        PurchSetup.GET;
    end;

    trigger OnPostReport()
    begin
        //+++TRASER-ECM
        IF NOT ECMReportMgt.IsArchiveModus THEN
            //---TRASER-ECM
            IF LogInteraction AND NOT IsReportInPreviewMode THEN
                IF "Purchase Header".FINDSET THEN
                    REPEAT
                        "Purchase Header".CALCFIELDS("No. of Archived Versions");
                        SegManagement.LogDocument(13, "Purchase Header"."No.", "Purchase Header"."Doc. No. Occurrence",
                          "Purchase Header"."No. of Archived Versions", DATABASE::Vendor, "Purchase Header"."Buy-from Vendor No.",
                          "Purchase Header"."Purchaser Code", '', "Purchase Header"."Posting Description", '');
                    UNTIL "Purchase Header".NEXT = 0;
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text004: Label 'Order %1', Comment = '%1 = Document No.';
        Text005: Label 'Page %1', Comment = '%1 = Page No.';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        VATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        PrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        PurchLine: Record "Purchase Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        PrepmtDimSetEntry: Record "Dimension Set Entry";
        PrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        CurrExchRate: Record "Currency Exchange Rate";
        PurchSetup: Record "Purchases & Payables Setup";
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        PurchPost: Codeunit "Purch.-Post";
        ArchiveManagement: Codeunit ArchiveManagement;
        SegManagement: Codeunit SegManagement;
        PurchPostPrepmt: Codeunit "Purchase-Post Prepayments";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        BuyFromAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        PricesInclVATtxt: Text[30];
        AllowInvDisctxt: Text[30];
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        CompanyInfo__Phone_No__CaptionLbl: Label 'Phone No.';
        CompanyInfo__Fax_No__CaptionLbl: Label 'Fax No.';
        CompanyInfo__VAT_Registration_No__CaptionLbl: Label 'VAT Reg. No.';
        CompanyInfo__Giro_No__CaptionLbl: Label 'Giro No.';
        CompanyInfo__Bank_Name_CaptionLbl: Label 'Bank';
        CompanyInfo__Bank_Account_No__CaptionLbl: Label 'Account No.';
        Order_No_CaptionLbl: Label 'Order No.';
        PageCaptionLbl: Label 'Page';
        Header_DimensionsCaptionLbl: Label 'Header Dimensions';
        Direct_Unit_CostCaptionLbl: Label 'Direct Unit Cost';
        Purchase_Line___Line_Discount___CaptionLbl: Label 'Disc. %';
        AmountCaptionLbl: Label 'Amount';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control76Lbl: Label 'Continued';
        PurchLine__Inv__Discount_Amount_CaptionLbl: Label 'Inv. Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        VATDiscountAmountCaptionLbl: Label 'Payment Discount on VAT';
        Line_DimensionsCaptionLbl: Label 'Line Dimensions';
        VATAmountLine__VAT___CaptionLbl: Label 'VAT %';
        VATAmountLine__VAT_Base__Control99CaptionLbl: Label 'VAT Base';
        VATAmountLine__VAT_Amount__Control100CaptionLbl: Label 'VAT Amount';
        VAT_Amount_SpecificationCaptionLbl: Label 'VAT Amount Specification';
        VATAmountLine__VAT_Identifier_CaptionLbl: Label 'VAT Identifier';
        VATAmountLine__Inv__Disc__Base_Amount__Control132CaptionLbl: Label 'Inv. Disc. Base Amount';
        VATAmountLine__Line_Amount__Control131CaptionLbl: Label 'Line Amount';
        VATAmountLine__Invoice_Discount_Amount__Control133CaptionLbl: Label 'Invoice Discount Amount';
        VATAmountLine__VAT_Base_CaptionLbl: Label 'Continued';
        VATAmountLine__VAT_Base__Control103CaptionLbl: Label 'Continued';
        VATAmountLine__VAT_Base__Control107CaptionLbl: Label 'Total';
        VALVATAmountLCY_Control158CaptionLbl: Label 'VAT Amount';
        VALVATBaseLCY_Control159CaptionLbl: Label 'VAT Base';
        VATAmountLine__VAT____Control160CaptionLbl: Label 'VAT %';
        VATAmountLine__VAT_Identifier__Control161CaptionLbl: Label 'VAT Identifier';
        VALVATBaseLCYCaptionLbl: Label 'Continued';
        VALVATBaseLCY_Control163CaptionLbl: Label 'Continued';
        VALVATBaseLCY_Control166CaptionLbl: Label 'Total';
        PaymentTerms_DescriptionCaptionLbl: Label 'Payment Terms';
        ShipmentMethod_DescriptionCaptionLbl: Label 'Shipment Method';
        Payment_DetailsCaptionLbl: Label 'Payment Details';
        Vendor_No_CaptionLbl: Label 'Vendor No.';
        Ship_to_AddressCaptionLbl: Label 'Ship-to Address';
        PrepmtLineAmount_Control173CaptionLbl: Label 'Amount';
        PrepmtInvBuf_DescriptionCaptionLbl: Label 'Description';
        PrepmtInvBuf__G_L_Account_No__CaptionLbl: Label 'G/L Account No.';
        Prepayment_SpecificationCaptionLbl: Label 'Prepayment Specification';
        ContinuedCaption_Control176Lbl: Label 'Continued';
        ContinuedCaption_Control178Lbl: Label 'Continued';
        Line_DimensionsCaption_Control180Lbl: Label 'Line Dimensions';
        PrepmtVATAmountLine__VAT_Amount__Control194CaptionLbl: Label 'VAT Amount';
        PrepmtVATAmountLine__VAT_Base__Control195CaptionLbl: Label 'VAT Base';
        PrepmtVATAmountLine__Line_Amount__Control196CaptionLbl: Label 'Line Amount';
        PrepmtVATAmountLine__VAT____Control197CaptionLbl: Label 'VAT %';
        Prepayment_VAT_Amount_SpecificationCaptionLbl: Label 'Prepayment VAT Amount Specification';
        PrepmtVATAmountLine__VAT_Identifier_CaptionLbl: Label 'VAT Identifier';
        ContinuedCaption_Control209Lbl: Label 'Continued';
        ContinuedCaption_Control214Lbl: Label 'Continued';
        PrepmtVATAmountLine__VAT_Base__Control216CaptionLbl: Label 'Total';
        PrepmtPaymentTerms_DescriptionCaptionLbl: Label 'Prepmt. Payment Terms';
        PrepmtLoopLineNo: Integer;
        TotalPrepmtLineAmount: Decimal;
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    [Scope('Personalization')]
    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewArchiveDocument: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        ArchiveDocument := NewArchiveDocument;
        LogInteraction := NewLogInteraction;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(13) <> '';
    end;

    local procedure FormatAddressFields(var PurchaseHeader: Record "Purchase Header")
    begin
        FormatAddr.GetCompanyAddr(PurchaseHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, PurchaseHeader);
        IF PurchaseHeader."Buy-from Vendor No." <> PurchaseHeader."Pay-to Vendor No." THEN
            FormatAddr.PurchHeaderPayTo(VendAddr, PurchaseHeader);
        FormatAddr.PurchHeaderShipTo(ShipToAddr, PurchaseHeader);
    end;

    local procedure FormatDocumentFields(PurchaseHeader: Record "Purchase Header")
    begin
        WITH PurchaseHeader DO BEGIN
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetPurchaser(SalesPurchPerson, "Purchaser Code", PurchaserText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentTerms(PrepmtPaymentTerms, "Prepmt. Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FIELDCAPTION("Your Reference"));
            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FIELDCAPTION("VAT Registration No."));
        END;
    end;

    local procedure ___TRASER_ECM()
    begin
    end;

    local procedure ArchiveReport()
    var
        PurchaseHeader: Record "Purchase Header";
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
            ECMReportMgt.AddReportOption('ArchiveDocument', ECMReportMgt.GetBooleanValue(ArchiveDocument));
            PurchaseHeader.SETRANGE("Document Type", "Purchase Header"."Document Type");
            PurchaseHeader.SETRANGE("No.", "Purchase Header"."No.");
            PurchaseHeader.FINDFIRST;
            RecRef.GETTABLE(PurchaseHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

