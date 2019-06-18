      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. yesorno03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   YES-OR-NO      PIC X.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            PERFORM GET-THE-ANSWER.

            PERFORM EDIT-THE-ANSWER.

            PERFORM DISPLAY-THE-ANSWER.


       PROGRAM-DONE.
            STOP RUN.

       GET-THE-ANSWER.
            DISPLAY "Is the answer Yes or No (Y/N).".
            ACCEPT YES-OR-NO.

       EDIT-THE-ANSWER.
            IF YES-OR-NO IS EQUAL "y"
                MOVE "Y" TO YES-OR-NO.

            IF YES-OR-NO IS EQUAL "n"
                MOVE "N" TO YES-OR-NO.

       DISPLAY-THE-ANSWER.
            IF YES-OR-NO IS EQUAL "Y"
                PERFORM IT-IS-VALID
                DISPLAY "Your answer is Yes".

             IF YES-OR-NO IS EQUAL "N"
                 PERFORM IT-IS-VALID
                 DISPLAY "Your answer is No".

       IT-IS-VALID.
            DISPLAY "Your answer is valid and".
