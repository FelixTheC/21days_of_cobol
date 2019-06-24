      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. phnprt02.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT OPTIONAL PHONE-FILE
               ASSIGN TO "phone02.dat"
               ORGANIZATION IS LINE SEQUENTIAL.

            SELECT PRINTER-FILE
               ASSIGN TO "PRINTER"
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

       01   TITLE-LINE.
            05 FILLER                      PIC X(21) VALUE SPACE.
            05 FILLER                      PIC X(17)
                                              VALUE "PHONE BOOK REPORT".
            05 FILLER                      PIC X(15) VALUE SPACE.
            05 FILLER                      PIC X(5) VALUE "Page:".
            05 PRINT-PAGE-NUMBER           PIC ZZZZ9.
      * Structure for printing a column heading
       01   COLUMN-HEADINGS.
            05 FILLER                      PIC X(9) VALUE "Last Name".
            05 FILLER                      PIC X(12) VALUE SPACE.
            05 FILLER                      PIC X(10) VALUE "First Name".
            05 FILLER                      PIC X(11) VALUE SPACE.
            05 FILLER                      PIC X(6) VALUE "Number".
            05 FILLER                      PIC X(10) VALUE SPACE.
            05 FILLER                      PIC X(4) VALUE "Ext.".

       01   DETAIL-LINE.
            05 PRINT-LAST-NAME             PIC X(20).
            05 FILLER                      PIC X(1) VALUE SPACE.
            05 PRINT-FIRST-NAME            PIC X(20).
            05 FILLER                      PIC X(1) VALUE SPACE.
            05 PRINT-NUMBER                PIC X(15).
            05 FILLER                      PIC X(1) VALUE SPACE.
            05 PRINT-EXTENSION             PIC X(5).

       01   END-OF-FILE                    PIC X.
            88 IS-END-OF-FILE              VALUE "Y".

       01   PRINT-LINES                    PIC 99.
       01   PAGE-NUMBER                    PIC 9(5).
       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.

            PERFORM OPENING-PROCEDURE.
            MOVE ZEROS TO PRINT-LINES
                          PAGE-NUMBER.
            PERFORM START-NEW-PAGE.
            MOVE "N" TO END-OF-FILE.
            PERFORM READ-NEXT-RECORD.
            IF IS-END-OF-FILE
                MOVE "No records found" TO PRINTER-RECORD
                WRITE PRINTER-RECORD BEFORE ADVANCING 1.
            PERFORM PRINT-RECORDS
               UNTIL IS-END-OF-FILE.
            PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

       OPENING-PROCEDURE.
            OPEN INPUT PHONE-FILE.
            OPEN OUTPUT PRINTER-FILE.

       CLOSING-PROCEDURE.
            CLOSE PHONE-FILE.
            PERFORM END-LAST-PAGE.
            CLOSE PRINTER-FILE.

       PRINT-RECORDS.
            PERFORM PRINT-FIELDS.
            PERFORM READ-NEXT-RECORD.

       PRINT-FIELDS.
            IF PRINT-LINES NOT < 55
                PERFORM NEXT-PAGE.
            MOVE PHONE-LAST-NAME TO PRINT-LAST-NAME.
            MOVE PHONE-FIRST-NAME TO PRINT-FIRST-NAME.
            MOVE PHONE-NUMBER TO PRINT-NUMBER.
            MOVE PHONE-EXTENSION TO PRINT-EXTENSION.
            MOVE DETAIL-LINE TO PRINTER-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING 1.

            ADD 1 TO PRINT-LINES.

       READ-NEXT-RECORD.
            READ PHONE-FILE NEXT RECORD
               AT END
               MOVE "Y" TO END-OF-FILE.

       NEXT-PAGE.
            PERFORM END-LAST-PAGE.
            PERFORM START-NEW-PAGE.

       START-NEW-PAGE.
            ADD 1 TO PAGE-NUMBER.
            MOVE PAGE-NUMBER TO PRINT-PAGE-NUMBER.
            MOVE TITLE-LINE TO PRINTER-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING 2.
            MOVE COLUMN-HEADINGS TO PRINTER-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING 2.
            MOVE 4 TO PRINT-LINES.

       END-LAST-PAGE.
            MOVE SPACE TO PRINTER-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
            MOVE ZEROS TO PRINT-LINES.
