      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. phnlst01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT OPTIONAL PHONE-FILE
            ASSIGN TO "phone.dat"
            ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD   PHONE-FILE
            LABEL RECORDS ARE STANDARD.
       01   PHONE-RECORD.
            05 PHONE-LAST-NAME         PIC X(20).
            05 PHONE-FIRST-NAME        PIC X(20).
            05 PHONE-NUMBER            PIC X(15).

       WORKING-STORAGE SECTION.
       01   FIELDS-TO-DISPLAY.
            05 PROMPT-1                PIC X(10) VALUE "Last Name:".
            05 DISPLAY-LAST-NAME       PIC X(20).
            05 PROMPT-2                PIC X(6) VALUE "First:".
            05 DISPLAY-FIRST-NAME      PIC X(20).
            05 PROMPT-3                PIC X(3) VALUE "NO:".
            05 DISPLAY-NUMBER          PIC X(15).

       01   END-OF-FILE                PIC X.
            88 IS-END-OF-FILE          VALUE "Y".
            88 NOT-END-OF-FILE         VALUE "N".

       77   SCREEN-LINES               PIC 9(2).
       77   A-DUMMY                    PIC X.

       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.

            PERFORM OPENING-PROCEDURE.
            MOVE ZEROS TO SCREEN-LINES.
            MOVE "N" TO END-OF-FILE.
            PERFORM DISPLAY-RECORDS
               UNTIL IS-END-OF-FILE.
            PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

       OPENING-PROCEDURE.
            OPEN INPUT PHONE-FILE.

       CLOSING-PROCEDURE.
            CLOSE PHONE-FILE.

       DISPLAY-RECORDS.
            PERFORM DISPLAY-FIELDS.
            PERFORM READ-NEXT-RECORD.

       DISPLAY-FIELDS.
            IF SCREEN-LINES = 15
                PERFORM PRESS-ENTER.
            MOVE PHONE-LAST-NAME TO DISPLAY-LAST-NAME.
            MOVE PHONE-FIRST-NAME TO DISPLAY-FIRST-NAME..
            MOVE PHONE-NUMBER TO DISPLAY-NUMBER..
            DISPLAY FIELDS-TO-DISPLAY.
            ADD 1 TO SCREEN-LINES.

       READ-NEXT-RECORD.
            READ PHONE-FILE NEXT RECORD
               AT END
               MOVE "Y" TO END-OF-FILE.

       PRESS-ENTER.
            DISPLAY "Press ENTER to continue . . ".
            ACCEPT A-DUMMY.
            MOVE ZEROS TO SCREEN-LINES.
