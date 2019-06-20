      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. decimal.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   SALES-TOTAL        PIC S9(5)V99 VALUE IS 44707.66.
       01   COMMISSION-PERCENT PIC 99 VALUE IS 11.
       01   PERCENT-DECIMAL    PIC V99.
       01   THE-COMMISSION     PIC S9(5)V99 VALUE ZEROS.
      * The same as S9(5)V99.
       01   DISPLAY-COMMISON   PIC -9(5).99.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
      * Divide commission by 100 to convert to decimal
            COMPUTE PERCENT-DECIMAL = COMMISSION-PERCENT / 100.

            COMPUTE THE-COMMISSION = PERCENT-DECIMAL * SALES-TOTAL.

            MOVE THE-COMMISSION TO DISPLAY-COMMISON.

            DISPLAY "The Commission is " DISPLAY-COMMISON.

       PROGRAM-DONE.
            STOP RUN.
