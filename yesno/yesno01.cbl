      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. yesno01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   YES-OR-NO       PIC X.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.

            PERFORM GET-THE-ANSWER.

            PERFORM DISPLAY-THE-ANSWER.

       PROGRAM-DONE.
            STOP RUN.

       GET-THE-ANSWER.
            DISPLAY "Is the answer Yes or No?? (Y/N)".
            ACCEPT YES-OR-NO.

       DISPLAY-THE-ANSWER.
            IF YES-OR-NO IS EQUAL "Y"
                DISPLAY "You answered Yes".
            IF YES-OR-NO IS EQUAL "N"
                DISPLAY "You answered No".
