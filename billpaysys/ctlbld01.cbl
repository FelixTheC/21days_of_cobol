      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ctlbld01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            copy "slcontrol.cbl".

       DATA DIVISION.
       FILE SECTION.

            copy "fdcontrol.cbl".

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            open output control-file.
            move 1 to control-key.
            move zeroes to control-last-voucher.
            write control-record.
            close control-file.

       PROGRAM-EXIT.
            EXIT PROGRAM.

       PROGRAM-DONE.
            STOP RUN.
