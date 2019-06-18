      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. add04.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01   FIRST-NUMBER      PIC 9(2).
       01   SECOND-NUMBER     PIC 9(2).
       01   RESULT            PIC 9(3).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            DISPLAY "This Program will add 2 numbers.".

       GET-FIRST-NUMBER.
            DISPLAY "Enter your first number.".
            ACCEPT FIRST-NUMBER.

       GET-SECOND-NUMBER.
            DISPLAY "Enter your second number.".
            ACCEPT SECOND-NUMBER.

       COMPUTE-AND-DISPLAY.
            COMPUTE RESULT = FIRST-NUMBER + SECOND-NUMBER.
            DISPLAY FIRST-NUMBER " + " SECOND-NUMBER " = " RESULT.

       PROGRAM-DONE.
            STOP RUN.
