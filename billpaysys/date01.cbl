      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. date01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       77   date-entry-field                           pic z9/99/9999.
       77   date-mmddccyy                              pic 9(8).
       77   date-ccyymmdd                              pic 9(8).

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
            display "ENTER A DATE (MM/DD/CCYY)".
            accept date-entry-field.
            move date-entry-field to date-mmddccyy.
            compute date-ccyymmdd = date-mmddccyy * 10000.0001.

       display-and-get-date.
            perform display-a-date.
            perform get-a-date.

       display-a-date.
            move date-mmddccyy to date-entry-field.
            display "FORMATTED DATE IS " date-entry-field.
            display "date-mmddccyy IS " date-mmddccyy.
            display "date-ccyymmdd IS " date-ccyymmdd.
