      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  THE-NAME         PIC X(10).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.

           DISPLAY "Enter a name".

           ACCEPT THE-NAME.

           DISPLAY "Hello " THE-NAME.

       PROGRAM-DONE.

           STOP RUN.
