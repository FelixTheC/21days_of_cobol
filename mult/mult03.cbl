      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mult03.
      *--------------------------------------------------
      * This program asks the user for a number for a
      * multiplication table, and a table size
      * and then displays a table for that number times
      * the values 1 through HOW-MANY.
      *--------------------------------------------------
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   THE-NUMBER      PIC 9(2).
       01   THE-MULTIPLIER  PIC 9(3).
       01   THE-RESULT      PIC 9(4).
       01   HOW-MANY        PIC 9(3).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM PROGRAM-INITIALIZATION.
            PERFORM GET-TABLE-DATA.
            PERFORM DISPLAY-THE-TABLE.

       PROGRAM-DONE.
            STOP RUN.

       PROGRAM-INITIALIZATION.
            MOVE 0 TO THE-MULTIPLIER.

       GET-TABLE-DATA.
            DISPLAY "Which multiplication table (01-99)"
            ACCEPT THE-NUMBER.

            DISPLAY "How many entries do you like (01-100)".
            ACCEPT HOW-MANY.

       DISPLAY-THE-TABLE.
            DISPLAY "The table for " THE-NUMBER " is:".
            PERFORM CALCULATE-AND-DISPLAY-TABLE HOW-MANY TIMES.

       CALCULATE-AND-DISPLAY-TABLE.
            ADD 1 TO THE-MULTIPLIER.
            COMPUTE THE-RESULT = THE-NUMBER * THE-MULTIPLIER.
            DISPLAY
               THE-NUMBER " * " THE-MULTIPLIER " = " THE-RESULT.
