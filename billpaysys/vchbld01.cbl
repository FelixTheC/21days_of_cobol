      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vchbld01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            copy "slvouch.cbl".

       DATA DIVISION.
       FILE SECTION.

            copy "fdvouch.cbl".

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

       PROGRAM-EXIT.
            EXIT PROGRAM.

       PROGRAM-DONE.
            STOP RUN.
