      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. wrdstr01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   WORD-1       PIC X(50).
       01   WORD-2       PIC X(50).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.

            PERFORM INITIALIZE-PROGRAM.
            PERFORM ENTER-THE-WORDS.
            PERFORM DISPLAY-THE-WORDS.

       PROGRAM-DONE.
            STOP RUN.

       INITIALIZE-PROGRAM.
            MOVE " " TO WORD-1.
            MOVE " " TO WORD-2.

       ENTER-THE-WORDS.
            DISPLAY "This program will accept 2 words,".
            DISPLAY "and then display them".
            DISPLAY "in ASCII order.".

            DISPLAY "Enter your first word".
            ACCEPT WORD-1.

            DISPLAY "Enter your second word".
            ACCEPT WORD-2.

       DISPLAY-THE-WORDS.
            DISPLAY "The words in ASCII order are:".

            IF WORD-1 > WORD-2
                DISPLAY WORD-2
                DISPLAY WORD-1.

            IF WORD-1 NOT > WORD-2
                DISPLAY WORD-1
                DISPLAY WORD-2.
