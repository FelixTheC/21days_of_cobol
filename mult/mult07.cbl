      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mult07.
      *--------------------------------------------------
      * This program asks the user for a number for a
      * multiplication table, and a table size
      * and then displays a table for that number
      * times the values 1 through HOW-MANY.
      *
      * The display is paused after each 15 lines.
      *--------------------------------------------------
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   THE-TABLE          PIC 9(2).
       01   THE-ENTRY          PIC 9(3) VALUE ZEROS.
       01   THE-PRODUCT        PIC 9(4).
       01   HOM-MANY-TIMES     PIC 9(2).
       01   SCREEN-LINES       PIC 9(2).

       01   A-DUMMY            PIC X.
       01   YES-OR-NO          PIC X VALUE "Y".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            PERFORM DIPLAY-ONE-TABLE
               UNTIL YES-OR-NO = "N".

       PROGRAM-DONE.
            STOP RUN.

       DIPLAY-ONE-TABLE.
            PERFORM GET-WHICH-TABLE.
            PERFORM DISPLAY-THE-TABLE.
            PERFORM GO-AGAIN.

       GET-WHICH-TABLE.
            DISPLAY "Which multiplication table(01-99)?".
               ACCEPT THE-TABLE.

       DISPLAY-THE-TABLE.
            PERFORM GET-HOW-MANY-ENTRIES.

            PERFORM DISPLAY-ONE-ENTRY
               VARYING THE-ENTRY
               FROM 1 BY 1
               UNTIL THE-ENTRY > HOM-MANY-TIMES.

       GO-AGAIN.
            DISPLAY "Go Again (Y/N)?".
            ACCEPT YES-OR-NO.

            IF YES-OR-NO = "y"
                MOVE "Y" TO YES-OR-NO.
            IF YES-OR-NO NOT = "Y"
                MOVE "N" TO YES-OR-NO.

       GET-HOW-MANY-ENTRIES.
            DISPLAY "How many entries would you like (01-99)?".
            ACCEPT HOM-MANY-TIMES.

       DISPLAY-ONE-ENTRY.
            MOVE 0 TO SCREEN-LINES.

            IF SCREEN-LINES = 15
                PERFORM PRESS-ENTER.

            MULTIPLY THE-ENTRY BY THE-TABLE
               GIVING THE-PRODUCT.

            DISPLAY
               THE-TABLE " * " THE-ENTRY " = " THE-PRODUCT.

            ADD 1 TO SCREEN-LINES.

       PRESS-ENTER.
            DISPLAY "Press ENTER to continue . . .".
            ACCEPT A-DUMMY.
            MOVE 0 TO SCREEN-LINES.
