      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ctlmnt01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            copy "slcontrol.cbl".

       DATA DIVISION.
       FILE SECTION.

            copy "fdcontrol.cbl".

       WORKING-STORAGE SECTION.
       77   menu-pick                          pic x.
            88 menu-pick-is-valid              values 0 thru 2.

       77   the-mode                           pic x(7).
       77   record-found                       pic x.
       77   which-field                        pic 9.

       77   a-dummy                            pic x.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            perform opening-procedure.
            perform main-process.
            perform close-procedure.

       PROGRAM-EXIT.
            EXIT PROGRAM.

       PROGRAM-DONE.
            STOP RUN.

       opening-procedure.
            open i-o control-file.

       close-procedure.
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
            display "      1. CHANGE CONTROL INFORMATION".
            display "      2. DISPLAY CONTROL INFORMATION".
            display "      ".
            display "      0. EXIT".
            perform scroll-line 3 times.

       accept-menu-pick.
            display "YOUR CHOICE (0-2)?".
            accept menu-pick.

       re-accept-menu-pick.
            display "INVALID SELECTION - PLEASE RE-TRY.".
            perform accept-menu-pick.

       clear-screen.
            perform scroll-line 25 times.

       scroll-line.
            display " ".

       maintain-the-file.
            perform do-the-pick.
            perform get-menu-pick.

       do-the-pick.
            if menu-pick = 1
                perform change-mode
            else
                if menu-pick = 2
                   perform inquire-mode.

       change-mode.
            move "change" to the-mode.
            perform get-control-record.
            if record-found = "Y"
                perform change-records.

       change-records.
            perform get-field-to-change.
            perform change-one-field.

       get-field-to-change.
            perform display-all-fields.
            perform ask-which-field.

       ask-which-field.
            move 1 to which-field.

       change-one-field.
            perform change-this-field.

       change-this-field.
            if which-field = 1
                perform enter-control-last-voucher.

            perform rewrite-control-record.

       inquire-mode.
            move "inquire" to the-mode.
            perform get-control-record.
            if record-found = "Y"
                perform inquire-records.

       inquire-records.
            perform display-all-fields.
            perform press-enter.

       press-enter.
            display " ".
            display "PRESS ENTER TO CONTINUE".
            accept a-dummy.

       enter-control-last-voucher.
            perform accept-control-last-voucher.

       accept-control-last-voucher.
            display "ENTER LAST VOUCHER NUMBER".
            accept control-last-voucher.

       init-control-record.
            move zeroes to control-record.

       enter-control-key.
            move 1 to control-key.

       get-control-record.
            perform init-control-record.
            perform enter-control-key.
            move "N" to record-found.
            perform find-control-record.

       find-control-record.
            perform read-control-record.
            if record-found = "N"
                display "RECORD NOT FOUND"
                display "YOU MUST RUN CTLBLD01"
                display "TO CREATE THIS FILE".

       display-all-fields.
            display " ".
            perform display-control-last-voucher.
            display " ".

       display-control-last-voucher.
            display "1. LAST VOUCHER NUMBER: " control-last-voucher.

       read-control-record.
            move "Y" to record-found.
            read control-file record
               invalid key
               move "N" to record-found.

       rewrite-control-record.
            rewrite control-record
               invalid key
               display "ERROR REWRITING CONTROL RECORD".
