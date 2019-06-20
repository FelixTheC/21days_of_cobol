      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. nums01.
      *------------------------------------------------
      * Illustrates how decimal data is displayed
      * when edited.
      *------------------------------------------------
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01   ENTRY-FIELD        PIC -ZZZ,ZZZ.ZZ.
       01   THE-VALUE          PIC S9(6)V99.

       01   EDITED-DISPLAY-1   PIC -9(6).99.
       01   EDITED-DISPLAY-2   PIC ZZZZZ9.99-.
       01   EDITED-DISPLAY-3   PIC ZZZZZZ.ZZ-.
       01   EDITED-DISPLAY-4   PIC ZZZ,ZZZ.ZZ-.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            DISPLAY "PLEASE ENTER A VALUE".
            ACCEPT ENTRY-FIELD.
      *or   ACCEPT ENTRY-FIELD CONVERT.
      *or   ACCEPT ENTRY-FIELD WITH CONVERSION.
            MOVE ENTRY-FIELD TO THE-VALUE.

            MOVE THE-VALUE TO EDITED-DISPLAY-1
                              EDITED-DISPLAY-2
                              EDITED-DISPLAY-3
                              EDITED-DISPLAY-4.

            DISPLAY ENTRY-FIELD        "|"
                    EDITED-DISPLAY-1   "|"
                    EDITED-DISPLAY-2   "|"
                    EDITED-DISPLAY-3   "|"
                    EDITED-DISPLAY-4   "|".

            IF THE-VALUE NOT = ZERO
                GO TO PROGRAM-BEGIN.

       PROGRAM-DONE.
            STOP RUN.
