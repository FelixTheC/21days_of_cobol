      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. date05.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       77   any-date                           pic 9(8) value zeroes.
       77   required-date                      pic 9(8) value zeroes.

       77   formatted-date                     pic z9/99/9999.
       77   date-mmddccyy                      pic 9(8).
       77   date-quotient                      pic 9(4).
       77   date-remainder                     pic 9(4).

       77   valid-date-flag                    pic x.
            88 date-is-invalid                 value "N".
            88 date-is-zero                    value "0".
            88 date-is-valid                   value "Y".
            88 date-is-ok                      value "Y" "0".

       01   date-ccyymmdd                      pic 9(8).
       01   filler redefines date-ccyymmdd.
            05 date-ccyy                       pic 9(4).
            05 date-mm                         pic 9(2).
            05 date-dd                         pic 9(2).

       77   date-prompt                        pic x(50) value space.
       77   date-error-message                 pic x(50) value space.

       77   zero-date-is-ok                    pic x value "N".

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
            perform get-two-dates.
            perform display-and-get-date
               until required-date = 00010101.

       get-two-dates.
            perform get-any-date.
            perform get-required-date.

       get-any-date.
            move "Y" to zero-date-is-ok.
            move "ENTER AN OPTIONAL MM/DD/CCYY?" to date-prompt.
            move "MUST BE ANY VALID DATE" to date-error-message.
            perform get-a-date.
            move date-ccyymmdd to any-date.

       get-required-date.
            move "N" to zero-date-is-ok.
            move space to date-prompt.
            move "MUST ENTER A VALID DATE" to date-error-message.
            perform get-a-date.
            move date-ccyymmdd to required-date.

       display-and-get-date.
            perform display-the-date.
            perform get-two-dates.

       display-the-date.
            move any-date to date-ccyymmdd.
            perform format-the-date.
            display "ANY DATE IS " formatted-date.
            move required-date to date-ccyymmdd.
            perform format-the-date.
            display "REQUIRED DATE IS " formatted-date.

       get-a-date.
            perform accept-a-date.
            perform re-accept-a-date
               until date-is-ok.

       accept-a-date.
            if date-prompt = space
               display "ENTER A DATE (MM/DD/CCYY)"
            else
                display date-prompt.

            accept formatted-date.
            perform edit-check-date.

       re-accept-a-date.
            if date-error-message = space
               display "INVALID DATE"
            else
                display date-error-message.

            perform accept-a-date.

       edit-check-date.
            perform edit-date.
            perform check-date.
            move date-mmddccyy to formatted-date.

       edit-date.
            move formatted-date to date-mmddccyy.
            perform convert-to-ccyymmdd.

       convert-to-mmddccyy.
            compute date-mmddccyy = date-ccyymmdd * 10000.0001.

       convert-to-ccyymmdd.
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

       format-the-date.
            perform convert-to-mmddccyy.
            move date-mmddccyy to formatted-date.
