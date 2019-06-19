      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. quit01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   YES-OR-NO      PIC X.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM SHALL-WE-CONTINUE.
            IF YES-OR-NO = "N"
                GO TO PROGRAM-DONE.

             PERFORM MAIN-LOGIC.

       PROGRAM-DONE.
            STOP RUN.

       SHALL-WE-CONTINUE.
            DISPLAY "Continue (Y/N)?".
            ACCEPT YES-OR-NO.

            IF YES-OR-NO = "n"
                MOVE "N" TO YES-OR-NO.

       MAIN-LOGIC.
           DISPLAY "This is the main logic".
