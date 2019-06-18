      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello05.
       DATA DIVISION.
       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            DISPLAY "Today's Message is:"
            PERFORM SAY-HELLO.

      *Not a good idea to place the SAY-HELLO paragraph here
       SAY-HELLO.
            DISPLAY "Hello World".

       PROGRAM-DONE.
            STOP RUN.
