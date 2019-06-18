      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello04.
       DATA DIVISION.
       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            DISPLAY "Today's Message is:"
            PERFORM SAY-HELLO.

       PROGRAM-DONE.
            STOP RUN.

       SAY-HELLO.
            DISPLAY "Hello World".
