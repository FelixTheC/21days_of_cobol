      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. numOp.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
      *--------------------------------------------------
      * This program asks the user for a number for a
      * multiplication table, and a table size
      * and then displays a table for that number
      * times the values 1 through HOW-MANY.
      *
      *--------------------------------------------------
       WORKING-STORAGE SECTION.
       01   THE-NUMBER      PIC S9(4)V99 VALUE ZEROS.
       01   THE-MULTIPLIER  PIC 9(3) VALUE 3.
       01   THE-PRODUCT     PIC 9(4) VALUE ZEROS.
       01   HOW-MANY        PIC 9(3) VALUE 60.
       01   SCREEN-LINES    PIC 9(3).

       01   A-DUMMY         PIC X.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            COMPUTE THE-NUMBER ROUNDED = (THE-MULTIPLIER * 10) +
               (HOW-MANY / 50) ON SIZE ERROR
               DISPLAY "Warning Size error.".
            DISPLAY THE-NUMBER.

            ADD THE-MULTIPLIER TO THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Add - overflow".
            DISPLAY THE-NUMBER.

            ADD 0.342 TO THE-MULTIPLIER
               GIVING THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Add - overflow".
            DISPLAY THE-NUMBER.

            SUBTRACT 10000.342 FROM THE-MULTIPLIER
               GIVING THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Subtract - overflow".
            DISPLAY THE-NUMBER.

            MULTIPLY HOW-MANY BY THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Multiply - overflow".
            DISPLAY THE-NUMBER.

            MULTIPLY 0.342 BY THE-MULTIPLIER
               GIVING THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Multiply - overflow".
            DISPLAY THE-NUMBER.

            DIVIDE HOW-MANY INTO THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Multiply - overflow".
            DISPLAY THE-NUMBER.

            DIVIDE 0.342 INTO THE-MULTIPLIER
               GIVING THE-NUMBER ROUNDED
               ON SIZE ERROR
               DISPLAY "Multiply - overflow".
            DISPLAY THE-NUMBER.

       PROGRAM-DONE.
            STOP RUN.
