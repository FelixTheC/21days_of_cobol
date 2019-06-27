      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vndrpt01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            COPY "slvnd01.cbl".

            SELECT OPTIONAL PRINTER-FILE
               ASSIGN TO "PRINTER"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
            COPY "fdvnd02.cbl".

       FD   PRINTER-FILE
            LABEL RECORDS ARE STANDARD.
       01   PRINTER-RECORD                PIC X(80).

       WORKING-STORAGE SECTION.

       01   DETAIL-LINE.
            05 PRINT-NUMBER               PIC X(30).
            05 FILLER                     PIC X     VALUE SPACE.
            05 PRINT-NAME                 PIC X(30).
            05 FILLER                     PIC X     VALUE SPACE.
            05 PRINT-CONTACT              PIC X(30).

       01   CITY-STATE-DETAIL.
            05 PRINT-CITY                 PIC X(20).
            05 FILLER                     PIC X     VALUE SPACE.
            05 PRINT-STATE                PIC X(2).

       01   COLUMN-LINE.
            05 FILLER                     PIC X(2)  VALUE "NO".
            05 FILLER                     PIC X(4)  VALUE SPACE.
            05 FILLER                     PIC X(12)
                                              VALUE "NAME-ADDRESS".
            05 FILLER                     PIC X(19) VALUE SPACE.
            05 FILLER                     PIC X(17)
                                              VALUE "CONTACT-PHONE-ZIP".

       01   TITLE-LINE.
            05 FILLER                     PIC X(15) VALUE SPACE.
            05 FILLER                     PIC X(11)
                                              VALUE "VENDOR LIST".
            05 FILLER                     PIC X(15) VALUE SPACE.
            05 FILLER                     PIC X(5) VALUE "PAGE:".
            05 FILLER                     PIC X(1) VALUE SPACE.
            05 PRINT-PAGE-NUMBER          PIC ZZZZ9.

       77   FILE-AT-END                   PIC X.
       77   LINE-COUNT                    PIC 999 VALUE ZERO.
       77   PAGE-NUMBER                   PIC 99999 VALUE ZERO.
       77   MAXIMUM-LINES                 PIC 999 VALUE 15.

       77   DISPLAY-RECORD                PIC X(79).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            PERFORM OPENING-PROCEDURE.
            MOVE ZEROS TO LINE-COUNT
                          PAGE-NUMBER.

            PERFORM START-NEW-PAGE.

            MOVE "N" TO FILE-AT-END.
            PERFORM READ-NEXT-RECORD.
            IF FILE-AT-END = "Y"
                MOVE "NO RECORDS-FOUND" TO DISPLAY-RECORD
                PERFORM WRITE-TO-PRINTER
            ELSE
                PERFORM PRINT-VENDOR-FIELDS
                   UNTIL FILE-AT-END = "Y".

            PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

       OPENING-PROCEDURE.
            OPEN I-O VENDOR-FILE.
            OPEN OUTPUT PRINTER-FILE.

       CLOSING-PROCEDURE.
            CLOSE VENDOR-FILE.
            PERFORM END-LAST-PAGE.
            CLOSE PRINTER-FILE.

       PRINT-VENDOR-FIELDS.
           IF LINE-COUNT > MAXIMUM-LINES
               PERFORM START-NEXT-PAGE.
            PERFORM PRINT-THE-RECORD..
            PERFORM READ-NEXT-RECORD.

       PRINT-THE-RECORD..
            PERFORM PRINT-LINE-1.
            PERFORM PRINT-LINE-2.
            PERFORM PRINT-LINE-3.
            PERFORM PRINT-LINE-4.
            PERFORM LINE-FEED.

       PRINT-LINE-1.
            MOVE SPACE TO DETAIL-LINE.
            MOVE VENDOR-NUMBER TO PRINT-NUMBER.
            MOVE VENDOR-NAME TO PRINT-NAME.
            MOVE VENDOR-CONTACT TO PRINT-CONTACT.
            MOVE DETAIL-LINE TO PRINTER-RECORD.
            PERFORM WRITE-TO-PRINTER.

       PRINT-LINE-2.
            MOVE SPACE TO DETAIL-LINE.
            MOVE VENDOR-ADDRESS-1 TO PRINT-NAME.
            MOVE VENDOR-PHONE TO PRINT-CONTACT.
            MOVE DETAIL-LINE TO PRINTER-RECORD.
            PERFORM WRITE-TO-PRINTER.

       PRINT-LINE-3.
            MOVE SPACE TO DETAIL-LINE.
            MOVE VENDOR-ADDRESS-2 TO PRINT-NAME.
            IF VENDOR-ADDRESS-2 NOT = SPACE
               MOVE DETAIL-LINE TO PRINTER-RECORD
            PERFORM WRITE-TO-PRINTER.

       PRINT-LINE-4.
            MOVE SPACE TO DETAIL-LINE.
            MOVE VENDOR-CITY TO PRINT-CITY.
            MOVE VENDOR-STATE TO PRINT-STATE.
            MOVE CITY-STATE-DETAIL TO PRINT-NAME.
            MOVE VENDOR-ZIP TO PRINT-CONTACT.
            MOVE DETAIL-LINE TO PRINTER-RECORD.
            PERFORM WRITE-TO-PRINTER.

       READ-NEXT-RECORD.
            READ VENDOR-FILE NEXT RECORD
               AT END MOVE "Y" TO FILE-AT-END.

       WRITE-TO-PRINTER.
            WRITE PRINTER-RECORD BEFORE ADVANCING 1.
            ADD 1 TO LINE-COUNT.

       LINE-FEED.
            MOVE SPACE TO PRINTER-RECORD.
            PERFORM WRITE-TO-PRINTER.

       START-NEXT-PAGE.
            PERFORM END-LAST-PAGE.
            PERFORM START-NEW-PAGE.

       START-NEW-PAGE.
            ADD 1 TO PAGE-NUMBER.
            MOVE PAGE-NUMBER TO PRINT-PAGE-NUMBER.
            MOVE TITLE-LINE TO PRINTER-RECORD.
            PERFORM WRITE-TO-PRINTER.
            PERFORM LINE-FEED.
            MOVE COLUMN-LINE TO PRINTER-RECORD.
            PERFORM WRITE-TO-PRINTER.
            PERFORM LINE-FEED.

       END-LAST-PAGE.
            PERFORM FORM-FEED.
            MOVE ZERO TO LINE-COUNT.

       FORM-FEED.
            MOVE SPACE TO PRINTER-RECORD.
            WRITE PRINTER-RECORD BEFORE ADVANCING 1.
