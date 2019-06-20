      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. jack05.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   THE-MESSAGE        PIC X(50)
               VALUE IS "Jack be nimble,".
       01   THE-NUMBER         PIC 9(2) VALUE IS 1.
      *Best practices for Initialization
      *PIC X VALUE SPACE OR PIC X(50) VALUE SPACES.
      *OR FOR NUMERIC PIC 9 VALUE ZERO OR PIC 9(2) VALUE ZEROS.
       01   A-SPACE            PIC X VALUE IS " ".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM DISPLAY-NUMBER-MESSAGE.

            ADD 1 TO THE-NUMBER.
            MOVE "Jack be quick," TO THE-MESSAGE.
            PERFORM DISPLAY-NUMBER-MESSAGE.

            ADD 1 TO THE-NUMBER.
            MOVE "Jack jump over the candlestick." TO THE-MESSAGE.
            PERFORM DISPLAY-NUMBER-MESSAGE.

       PROGRAM-DONE.
            STOP RUN.

       DISPLAY-NUMBER-MESSAGE.
            DISPLAY
               THE-NUMBER
               A-SPACE
               THE-MESSAGE.
