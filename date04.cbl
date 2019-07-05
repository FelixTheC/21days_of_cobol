      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. date04.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.

            copy "wsdate.cbl".

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

            copy "pldate.cbl".

       display-and-get-date.
            perform display-a-date.
            perform get-a-date.

       display-a-date.
            move date-mmddccyy to date-entry-field.
            display "FORMATTED DATE IS " date-entry-field.
            display "date-mmddccyy IS " date-mmddccyy.
            display "date-ccyymmdd IS " date-ccyymmdd.
