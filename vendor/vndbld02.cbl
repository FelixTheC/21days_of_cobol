      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vndbld02.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            COPY "slvnd01.cbl".

       DATA DIVISION.
       FILE SECTION.

            COPY "fdvnd01.cbl".

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            OPEN OUTPUT VENDOR-FILE.
            CLOSE VENDOR-FILE.

       PROGRAM-DONE.
            STOP RUN.
