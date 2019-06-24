      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. phnadd03.
      *--------------------------------------------------
      * This program creates a new data file if necessary
      * and adds records to the file from user entered
      * data. The records are written to the data file
      * and echoed to the printer.
      *--------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT PHONE-FILE
            ASSIGN TO "phone.dat"
            ORGANIZATION IS SEQUENTIAL.

            SELECT PRINTER-FILE
            ASSIGN TO "prntfile"
            ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD   PHONE-FILE
            LABEL RECORDS ARE STANDARD.
       01   PHONE-RECORD.
            05 PHONE-LAST-NAME             PIC X(20).
            05 PHONE-FIRST-NAME            PIC X(20).
            05 PHONE-NUMBER                PIC X(15).
            05 PHONE-EXTENSION             PIC X(5).

       FD   PRINTER-FILE
            LABEL RECORDS ARE OMITTED.
       01   PRINTER-RECORD                 PIC X(80).

       WORKING-STORAGE SECTION.

       77   PROMPT-1                       PIC X(9) VALUE "Last Name".
       77   PROMPT-2                       PIC X(10) VALUE "First Name".
       77   PROMPT-3                       PIC X(6) VALUE "Number".
       77   PROMPT-4                       PIC X(9) VALUE "EXTENSION".

       01   YES-NO                         PIC X.
            88 IS-YES                      VALUE "Y".
            88 IS-NO                       VALUE "N".

       01   ENTRY-OK                       PIC X.
            88 ENTRY-IS-OK                 VALUE "Y".
            88 ENTRY-NOT-OK                VALUE "N".

       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.

            PERFORM OPENING-PROCEDURE.
            MOVE "Y" TO YES-NO.
            PERFORM ADD-RECORDS
               UNTIL IS-NO.
            PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

       OPENING-PROCEDURE.
            OPEN EXTEND PHONE-FILE.
            OPEN OUTPUT PRINTER-FILE.

       CLOSING-PROCEDURE.
            CLOSE PHONE-FILE.
            MOVE SPACE TO PRINTER-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
            CLOSE PRINTER-FILE.

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
            DISPLAY PROMPT-4 " ? ".
            ACCEPT PHONE-EXTENSION.
            PERFORM VALIDATE-FIELDS.

       VALIDATE-FIELDS.
            MOVE "Y" TO ENTRY-OK.
            IF PHONE-LAST-NAME = SPACE
                DISPLAY "LAST NAME MUST BE ENTERED"
                MOVE "N" TO ENTRY-OK.

       ADD-THIS-RECORD.
            MOVE PHONE-RECORD TO PRINTER-RECORD.
            WRITE PHONE-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING 1.

       GO-AGAIN.
            DISPLAY "GO AGAIN?".
            ACCEPT YES-NO.
            IF YES-NO = "y"
                MOVE "Y" TO YES-NO.
            IF YES-NO NOT = "Y"
                MOVE "N" TO YES-NO.
