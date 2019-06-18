      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. add06.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   FIRST-NUMBER     PIC 9(2).
       01   SECOND-NUMBER    PIC 9(2).
       01   RESULT           PIC 9(3).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            DISPLAY "This program will add 2 numbers.".

            DISPLAY "Enter the first number.".
            ACCEPT FIRST-NUMBER.

            DISPLAY "Fooled you".
            STOP RUN.

            DISPLAY "Enter the second number.".
            ACCEPT SECOND-NUMBER.

            COMPUTE RESULT = FIRST-NUMBER + SECOND-NUMBER.
            DISPLAY "The result is " RESULT.

       PROGRAM-DONE.
            STOP RUN.
