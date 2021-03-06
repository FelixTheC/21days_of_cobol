      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mult04.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
      *--------------------------------------------------
      * This program asks the user for a number for a
      * multiplication table, and a table size
      * and then displays a table for that number
      * times the values 1 through HOW-MANY.
      *
      * The display is paused after each 15 lines.
      *--------------------------------------------------
       WORKING-STORAGE SECTION.
       01   THE-NUMBER      PIC 9(2).
       01   THE-MULTIPLIER  PIC 9(3).
       01   THE-PRODUCT     PIC 9(4).
       01   HOW-MANY        PIC 9(3).
       01   SCREEN-LINES    PIC 9(3).

       01   A-DUMMY         PIC X.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM PROGRAM-INITIALIZATION.
            PERFORM GET-TABLE-DATA.
            PERFORM DISPLAY-THE-TABLE.

       PROGRAM-DONE.
            STOP RUN.

       PROGRAM-INITIALIZATION.
            MOVE 0 TO THE-MULTIPLIER.
            MOVE 0 TO SCREEN-LINES.

       GET-TABLE-DATA.
            DISPLAY
               "Which multiplication table (01-99)?".
            ACCEPT THE-NUMBER.

            DISPLAY "How many entries would you like (01-99)?".
            ACCEPT HOW-MANY.

       DISPLAY-THE-TABLE.
            DISPLAY "The " THE-NUMBER "`s table is:".
            PERFORM CALCULATE-AND-DISPLAY
               UNTIL THE-MULTIPLIER >= HOW-MANY.

       CALCULATE-AND-DISPLAY.
            ADD 1 TO THE-MULTIPLIER.
            COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
            DISPLAY
               THE-NUMBER " * " THE-MULTIPLIER " = " THE-PRODUCT.

            ADD 1 TO SCREEN-LINES.
            IF SCREEN-LINES = 15
                DISPLAY "Press Enter to continue ..."
                ACCEPT A-DUMMY
                MOVE 0 TO SCREEN-LINES.
