      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. trunc01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   6-BYTES    PIC X(6) VALUE "HELLO".
       01   5-BYTES    PIC X(5) VALUE "HELLO".
       01   4-BYTES    PIC X(4) VALUE "HELLO".
       01   3-BYTES    PIC X(3) VALUE "HELLO".
       01   2-BYTES    PIC X(2) VALUE "HELLO".
       01   1-BYTE     PIC X    VALUE "HELLO".

       01   5-DIGITS   PIC 9(5) VALUE 2397.
       01   4-DIGITS   PIC 9(4) VALUE 2397.
       01   3-DIGITS   PIC 9(3) VALUE 2397.
       01   2-DIGITS   PIC 9(2) VALUE 2397.
       01   1-DIGIT    PIC 9    VALUE 2397.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            DISPLAY 6-BYTES.
            DISPLAY 5-BYTES.
            DISPLAY 4-BYTES.
            DISPLAY 3-BYTES.
            DISPLAY 2-BYTES.
            DISPLAY 1-BYTE.

            DISPLAY 5-DIGITS.
            DISPLAY 4-DIGITS.
            DISPLAY 3-DIGITS.
            DISPLAY 2-DIGITS.
            DISPLAY 1-DIGIT.

       PROGRAM-DONE.
            STOP RUN.
