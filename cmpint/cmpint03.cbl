      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. cmpint03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01   YES-NO                 PIC X.
            88 ANSWER-IS-NO        VALUE "N".

       77   ENTRY-OK               PIC X.
       77   THE-INTEREST           PIC 9(2)V9.
       77   INTEREST-AS-DECIMAL    PIC V9(3).
       77   THE-PRINCIPAL          PIC 9(9)V99.
       77   WORKING-PRINCIPAL          PIC 9(9)V99.
       77   THE-NEW-VALUE          PIC 9(9)V99.
       77   EARNED-INTEREST        PIC 9(9)V99.
       77   THE-PERIOD             PIC 9(4).
       77   NO-OF-PERIODS          PIC 9(3).

       77   ENTRY-FIELD            PIC ZZZ,ZZZ,ZZZ.ZZ.

       01   THE-WHOLE-MESSAGE.
            05 DISPLAY-PRINCIPAL       PIC ZZZ,ZZZ,ZZ9.99.
            05 FILLER                  PIC X(4) VALUE " at".
            05 DISPLAY-INTEREST        PIC Z9.9.
            05 FILLER                  PIC X(6) VALUE " % for".
            05 DISPLAY-PERIODS         PIC ZZ9.
            05 FILLER                  PIC X(16)
                                           VALUE " periods yields".
            05 DISPLAY-VALUE          PIC ZZZ,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM GET-AND-DISPLAY-RESULT
               UNTIL ANSWER-IS-NO.

       PROGRAM-DONE.
            STOP RUN.

       GET-AND-DISPLAY-RESULT.
            PERFORM GET-THE-PRINCIPAL.
            PERFORM GET-THE-INTEREST.
            PERFORM GET-THE-PERIODS.
            PERFORM CALCULATE-THE-RESULT.
            PERFORM DISPLAY-THE-RESULT.
            PERFORM GO-AGAIN.

       GET-THE-PRINCIPAL.
            MOVE "N" TO ENTRY-OK.
            PERFORM ENTER-THE-PRINCIPAL
               UNTIL ENTRY-OK = "Y".

       ENTER-THE-PRINCIPAL.
            DISPLAY "Principal (.01 TO 999999.99)?".
            ACCEPT ENTRY-FIELD.
            MOVE ENTRY-FIELD TO THE-PRINCIPAL.
            IF THE-PRINCIPAL < .01 OR
                THE-PRINCIPAL > 999999.99
                DISPLAY "INVALID ENTRY"
            ELSE
                MOVE "Y" TO ENTRY-OK.

       GET-THE-INTEREST.
            MOVE "N" TO ENTRY-OK.
            PERFORM ENTER-THE-INTEREST
                UNTIL ENTRY-OK = "Y".

       ENTER-THE-INTEREST.
            DISPLAY "Interest (.1% TO 99.9%)?".
            ACCEPT ENTRY-FIELD.

            MOVE ENTRY-FIELD TO THE-INTEREST.
            IF THE-INTEREST < .01 OR
                THE-INTEREST > 99.9
                DISPLAY "INVALID ENTRY"
                GO TO GET-THE-INTEREST
            ELSE
                MOVE "Y" TO ENTRY-OK.
                COMPUTE INTEREST-AS-DECIMAL =
                   THE-INTEREST / 100.

       GET-THE-PERIODS.
            MOVE "N" TO ENTRY-OK.
            PERFORM ENTER-THE-PERIODS
               UNTIL ENTRY-OK = "Y".

       ENTER-THE-PERIODS.
            DISPLAY "Number of periods (1 TO 999)?".
            ACCEPT ENTRY-FIELD.

            MOVE ENTRY-FIELD TO NO-OF-PERIODS.
            IF NO-OF-PERIODS < 1 OR
                NO-OF-PERIODS > 999
                DISPLAY "INVALID ENTRY"
            ELSE
                MOVE "Y" TO ENTRY-OK.

       CALCULATE-THE-RESULT.
           MOVE THE-PRINCIPAL TO WORKING-PRINCIPAL.
            PERFORM CALCULATE-ONE-PERIOD
               VARYING THE-PERIOD FROM 1 BY 1
               UNTIL THE-PERIOD > NO-OF-PERIODS.

       CALCULATE-ONE-PERIOD.
            COMPUTE EARNED-INTEREST ROUNDED =
               WORKING-PRINCIPAL * INTEREST-AS-DECIMAL.
            COMPUTE THE-NEW-VALUE =
               WORKING-PRINCIPAL + EARNED-INTEREST.
            MOVE THE-NEW-VALUE TO WORKING-PRINCIPAL.

       GO-AGAIN.
            DISPLAY "GO AGAIN?".
            ACCEPT YES-NO.

            IF YES-NO = "y"
                MOVE "Y" TO YES-NO.
            IF YES-NO NOT = "Y"
                MOVE "N" TO YES-NO.

       DISPLAY-THE-RESULT.
            MOVE THE-PRINCIPAL TO DISPLAY-PRINCIPAL.
            MOVE THE-INTEREST TO DISPLAY-INTEREST.
            MOVE NO-OF-PERIODS TO DISPLAY-PERIODS.
            MOVE THE-NEW-VALUE TO DISPLAY-VALUE.
            DISPLAY THE-WHOLE-MESSAGE.
