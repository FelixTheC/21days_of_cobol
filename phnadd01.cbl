      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. phnadd01.
      *--------------------------------------------------
      * This program creates a new data file if necessary
      * and adds records to the file from user entered
      * data.
      *--------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT OPTIONAL PHONE-FILE
      *or SELECT PHONE-FILE
            ASSIGN TO "phone.dat"
      *or ASSIGN TO "phone"
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
      *VARIABLES FOR SCREEN ENTRY
       77   PROMPT-1                   PIC X(9) VALUE "Last Name".
       77   PROMPT-2                   PIC X(10) VALUE "First Name".
       77   PROMPT-3                   PIC X(6) VALUE "Phone Number".

       01   YES-NO                     PIC X.
            88 AGAIN-IS-YES                  VALUE "Y".
            88 AGAIN-IS-NO                   VALUE "N".

       01   ENTRY-OK                   PIC X.
            88 ENTRY-IS-OK             VALUE "Y".
            88 ENTRY-IS-NOT            VALUE "N".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM OPENING-PROCEDURE.
            MOVE "Y" TO YES-NO.
            PERFORM ADD-RECORDS
               UNTIL AGAIN-IS-NO.
            PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

      *OPENING AND CLOSING
       OPENING-PROCEDURE.
            OPEN EXTEND PHONE-FILE.

       CLOSING-PROCEDURE.
            CLOSE PHONE-FILE.

       ADD-RECORDS.
            MOVE "N" TO ENTRY-OK.
            PERFORM GET-FIELDS
               UNTIL ENTRY-IS-OK.
            PERFORM ADD-THIS-RECORD.
            PERFORM GO-AGAIN.

       GET-FIELDS.
            MOVE SPACE TO PHONE-RECORD.
            DISPLAY PROMPT-1 " ? ".
            ACCEPT PHONE-LAST-NAME.
            DISPLAY PROMPT-2 " ? ".
            ACCEPT PHONE-FIRST-NAME.
            DISPLAY PROMPT-3 " ? ".
            ACCEPT PHONE-NUMBER.
            PERFORM VALIDATE-FIELDS.

       VALIDATE-FIELDS.
            MOVE "Y" TO ENTRY-OK.
            IF PHONE-LAST-NAME = SPACE
                DISPLAY "LAST NAME MUST BE ENTERED"
                MOVE "N" TO ENTRY-OK.

       ADD-THIS-RECORD.
            WRITE PHONE-RECORD.

       GO-AGAIN.
            DISPLAY "GO AGAIN?".
            ACCEPT YES-NO.
            IF YES-NO = "y"
                MOVE "Y" TO YES-NO.
            IF YES-NO NOT = "Y"
                MOVE "N" TO YES-NO.
