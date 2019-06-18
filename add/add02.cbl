      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. add02.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   FIRST-NUMBER     PICTURE IS 99.
       01   SECOND-NUMBER    PIC 99.
       01   RESULT           PIC 9(3).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            DISPLAY "Enter the first number.".
            ACCEPT FIRST-NUMBER.

            DISPLAY "Enter the second number.".
            ACCEPT SECOND-NUMBER.

            COMPUTE RESULT = FIRST-NUMBER + SECOND-NUMBER.

            DISPLAY "The result is: " RESULT.

       PROGRAM-DONE.
            STOP RUN.
