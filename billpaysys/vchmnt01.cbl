      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vchmnt01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            copy "slvnd02.cbl".
            copy "slvouch.cbl".
            copy "slcontrol.cbl".

       DATA DIVISION.
       FILE SECTION.

            copy "fdvnd04.cbl".
            copy "fdvouch.cbl".
            copy "fdcontrol.cbl".


       WORKING-STORAGE SECTION.
       77   menu-pick                          pic 9.
            88 menu-pick-is-valid              values 0 thru 4.

       77   the-mode                           pic x(7).
       77   which-field                        pic 9.
       77   ok-to-delete                       pic x.
       77   voucher-record-found               pic x.
       77   control-record-found               pic x.
       77   vendor-record-found                pic x.
       77   a-dummy                            pic x.

       77   add-another                        pic x.
       77   voucher-number-field               pic z(5).
       77   voucher-amount-field               pic zzz,zz9.99-.
       77   voucher-paid-amount-field          pic zzz,zz9.99-.

       77   error-message                      pic x(79) value space.

            copy "wscase01.cbl".
            copy "date01.cbl".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            perform opening-procedure.
            perform main-process.
            perform closing-procedure.

       PROGRAM-EXIT.
            EXIT PROGRAM.

       PROGRAM-DONE.
            STOP RUN.

       opening-procedure.
            open i-o voucher-file.
            open i-o vendor-file.
            open i-o control-file.

       closing-procedure.
            close voucher-file.
            close vendor-file.
            close control-file.

       main-process.
            perform get-menu-pick.
            perform maintain-the-file
               until menu-pick = 0.

       get-menu-pick.
            perform display-the-menu.
            perform accept-menu-pick.
            perform re-accept-menu-pick
               until menu-pick-is-valid.

       display-the-menu.
            perform clear-screen.
            display "      PLEASE SELECT:".
            display "      ".
            display "      1. ADD RECORDS".
            display "      2. CHANGE A RECORD".
            display "      3. LOOK UP A RECORD".
            display "      4. DELETE A RECORD".
            display "      ".
            display "      0. EXIT".
            perform scroll-line 8 times.

       accept-menu-pick.
            display "YOUR CHOICE (0-4)?".
            accept menu-pick.

       re-accept-menu-pick.
            display "INVALID SELECTION - PLEASE RE-TRY.".
            perform accept-menu-pick.

       scroll-line.
            display " ".

       clear-screen.
            perform scroll-line 25 times.

       maintain-the-file.
            perform do-the-pick.
            perform get-menu-pick.

       do-the-pick.
            perform is-add-mode.
            perform is-change-mode.
            perform is-inquire-mode.
            perform is-delete-mode.

       is-add-mode.
            if menu-pick = 1
                perform add-mode.

       is-change-mode.
            if menu-pick = 2
                perform change-mode.

       is-inquire-mode.
            if menu-pick = 3
                perform inquire-mode.

       is-delete-mode.
            if menu-pick = 4
                perform delete-mode.

       add-mode.
            move "ADD" to the-mode.
            move "Y" to add-another.
            perform get-new-record-key.
            perform add-records
               until add-another = "N".

       get-new-record-key.
            perform accept-new-record-key.
            perform re-accept-new-record-key
               until voucher-record-found = "N".

            perform display-voucher-number.

       accept-new-record-key.
            perform ini-voucher-record.
            perform retrieve-next-voucher-number.

            perform read-voucher-record.

       re-accept-new-record-key.
            perform accept-new-record-key.


       retrieve-next-voucher-number.
            perform read-control-record.
            add 1 to control-last-voucher.
            move control-last-voucher to voucher-number.
            perform rewrite-control-record.

       add-records.
            perform enter-remaining-fields.
            perform write-voucher-record.
            perform get-add-another.

       get-add-another.
            perform accecpt-add-another.
            perform re-accecpt-add-another
               until add-another = "Y" or "N".

       accecpt-add-another.
            display "ADD ANOTHER VOUCHER(Y/N)?".
            accept add-another.
            inspect add-another
               converting lower-alpha
               to upper-alpha.
            if add-another = "Y"
                perform get-new-record-key.

       re-accecpt-add-another.
            display "YOU MUST ENTER YES (Y) OR NO (N)".
            perform accecpt-add-another.

       enter-remaining-fields.
            perform enter-voucher-vendor.
            perform enter-voucher-invoice.
            perform enter-voucher-for.
            perform enter-voucher-amount.
            perform enter-voucher-date.
            perform enter-voucher-due.
            perform enter-voucher-deductible.
            perform enter-voucher-selected.

       change-mode.
            move "CHANGE" to the-mode.
            perform get-existing-record.
            perform change-records
               until voucher-number = zeroes.

       change-records.
            perform get-field-to-change.
            perform change-one-field
               until which-field = zero.
            perform get-existing-record.

       get-field-to-change.
            perform display-all-fields.
            perform ask-which-field.

       ask-which-field.
            perform accept-which-field.
            perform re-accept-which-field
               until which-field < 8.

       accept-which-field.
            display "ENTER THE NUMBER OF THE FIELD".
            display "TO CHANGE (1-7) OR 0 TO EXIT".
            accept which-field.

       re-accept-which-field.
            display "INVALID ENTRY".
            perform accept-which-field.

       change-one-field.
            perform change-this-field.
            perform get-field-to-change.

       change-this-field.
            if which-field = 1
                perform enter-voucher-vendor.
            if which-field = 2
                perform enter-voucher-invoice.
            if which-field = 3
                perform enter-voucher-for.
            if which-field = 4
                perform enter-voucher-amount.
            if which-field = 5
                perform enter-voucher-date.
            if which-field = 6
                perform enter-voucher-due.
            if which-field = 7
                perform enter-voucher-deductible.

            perform rewrite-voucher-record.

       iniquire-mode.
            move "DISPLAY" to the-mode.
            perform get-existing-record.
            perform inquire-records
               until voucher-number = zeroes.

       inquire-records.
            perform display-all-fields.
            perform get-existing-record.

       delete-mode.
            move "DELETE" to the-mode.
            perform get-existing-record.
            perform delete-records
               until voucher-number = zeroes.

       delete-records.
            perform display-all-fields.
            perform ask-to-delete.

            if ok-to-delete = "Y"
                perform delete-voucher-record.

            perform get-existing-record.

       ask-to-delete.
            perform accept-ok-to-delete.
            perform re-accept-ok-to-delete
               until ok-to-delete = "Y" or "N".

       accept-ok-to-delete.
            display "DELETE THIS RECORD (Y/N)?".
            accept ok-to-delete.
            inspect ok-to-delte
               converting lower-alpha to upper-alpha.

       re-accept-ok-to-delete.
            display "YOU MUST ENTER YES (Y) OR NO (N)".
            perform accept-ok-to-delete.

       init-voucher-record.
            move space to voucher-invoice
                           voucher-for
                           voucher-deductible
                           voucher-selected.
            move zeroes to voucher-number
                           voucher-vendor
                           voucher-amount
                           voucher-date
                           voucher-due
                           voucher-paid-amount
                           voucher-paid-date
                           voucher-check-no.

       enter-voucher-record.
            perform accept-voucher-vendor.
            perform re-accept-voucher-vendor
               until voucher-vendor not zeroes and
                   vendor-record-found = "Y".

       accept-voucher-vendor.
            display "ENTER VENDOR".
            accept voucher-vendor.
            perform edit-check-voucher-vendor.
            perform display-voucher-vendor.

       re-accept-voucher-vendor.
            display error-message.
            perform accept-voucher-vendor.

       edit-check-voucher-vendor.
            perform edit-voucher-vendor.
            perform check-voucher-vendor.

       edit-voucher-vendor.

       check-voucher-vendor.
            perform voucher-vendor-required.
            if voucher-vendor not = zeroes
                perform voucher-vendor-on-file.

       voucher-vendor-required.
            if voucher-vendor = zeroes
                move "VENDOR MUST BE ENTERED"
                   to error-message.

       voucher-vendor-on-file.
            move voucher-vendor to vendor-number.
            perform read-vendor-record.
            if vendor-record-found = "N"
                move "VENDOR NOT ON FILE"
                   to error-message.

       enter-voucher-invoice.
            perform accept-voucher-invoice.
            perform re-accept-voucher-invoice
               until voucher-invoice not = space.

       accept-voucher-invoice.
            display "ENTER INVOICE NUMBER".
            accept voucher-number.
            inspect voucher-invoice
               converting lower-alpha
               to upper-alpha.

       re-accept-voucher-invoice.
            display "INVOICE MUST BE ENTERED".
            perform accept-voucher-invoice.

       enter-voucher-for.
            perform accept-voucher-for.
            perform re-accept-voucher-for
               until voucher-for not = space.

       accept-voucher-for.
            display "WHAT FOR?".
            accept voucher-for.
            inspect voucher-for
               converting lower-alpha
               to upper-alpha.

       re-accept-voucher-for.
            display "A DESCRIPTION MUST BE ENTERED".
            perform accept-voucher-for.

       enter-voucher-amount.
            perform accept-voucher-amount.
            perform re-accept-voucher-amount
               until voucher-amount not = zeroes.

       accept-voucher-amount.
            display "ENTER INVOICE AMOUNT".
            accept voucher-amount-field.
            move voucher-amount-field to voucher-amount.

       re-accept-voucher-amount.
            display "AMOUNT MUST NOT BE ZERO".
            perform accept-voucher-amount.

       enter-voucher-date.
            move "N" to zeroe-date-is-ok.
            move "ENTER INVOICE DATE(MM/DD/CCYY)?"
               to date-prompt.
            move "AN INVOICE DATE IS REQUIRED"
               to date-erro-message.
            perform get-a-date.
            move date-ccyymmdd to voucher-date.

       enter-voucher-due.
            move "N" to zero-date-is-ok.
            move "ENTER DUE DATE(MM/DD/CCYY)?"
               to date-prompt.
            move "A DUE DATE IS REQUIRED"
               to date-error-message.
            perform get-a-date.
            move date-ccyymmdd to voucher-due.

       enter-voucher-deductible.
            perform accept-voucher-deductible.
            perform re-accept-voucher-deductible
               until voucher-deductible = "Y" or "N".

       accept-voucher-deductible.
            display "IS THIS TAX DEDUCTIBLE?".
            accept voucher-deductible.
            inspect voucher-deductible
               converting lower-alpha
               to upper-alpha.

       re-accept-voucher-deductible.
            display "MUST BE YES OR NO".
            perform accept-voucher-deductible.

       enter-voucher-selected.
            move "N" to voucher-selected.

       get-existing-record.
            perform accept-existing-key.
            perform re-accept-existing-key
               until voucher-record-found = "Y" or
                       voucher-number = zeroes.

       accept-existing-key.
            perform init-voucher-record.
            perform enter-voucher-number.+
            if voucher-number not = zeroes
                perform read-voucher-record.

       re-accept-existing-key.
            display "RECORD NOT FOUND".
            perform accept-existing-key.

       enter-voucher-number.
            display "ENTER VOUCHER NUMBER TO " the-mode.
            accept voucher-mode.

       display-all-fields.
            display " ".
            perform display-voucher-number.
            perform display-voucher-vendor.
            perform display-voucher-invoice.
            perform display-voucher-for.
            perform display-voucher-amount.
            perform display-voucher-date.
            perform display-voucher-due.
            perform display-voucher-deductible.
            if voucher-paid-date = zeroes
                perform display-voucher-selected.
            if voucher-paid-date not = zeroes
                perform display-voucher-paid-amount
                perform display-voucher-paid-date.
                perform display-voucher-check-no.
            display " ".

       display-voucher-number.
            display "VOUCHER NUMBER: " voucher-number.

       display-voucher-vendor.
            perform voucher-vendor-on-file.
            if vendor-record-found = "N"
                move "**Not found**" to vendor-name.
            display "1. VENDOR: " voucher-vendor " " vendor-name.

       display-voucher-invoice.
            display "2. INVOICE: " voucher-invoice.

       display-voucher-for.
            display "3. FOR: " voucher-for.

       display-voucher-amount.
            display "4. AMOUNT: " voucher-amount.

       display-voucher-date.
            move voucher-date to date-ccyymmdd.
            perform format-the-date.
            display "5. INVOICE DATE " formatted-date.

       display-voucher-due.
            move voucher-due to date-ccyymmdd.
            perform format-the-date.
            display "6. DUE DATE: " formatted-date.

       display-voucher-deductible.
            display "7. DEDUCTIBLE: " voucher-deductible.

       display-voucher-selected.
            display " SELECTED FOR PAYMENT: " voucher-selected.

       display-voucher-paid-amount.
            move voucher-paid-amount to voucher-paid-amount-field.
            display " PAID: " voucher-paid-amount-field.

       display-voucher-paid-date.
            move voucher-paid-date to date-ccyymmdd.
            perform format-the-date.
            display " PAID ON: " formatted-date.

       display-voucher-check-no.
            display " CHECK: " voucher-check-no.

       read-voucher-record.
            move "Y" to voucher-record-found.
            read voucher-file record
               invalid key
                   move "N" to voucher-record-found.

       write-voucher-record.
            write voucher-record
               invalid key
                   display "RECORD ALREADY ON FILE".

       rewrite-voucher-record.
            rewrite voucher-record
               invalid key
                   display "ERROR REWRITING VENDOR RECORD".

       delete-voucher-record.
            delete voucher-file record
               invalid key
                   display "ERROR DELETING VENDOR RECORD".

       read-vendor-record.
            move "Y" to vendor-record-found.
            read vendor-file record
               invalid key
                   move "N" to vendor-record-found.

       read-control-record.
            move 1 to control-key.
            move "Y" to control-record-found.
            read control-file record
               invalid key
                   move "N" to control-record-found.

       rewrite-control-record.
            rewrite control-record
               invalid key
                   display "ERROR REWRITING CONTROL RECORD".

            copy "pldate.cbl".
