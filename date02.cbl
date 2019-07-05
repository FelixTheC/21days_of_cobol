      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. date02.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       77   date-entry-field                           pic z9/99/9999.
       77   date-mmddccyy                              pic 9(8).
       77   date-quotient                              pic 9(4).
       77   date-remainder                             pic 9(4).

       77   valid-date-flag                         pic x.
            88 date-is-invalid                         value "N".
            88 date-is-zero                            value "0".
            88 date-is-valid                           value "Y".
            88 date-is-ok                              value "Y" "0".

       01   date-ccyymmdd                              pic 9(8).
       01   filler redefines date-ccyymmdd.
            05 date-ccyy                               pic 9(4).
            05 date-mm                                 pic 9(2).
            05 date-dd                                 pic 9(2).

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

       closing-procedure.

       main-process.
            perform get-a-date.
            perform display-and-get-date
               until date-mmddccyy = zeroes.

       get-a-date.
            perform accept-a-date.
            perform re-accept-a-date
               until date-is-ok.

       accept-a-date.
            display "ENTER A DATE (MM/DD/CCYY)".
            accept date-entry-field.
            perform edit-check-date.

       re-accept-a-date.
            display "INVALID DATE".
            perform accept-a-date.

       edit-check-date.
            perform edit-date.
            perform check-date.

       edit-date.
            move date-entry-field to date-mmddccyy.
            compute date-ccyymmdd = date-mmddccyy * 10000.0001.

       check-date.
            move "Y" to valid-date-flag.
            perform check-if-date-zeroes.
            if date-is-valid
                perform check-mm.
            if date-is-valid
                perform check-dd.
            if date-is-valid
                perform check-mmdd.
            if date-is-valid
                perform check-leap-year.

       check-if-date-zeroes.
            if date-ccyymmdd = zeroes
                move "0" to valid-date-flag.

       check-mm.
            if date-mm < 1 or date-mm > 12
                move "N" to valid-date-flag.

       check-dd.
            if date-dd < 1 or date-mm > 31
                move "N" to valid-date-flag.

       check-mmdd.
            if (date-dd > 30) and (date-mm = 2 or 4 or 6 or 9 or 11)
                move "N" to valid-date-flag
            else
                if date-dd > 29 and date-mm = 2
                    move "N" to valid-date-flag.

       check-leap-year.
            if date-dd = 29 and date-mm = 2
                divide date-ccyy by 400 giving date-quotient
                   remainder date-remainder
                if date-remainder = 0
                    move "Y" to valid-date-flag
                else
                    divide date-ccyy by 100 giving date-quotient
                       remainder date-remainder
                    if date-remainder = 0
                        move "N" to valid-date-flag
                    else
                        divide date-ccyy by 4 giving date-quotient
                           remainder date-remainder
                        if date-remainder = 0
                            move "Y" to valid-date-flag
                        else
                            move "N" to valid-date-flag.

       display-and-get-date.
            perform display-a-date.
            perform get-a-date.

       display-a-date.
            move date-mmddccyy to date-entry-field.
            display "FORMATTED DATE IS " date-entry-field.
            display "date-mmddccyy IS " date-mmddccyy.
            display "date-ccyymmdd IS " date-ccyymmdd.
