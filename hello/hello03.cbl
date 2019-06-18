      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello03.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  THE-MESSAGE       PIC X(20).
       01  THE-NAME          PIC X(10).
       01  THE-NUMBER        PIC 9(2).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            DISPLAY "Enter a name".
            ACCEPT THE-NAME.

            MOVE "Hello" TO THE-MESSAGE.

            MOVE 1 TO THE-NUMBER.

            DISPLAY "MESSAGE "
                    THE-NUMBER
                    ": "
                    THE-MESSAGE
                    THE-NAME.

            MOVE "Say Goodnight," TO THE-MESSAGE.

            MOVE 2 TO THE-NUMBER.

            DISPLAY "MESSAGE "
                    THE-NUMBER
                    ": "
                    THE-MESSAGE
                    THE-NAME.

       PROGRAM-DONE.
           STOP RUN.
