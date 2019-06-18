      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. range01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   THE-NUMBER       PIC 9(3).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.

            PERFORM GET-THE-NUMBER.

            PERFORM CHECK-THE-NUMBER.

       PROGRAM-DONE.
            STOP RUN.

       GET-THE-NUMBER.
            DISPLAY "Enter a number greater than 10".
            DISPLAY "and less then 100. (011-099)".
            ACCEPT THE-NUMBER.

       CHECK-THE-NUMBER.
           IF THE-NUMBER > 10 AND
               THE-NUMBER < 100
                  DISPLAY "Your number is in range".
