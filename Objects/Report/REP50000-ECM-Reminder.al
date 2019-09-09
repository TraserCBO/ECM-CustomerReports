report 50000 "ECM - Reminder"
{
    // version NAVW113.02,NAVDACH13.02,ECM130.1.00

    // TRASER Software GmbH
    // ----------------------
    // ECM Interface
    // ----------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Objects\Report\ReportLayout\ECM Reminder.rdlc';

    Caption = 'Reminder';

    dataset
    {
        dataitem("Issued Reminder Header"; "Issued Reminder Header")
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Reminder';
            column(No_IssuedReminderHeader; "No.")
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            column(VATAmountCaption; VATAmountCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATCaption; VATCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EMailCaption; EMailCaptionLbl)
            {
            }
            column(ShowMIRLines; ShowMIRLines)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(DueDate_IssuedReminderHdr; FORMAT("Issued Reminder Header"."Due Date"))
                {
                }
                column(PostingDate_IssuedReminderHdr; FORMAT("Issued Reminder Header"."Posting Date"))
                {
                }
                column(YourReference_IssuedReminderHdr; "Issued Reminder Header"."Your Reference")
                {
                }
                column(Contact_IssuedReminderHdr; "Issued Reminder Header".Contact)
                {
                }
                column(ReferenceText; ReferenceText)
                {
                }
                column(VATRegNo_IssuedReminderHdr; "Issued Reminder Header"."VAT Registration No.")
                {
                }
                column(VATNoText; VATNoText)
                {
                }
                column(DocDate_IssuedReminderHdr; FORMAT("Issued Reminder Header"."Document Date"))
                {
                }
                column(CustNo_IssuedReminderHdr; "Issued Reminder Header"."Customer No.")
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
                column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                {
                }
                column(CompanyInfoBankName; CompanyInfo."Bank Name")
                {
                }
                column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                {
                }
                column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                {
                }
                column(CompanyInfoHomePage; CompanyInfo."Home Page")
                {
                }
                column(CompanyInfoEMail; CompanyInfo."E-Mail")
                {
                }
                column(CustAddr8; CustAddr[8])
                {
                }
                column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CompanyAddr6; CompanyAddr[6])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CompanyAddr5; CompanyAddr[5])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(TextPage; TextPageLbl)
                {
                }
                column(PostingDateCaption; PostingDateCaptionLbl)
                {
                }
                column(ReminderHeaderNoCaption; ReminderHeaderNoCaptionLbl)
                {
                }
                column(BankAccountNoCaption; BankAccountNoCaptionLbl)
                {
                }
                column(BankNameCaption; BankNameCaptionLbl)
                {
                }
                column(GiroNoCaption; GiroNoCaptionLbl)
                {
                }
                column(VATRegNoCaption; VATRegNoCaptionLbl)
                {
                }
                column(PhoneNoCaption; PhoneNoCaptionLbl)
                {
                }
                column(ReminderCaption; ReminderCaptionLbl)
                {
                }
                column(CurrReportPageNo; STRSUBSTNO(Text002, CurrReport.PAGENO()))
                {
                }
                column(CustNo_IssuedReminderHdrCaption; "Issued Reminder Header".FIELDCAPTION("Customer No."))
                {
                }
                dataitem(DimensionLoop; "Integer")
                {
                    DataItemLinkReference = "Issued Reminder Header";
                    DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                    column(DimText; DimText)
                    {
                    }
                    column(Number_Integer; DimensionLoop.Number)
                    {
                    }
                    column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF Number = 1 THEN BEGIN
                            IF NOT DimSetEntry.FINDSET THEN
                                CurrReport.BREAK;
                        END ELSE
                            IF NOT Continue THEN
                                CurrReport.BREAK;

                        CLEAR(DimText);
                        Continue := FALSE;
                        REPEAT
                            OldDimText := DimText;
                            IF DimText = '' THEN
                                DimText := STRSUBSTNO('%1 - %2', DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code")
                            ELSE
                                DimText :=
                                  STRSUBSTNO(
                                    '%1; %2 - %3', DimText,
                                    DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code");
                            IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                DimText := OldDimText;
                                Continue := TRUE;
                                EXIT;
                            END;
                        UNTIL DimSetEntry.NEXT = 0;
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF NOT ShowInternalInfo THEN
                            CurrReport.BREAK;
                    end;
                }
                dataitem("Issued Reminder Line"; "Issued Reminder Line")
                {
                    DataItemLink = "Reminder No." = FIELD ("No.");
                    DataItemLinkReference = "Issued Reminder Header";
                    DataItemTableView = SORTING ("Reminder No.", "Line No.");
                    column(RemAmt_IssuedReminderLine; "Remaining Amount")
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(StartLineNo; StartLineNo)
                    {
                    }
                    column(LineNo_IssuedReminderLine; "Line No.")
                    {
                    }
                    column(Desc_IssuedReminderLine; Description)
                    {
                    }
                    column(Type_IssuedReminderLine; FORMAT("Issued Reminder Line".Type, 0, 2))
                    {
                    }
                    column(DocDate_IssuedReminderLine; FORMAT("Document Date"))
                    {
                    }
                    column(DocNo_IssuedReminderLine; "Document No.")
                    {
                    }
                    column(DueDate_IssuedReminderLine; FORMAT("Due Date"))
                    {
                    }
                    column(OriginalAmt_IssuedReminderLine; "Original Amount")
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(DocType_IssuedReminderLine; "Document Type")
                    {
                    }
                    column(No_IssuedReminderLine; "No.")
                    {
                    }
                    column(ShowInternalInfo; ShowInternalInfo)
                    {
                    }
                    column(NNCInterestAmount; NNC_InterestAmount)
                    {
                    }
                    column(TotalText; TotalText)
                    {
                    }
                    column(MIREntry_IssuedReminderLine; "Detailed Interest Rates Entry")
                    {
                    }
                    column(NNCTotal; NNC_Total)
                    {
                    }
                    column(TotalInclVATText; TotalInclVATText)
                    {
                    }
                    column(NNCVATAmount; NNC_VATAmount)
                    {
                    }
                    column(NNCTotalInclVAT; NNC_TotalInclVAT)
                    {
                    }
                    column(TotalVATAmt; TotalVATAmount)
                    {
                    }
                    column(ReminderNo_IssuedReminderLine; "Reminder No.")
                    {
                    }
                    column(InterestAmountCaption; InterestAmountCaptionLbl)
                    {
                    }
                    column(RemAmt_IssuedReminderLineCaption; FIELDCAPTION("Remaining Amount"))
                    {
                    }
                    column(DocNo_IssuedReminderLineCaption; FIELDCAPTION("Document No."))
                    {
                    }
                    column(OriginalAmt_IssuedReminderLineCaption; FIELDCAPTION("Original Amount"))
                    {
                    }
                    column(DocType_IssuedReminderLineCaption; FIELDCAPTION("Document Type"))
                    {
                    }
                    column(Interest; Interest)
                    {
                    }
                    column(RemainingAmountText; RemainingAmt)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF NOT "Detailed Interest Rates Entry" THEN BEGIN
                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."VAT Amount" := "VAT Amount";
                            VATAmountLine."Amount Including VAT" := Amount + "VAT Amount";
                            VATAmountLine."VAT Clause Code" := "VAT Clause Code";
                            VATAmountLine.InsertLine;

                            CASE Type OF
                                Type::"G/L Account":
                                    "Remaining Amount" := Amount;
                                Type::"Line Fee":
                                    "Remaining Amount" := Amount;
                                Type::"Customer Ledger Entry":
                                    ReminderInterestAmount := Amount;
                            END;

                            NNC_InterestAmountTotal += ReminderInterestAmount;
                            NNC_RemainingAmountTotal += "Remaining Amount";
                            NNC_VATAmountTotal += "VAT Amount";

                            NNC_InterestAmount := (NNC_InterestAmountTotal + NNC_VATAmountTotal + "Issued Reminder Header"."Additional Fee" -
                                                   AddFeeInclVAT + "Issued Reminder Header"."Add. Fee per Line" - AddFeePerLineInclVAT) /
                              (VATInterest / 100 + 1);
                            NNC_Total := NNC_RemainingAmountTotal + NNC_InterestAmountTotal;
                            NNC_VATAmount := NNC_VATAmountTotal;
                            NNC_TotalInclVAT := NNC_RemainingAmountTotal + NNC_InterestAmountTotal + NNC_VATAmountTotal;

                            TotalRemAmt += "Remaining Amount";
                        END;

                        RemainingAmt := '';

                        IF ("Remaining Amount" = 0) AND ("Due Date" = 0D) THEN
                            RemainingAmt := ''
                        ELSE
                            RemainingAmt := FORMAT("Remaining Amount");
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF FIND('-') THEN BEGIN
                            StartLineNo := 0;
                            REPEAT
                                Continue := Type = Type::" ";
                                StartLineNo := "Line No.";
                            UNTIL (NEXT = 0) OR NOT Continue;
                        END;

                        CLEAR(CompanyInfo.Picture);
                        CLEAR(CompanyInfo1.Picture);
                        CLEAR(CompanyInfo2.Picture);
                        CLEAR(CompanyInfo3.Picture);

                        IF FINDLAST THEN BEGIN
                            EndLineNo := "Line No." + 1;
                            REPEAT
                                Continue :=
                                  NOT ShowNotDueAmounts AND
                                  ("No. of Reminders" = 0) AND
                                  (((Type = Type::"Customer Ledger Entry") OR (Type = Type::"Line Fee")) OR (Type = Type::" ")) OR
                                  "Detailed Interest Rates Entry" AND NOT ShowMIRLines;
                                IF Continue THEN
                                    EndLineNo := "Line No.";
                            UNTIL (NEXT(-1) = 0) OR NOT Continue;
                        END;

                        VATAmountLine.DELETEALL;
                        SETFILTER("Line No.", '<%1', EndLineNo);
                        CurrReport.CREATETOTALS("Remaining Amount", "VAT Amount", ReminderInterestAmount);
                    end;
                }
                dataitem(IssuedReminderLine2; "Issued Reminder Line")
                {
                    DataItemLink = "Reminder No." = FIELD ("No.");
                    DataItemLinkReference = "Issued Reminder Header";
                    DataItemTableView = SORTING ("Reminder No.", "Line No.");
                    column(Description_IssuedReminderLine2; Description)
                    {
                    }
                    column(LineNo_IssuedReminderLine2; "Line No.")
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        SETFILTER("Line No.", '>=%1', EndLineNo);
                        IF NOT ShowNotDueAmounts THEN BEGIN
                            SETFILTER(Type, '<>%1', Type::" ");
                            IF FINDFIRST THEN
                                IF "Line No." > EndLineNo THEN BEGIN
                                    SETRANGE(Type);
                                    SETRANGE("Line No.", EndLineNo, "Line No." - 1); // find "Open Entries Not Due" line
                                    IF FINDLAST THEN
                                        SETRANGE("Line No.", EndLineNo, "Line No." - 1);
                                END;
                            SETRANGE(Type);
                        END;
                    end;
                }
                dataitem(VATCounter; "Integer")
                {
                    DataItemTableView = SORTING (Number);
                    column(VATAmtLineAmtInclVAT; VATAmountLine."Amount Including VAT")
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VALVATAmount; VALVATAmount)
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VALVATBase; VALVATBase)
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VALVATBaseVALVATAmount; VALVATBase + VALVATAmount)
                    {
                        AutoFormatExpression = "Issued Reminder Line".GetCurrencyCodeFromHeader;
                        AutoFormatType = 1;
                    }
                    column(VATAmountLineVAT; VATAmountLine."VAT %")
                    {
                    }
                    column(AmountIncludingVATCaption; AmountIncludingVATCaptionLbl)
                    {
                    }
                    column(VATAmtSpecificationCaption; VATAmtSpecificationCaptionLbl)
                    {
                    }
                    column(VALVATBaseCaption; VALVATBaseCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                        VALVATBase := VATAmountLine."Amount Including VAT" / (1 + VATAmountLine."VAT %" / 100);
                        VALVATAmount := VATAmountLine."Amount Including VAT" - VALVATBase;
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF VATAmountLine.GetTotalVATAmount = 0 THEN
                            CurrReport.BREAK;

                        SETRANGE(Number, 1, VATAmountLine.COUNT);

                        VALVATBase := 0;
                        VALVATAmount := 0;
                    end;
                }
                dataitem(VATClauseEntryCounter; "Integer")
                {
                    DataItemTableView = SORTING (Number);
                    column(VATClauseVATIdentifier; VATAmountLine."VAT Identifier")
                    {
                    }
                    column(VATClauseCode; VATAmountLine."VAT Clause Code")
                    {
                    }
                    column(VATClauseDescription; VATClause.Description)
                    {
                    }
                    column(VATClauseDescription2; VATClause."Description 2")
                    {
                    }
                    column(VATClauseAmount; VATAmountLine."VAT Amount")
                    {
                        AutoFormatExpression = "Issued Reminder Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATClausesCaption; VATClausesCap)
                    {
                    }
                    column(VATClauseVATIdentifierCaption; VATIdentifierCaptionLbl)
                    {
                    }
                    column(VATClauseVATAmtCaption; VATAmountCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                        IF NOT VATClause.GET(VATAmountLine."VAT Clause Code") THEN
                            CurrReport.SKIP;
                        VATClause.TranslateDescription("Issued Reminder Header"."Language Code");
                    end;

                    trigger OnPreDataItem()
                    begin
                        CLEAR(VATClause);
                        SETRANGE(Number, 1, VATAmountLine.COUNT);
                        CurrReport.CREATETOTALS(VATAmountLine."VAT Amount");
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
                    column(VALVATBaseLCYCaption; VALVATBaseLCYCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);

                        VALVATBaseLCY := ROUND(VATAmountLine."Amount Including VAT" / (1 + VATAmountLine."VAT %" / 100) / CurrFactor);
                        VALVATAmountLCY := ROUND(VATAmountLine."Amount Including VAT" / CurrFactor - VALVATBaseLCY);
                    end;

                    trigger OnPreDataItem()
                    begin
                        IF (NOT GLSetup."Print VAT specification in LCY") OR
                           ("Issued Reminder Header"."Currency Code" = '') OR
                           (VATAmountLine.GetTotalVATAmount = 0) THEN
                            CurrReport.BREAK;

                        SETRANGE(Number, 1, VATAmountLine.COUNT);

                        VALVATBaseLCY := 0;
                        VALVATAmountLCY := 0;

                        IF GLSetup."LCY Code" = '' THEN
                            VALSpecLCYHeader := Text011 + Text012
                        ELSE
                            VALSpecLCYHeader := Text011 + FORMAT(GLSetup."LCY Code");

                        CurrExchRate.FindCurrency("Issued Reminder Header"."Posting Date", "Issued Reminder Header"."Currency Code", 1);
                        CustEntry.SETRANGE("Customer No.", "Issued Reminder Header"."Customer No.");
                        CustEntry.SETRANGE("Document Type", CustEntry."Document Type"::Reminder);
                        CustEntry.SETRANGE("Document No.", "Issued Reminder Header"."No.");
                        IF CustEntry.FINDFIRST THEN BEGIN
                            CustEntry.CALCFIELDS("Amount (LCY)", Amount);
                            CurrFactor := 1 / (CustEntry."Amount (LCY)" / CustEntry.Amount);
                            VALExchRate := STRSUBSTNO(Text013, ROUND(1 / CurrFactor * 100, 0.000001), CurrExchRate."Exchange Rate Amount");
                        END ELSE BEGIN
                            CurrFactor := CurrExchRate.ExchangeRate("Issued Reminder Header"."Posting Date", "Issued Reminder Header"."Currency Code");
                            VALExchRate := STRSUBSTNO(Text013, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        END;
                    end;
                }
                dataitem(LetterText; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(GreetingText; GreetingLbl)
                    {
                    }
                    column(AmtDueText; AmtDueTxt)
                    {
                    }
                    column(BodyText; BodyLbl)
                    {
                    }
                    column(ClosingText; ClosingLbl)
                    {
                    }
                    column(DescriptionText; DescriptionLbl)
                    {
                    }
                    column(TotalRemAmt_IssuedReminderLine; TotalRemAmt)
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        AmtDueTxt := '';
                        IF FORMAT("Issued Reminder Header"."Due Date") <> '' THEN
                            AmtDueTxt := STRSUBSTNO(AmtDueLbl, "Issued Reminder Header"."Due Date");
                    end;
                }
            }

            trigger OnAfterGetRecord()
            var
                GLAcc: Record "G/L Account";
                CustPostingGroup: Record "Customer Posting Group";
                VATPostingSetup: Record "VAT Posting Setup";
            begin
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                DimSetEntry.SETRANGE("Dimension Set ID", "Dimension Set ID");

                FormatAddr.IssuedReminder(CustAddr, "Issued Reminder Header");
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text000, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text000, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text001, "Currency Code");
                END;
                CurrReport.PAGENO := 1;
                //+++TRASER-ECM
                IF NOT ECMReportMgt.IsArchiveModus THEN
                    //---TRASER-ECM
                    IF NOT IsReportInPreviewMode THEN
                        IncrNoPrinted;

                CALCFIELDS("Additional Fee");
                CustPostingGroup.GET("Customer Posting Group");
                IF GLAcc.GET(CustPostingGroup."Additional Fee Account") THEN BEGIN
                    VATPostingSetup.GET("VAT Bus. Posting Group", GLAcc."VAT Prod. Posting Group");
                    AddFeeInclVAT := "Additional Fee" * (1 + VATPostingSetup."VAT %" / 100);
                END ELSE
                    AddFeeInclVAT := "Additional Fee";

                CALCFIELDS("Add. Fee per Line");
                AddFeePerLineInclVAT := "Add. Fee per Line" + CalculateLineFeeVATAmount;

                CALCFIELDS("Interest Amount", "VAT Amount");
                IF ("Interest Amount" <> 0) AND ("VAT Amount" <> 0) THEN BEGIN
                    GLAcc.GET(CustPostingGroup."Interest Account");
                    VATPostingSetup.GET("VAT Bus. Posting Group", GLAcc."VAT Prod. Posting Group");
                    VATInterest := VATPostingSetup."VAT %";
                    Interest :=
                      ("Interest Amount" +
                       "VAT Amount" + "Additional Fee" - AddFeeInclVAT + "Add. Fee per Line" - AddFeePerLineInclVAT) / (VATInterest / 100 + 1);
                END ELSE BEGIN
                    Interest := "Interest Amount";
                    VATInterest := 0;
                END;

                TotalVATAmount := "VAT Amount";
                NNC_InterestAmountTotal := 0;
                NNC_RemainingAmountTotal := 0;
                NNC_VATAmountTotal := 0;
                NNC_InterestAmount := 0;
                NNC_Total := 0;
                NNC_VATAmount := 0;
                NNC_TotalInclVAT := 0;
                TotalRemAmt := 0;
                //+++TRASER-ECM
                ArchiveReport;
                //---TRASER-ECM
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.GET;
                FormatAddr.Company(CompanyAddr, CompanyInfo);
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
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the reminder that you print to be recorded as interaction, and to be added to the Interaction Log Entry table.';
                    }
                    field(ShowNotDueAmounts; ShowNotDueAmounts)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Not Due Amounts';
                        ToolTip = 'Specifies if you want to show amounts that are not due from customers.';
                    }
                    field(ShowMIR; ShowMIRLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show MIR Detail';
                        ToolTip = 'Specifies if you want multiple interest rate details for the journal lines to be included in the report.';
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
            LogInteraction := SegManagement.FindInteractTmplCode(8) <> '';
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
        SalesSetup.GET;

        CASE SalesSetup."Logo Position on Documents" OF
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                BEGIN
                    CompanyInfo3.GET;
                    CompanyInfo3.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Center:
                BEGIN
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Right:
                BEGIN
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                END;
        END;
    end;

    trigger OnPostReport()
    begin
        //+++TRASER-ECM
        IF NOT ECMReportMgt.IsArchiveModus THEN
            //---TRASER-ECM
            IF LogInteraction AND NOT IsReportInPreviewMode THEN
                IF "Issued Reminder Header".FINDSET THEN
                    REPEAT
                        SegManagement.LogDocument(
                          8, "Issued Reminder Header"."No.", 0, 0, DATABASE::Customer, "Issued Reminder Header"."Customer No.",
                          '', '', "Issued Reminder Header"."Posting Description", '');
                    UNTIL "Issued Reminder Header".NEXT = 0;
    end;

    var
        Text000: Label 'Total %1';
        Text001: Label 'Total %1 Incl. VAT';
        Text002: Label 'Page %1';
        CustEntry: Record "Cust. Ledger Entry";
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        VATAmountLine: Record "VAT Amount Line" temporary;
        VATClause: Record "VAT Clause";
        DimSetEntry: Record "Dimension Set Entry";
        Language: Record Language;
        CurrExchRate: Record "Currency Exchange Rate";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        VATNoText: Text[30];
        ReferenceText: Text[35];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        ReminderInterestAmount: Decimal;
        EndLineNo: Integer;
        Continue: Boolean;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        CurrFactor: Decimal;
        Text011: Label 'VAT Amount Specification in ';
        Text012: Label 'Local Currency';
        Text013: Label 'Exchange rate: %1/%2';
        AddFeeInclVAT: Decimal;
        AddFeePerLineInclVAT: Decimal;
        TotalVATAmount: Decimal;
        VATInterest: Decimal;
        VALVATBase: Decimal;
        VALVATAmount: Decimal;
        Interest: Decimal;
        NNC_InterestAmount: Decimal;
        NNC_Total: Decimal;
        NNC_VATAmount: Decimal;
        NNC_TotalInclVAT: Decimal;
        NNC_InterestAmountTotal: Decimal;
        NNC_RemainingAmountTotal: Decimal;
        NNC_VATAmountTotal: Decimal;
        StartLineNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        ShowNotDueAmounts: Boolean;
        TextPageLbl: Label 'Page';
        PostingDateCaptionLbl: Label 'Posting Date';
        ReminderHeaderNoCaptionLbl: Label 'Reminder No.';
        BankAccountNoCaptionLbl: Label 'Account No.';
        BankNameCaptionLbl: Label 'Bank';
        GiroNoCaptionLbl: Label 'Giro No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        PhoneNoCaptionLbl: Label 'Phone No.';
        ReminderCaptionLbl: Label 'Reminder';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        InterestAmountCaptionLbl: Label 'Interest Amount';
        AmountIncludingVATCaptionLbl: Label 'Amount Including VAT';
        VATAmtSpecificationCaptionLbl: Label 'VAT Amount Specification';
        VATClausesCap: Label 'VAT Clause';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        VALVATBaseCaptionLbl: Label 'Continued';
        VALVATBaseLCYCaptionLbl: Label 'Continued';
        DueDateCaptionLbl: Label 'Due Date';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATCaptionLbl: Label 'VAT %';
        TotalCaptionLbl: Label 'Total';
        PageCaptionLbl: Label 'Page';
        DocDateCaptionLbl: Label 'Document Date';
        HomePageCaptionLbl: Label 'Home Page';
        EMailCaptionLbl: Label 'Email';
        GreetingLbl: Label 'Hello';
        AmtDueLbl: Label 'You are receiving this email to formally notify you that payment owed by you is past due. The payment was due on %1. Enclosed is a copy of invoice with the details of remaining amount.', Comment = '%1 = A due date';
        BodyLbl: Label 'If you have already made the payment, please disregard this email. Thank you for your business.';
        ClosingLbl: Label 'Sincerely';
        DescriptionLbl: Label 'Description';
        AmtDueTxt: Text;
        RemainingAmt: Text;
        TotalRemAmt: Decimal;
        ShowMIRLines: Boolean;
        _TRASER_ECM: Integer;
        ECMReportMgt: Codeunit "ECM Report Mgt.";

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        EXIT(CurrReport.PREVIEW OR MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure ___TRASER_ECM()
    begin
    end;

    local procedure ArchiveReport()
    var
        IssuedReminderHeader: Record "Issued Reminder Header";
        RecRef: RecordRef;
        OptionInt: Integer;
    begin
        IF (ECMReportMgt.IsArchiveModus = FALSE) AND
           (CurrReport.PREVIEW = FALSE) AND
           (ECMReportMgt.RepArchivingIsActive(CurrReport.OBJECTID(FALSE)) = TRUE)
        THEN BEGIN
            CLEAR(ECMReportMgt);
            ECMReportMgt.InitializeExport(CurrReport.OBJECTID(TRUE), CurrReport.OBJECTID(FALSE));
            ECMReportMgt.AddReportOption('ShowInternalInfo', ECMReportMgt.GetBooleanValue(ShowInternalInfo));
            ECMReportMgt.AddReportOption('LogInteraction', ECMReportMgt.GetBooleanValue(LogInteraction));
            ECMReportMgt.AddReportOption('ShowNotDueAmounts', ECMReportMgt.GetBooleanValue(ShowNotDueAmounts));
            ECMReportMgt.AddReportOption('ShowMIR', ECMReportMgt.GetBooleanValue(ShowMIRLines));
            IssuedReminderHeader.SETRANGE("No.", "Issued Reminder Header"."No.");
            IssuedReminderHeader.FINDFIRST;
            RecRef.GETTABLE(IssuedReminderHeader);
            ECMReportMgt.ExportReport(RecRef);
        END;
    end;
}

