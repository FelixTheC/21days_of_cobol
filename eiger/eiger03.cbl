      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. eiger03.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   THE-MESSAGE      PIC X(50).
       01   THE-NUMBER       PIC 9(2).
       1    A-SPACE          PIC X.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
      *Initialize A-Space
            MOVE " " TO A-SPACE.

      *Start THE-NUMBER at 0
            MOVE 0 TO THE-NUMBER.

      *Set up and display line 1
            MOVE "There once was a lady from Eiger,"
                TO THE-MESSAGE.
            ADD 1 TO THE-NUMBER.
            DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.

      *Set up and display line 2
            MOVE "Who smiled and rode forth on a tiger"
                TO THE-MESSAGE.
            ADD 1 TO THE-NUMBER.
            DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.

      *Set up and display line 3
            MOVE "They returned from the ride" TO THE-MESSAGE.
            ADD 1 TO THE-NUMBER.
            DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.


      *Set up and display line 4
            MOVE "With the lady inside" TO THE-MESSAGE.
            ADD 1 TO THE-NUMBER.
            DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.

      *Set up and display line 5
            MOVE "And the smile on the face of the tiger."
                TO THE-MESSAGE.
            ADD 1 TO THE-NUMBER.
            DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.

       PROGRAM-DONE.
            STOP RUN.
