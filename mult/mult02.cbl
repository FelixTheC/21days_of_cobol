      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mult02.
      *--------------------------------------------------
      * This program asks the user for a number for a
      * multiplication table,
      * and then displays a table for that number times
      * the values 1 through 12.
      *--------------------------------------------------
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   THE-NUMBER      PIC 9(2).
       01   THE-MULTIPLIER  PIC 9(3).
       01   THE-PRODUCT     PIC 9(4).

       PROCEDURE DIVISION.
.      PROGRAM-BEGIN.

            PERFORM PROGRAM-INITIALIZATION.
            PERFORM GET-TABLE-NUMBER.
            PERFORM DISPLAY-THE-TABLE.

       PROGRAM-DONE.
            STOP RUN.

       PROGRAM-INITIALIZATION.
            MOVE 0 TO THE-MULTIPLIER.

       GET-TABLE-NUMBER.
            DISPLAY "Which multiplication table? (01-99)".
            ACCEPT THE-NUMBER.

       DISPLAY-THE-TABLE.
            DISPLAY "The " THE-NUMBER "'s table is:".
      *The better way rather the GO TO
            PERFORM CALCULATE-AND-DISPLAY 10 TIMES.

       CALCULATE-AND-DISPLAY.
            ADD 1 TO THE-MULTIPLIER.
            COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
            DISPLAY
                THE-NUMBER " * " THE-MULTIPLIER " = " THE-PRODUCT.
