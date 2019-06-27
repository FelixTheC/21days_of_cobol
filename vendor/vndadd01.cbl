      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vndadd01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            COPY "slvnd01.cbl".

       DATA DIVISION.
       FILE SECTION.

            COPY "fdvnd02.cbl".

       WORKING-STORAGE SECTION.
       77   RECORD-FOUND               PIC X.
       77   VENDOR-NUMBER-FIELD        PIC Z(5).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            OPEN I-O VENDOR-FILE
            PERFORM GET-NEW-VENDOR-NUMBER.
            PERFORM ADD-RECORDS
               UNTIL VENDOR-NUMBER = ZEROS.
            CLOSE VENDOR-FILE.

       PROGRAM-DONE.
            STOP RUN.

       GET-NEW-VENDOR-NUMBER.
            PERFORM INIT-VENDOR-RECORD.
            PERFORM ENTER-VENDOR-NUMBER.
            MOVE "Y" TO RECORD-FOUND.
            PERFORM FIND-NEW-VENDOR-RECORD
               UNTIL RECORD-FOUND = "N" OR
               VENDOR-NUMBER = ZEROS.

       INIT-VENDOR-RECORD.
            MOVE SPACE TO VENDOR-RECORD.
            MOVE ZEROS TO VENDOR-NUMBER.

       ENTER-VENDOR-NUMBER.
            DISPLAY " ".
            DISPLAY "ENTER VENDOR NUMBER OF THE VENDOR" .
            DISPLAY "TO DELETE (1-99999)".
            DISPLAY "ENTER 0 TO STOP ENTRY".
            ACCEPT VENDOR-NUMBER-FIELD.
            MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER.

       FIND-NEW-VENDOR-RECORD.
            PERFORM READ-VENDOR-RECORD.
            IF RECORD-FOUND = "Y"
                DISPLAY "RECORD ALLREADY ON FILE"
                PERFORM ENTER-VENDOR-NUMBER.

       READ-VENDOR-RECORD.
            MOVE "Y" TO RECORD-FOUND.
            READ VENDOR-FILE RECORD
               INVALID KEY
               MOVE "N" TO RECORD-FOUND.

       ADD-RECORDS.
            PERFORM ENTER-REMAINING-FIELDS.
            PERFORM WRITE-VENDOR-RECORD.
            PERFORM GET-NEW-VENDOR-NUMBER.

       WRITE-VENDOR-RECORD.
            WRITE VENDOR-RECORD
               INVALID KEY
               DISPLAY "RECORD ALLREADY ON FILE".

       ENTER-REMAINING-FIELDS.
            PERFORM ENTER-VENDOR-NAME.
            PERFORM ENTER-VENDOR-ADDRESS-1.
            PERFORM ENTER-VENDOR-ADDRESS-2.
            PERFORM ENTER-VENDOR-CITY.
            PERFORM ENTER-VENDOR-STATE.
            PERFORM ENTER-VENDOR-ZIP.
            PERFORM ENTER-VENDOR-CONTACT.
            PERFORM ENTER-VENDOR-PHONE.

       ENTER-VENDOR-NAME.
            DISPLAY "ENTER VENDOR NAME".
            ACCEPT VENDOR-NAME.

       ENTER-VENDOR-ADDRESS-1.
            DISPLAY "ENTER VENDOR ADDRESS-1".
            ACCEPT VENDOR-ADDRESS-1.

       ENTER-VENDOR-ADDRESS-2.
            DISPLAY "ENTER VENDOR ADDRESS-2".
            ACCEPT VENDOR-ADDRESS-2.

       ENTER-VENDOR-CITY.
            DISPLAY "ENTER VENDOR CITY".
            ACCEPT VENDOR-CITY.

       ENTER-VENDOR-STATE.
            DISPLAY "ENTER VENDOR STATE".
            ACCEPT VENDOR-STATE.

       ENTER-VENDOR-ZIP.
            DISPLAY "ENTER VENDOR ZIP".
            ACCEPT VENDOR-ZIP.

       ENTER-VENDOR-CONTACT.
            DISPLAY "ENTER VENDOR CONTACT".
            ACCEPT VENDOR-CONTACT.

       ENTER-VENDOR-PHONE.
            DISPLAY "ENTER VENDOR PHONE".
            ACCEPT VENDOR-PHONE.
