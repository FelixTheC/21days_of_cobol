      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vndnew01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            SELECT OPTIONAL VENDOR-FILE
               ASSIGN TO "vendor"
               ORGANIZATION IS INDEXED
               RECORD KEY IS VENDOR-NUMBER
               ACCESS MODE IS DYNAMIC.

       DATA DIVISION.
       FILE SECTION.

       FD   VENDOR-FILE
            LABEL RECORDS ARE STANDARD.
       01   VENDOR-RECORD.
            05 VENDOR-NUMBER               PIC 9(5).
            05 VENDOR-NAME                 PIC X(30).
            05 VENDOR-ADDRESS-1            PIC X(30).
            05 VENDOR-ADDRESS-2            PIC X(30).
            05 VENDOR-CITY                 PIC X(30).
            05 VENDOR-STATE                PIC X(30).
            05 VENDOR-ZIP                  PIC X(30).
            05 VENDOR-CONTACT              PIC X(30).
            05 VENDOR-PHONE                PIC X(30).

       01   DUPLICATE-FLAG                 PIC X.
            88 VENDOR-ALLREADY-EXISTS      VALUE "Y".

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
            OPEN I-O VENDOR-FILE.
            PERFORM MAIN-PROCESS.
            CLOSE VENDOR-FILE.
            PERFORM DISPLAY-ERROR.

       PROGRAM-DONE.
            STOP RUN.

       MAIN-PROCESS.
            PERFORM INIT-VENDOR-RECORD.
            PERFORM ENTER-VENDOR-FIELDS.
            WRITE VENDOR-RECORD
               INVALID KEY
               MOVE "Y" TO DUPLICATE-FLAG.


       INIT-VENDOR-RECORD.
            MOVE SPACE TO VENDOR-RECORD.
            MOVE ZEROS TO VENDOR-NUMBER.

       ENTER-VENDOR-FIELDS.
            PERFORM ENTER-VENDOR-NUMBER.
            PERFORM ENTER-VENDOR-NAME.
            PERFORM ENTER-VENDOR-ADDRESS-1.
            PERFORM ENTER-VENDOR-ADDRESS-2.
            PERFORM ENTER-VENDOR-CITY.
            PERFORM ENTER-VENDOR-STATE.
            PERFORM ENTER-VENDOR-ZIP.
            PERFORM ENTER-VENDOR-CONTACT.
            PERFORM ENTER-VENDOR-PHONE.

       ENTER-VENDOR-NUMBER.
            DISPLAY "ENTER VENDOR NUMBER (00001-99999)".
            ACCEPT VENDOR-NUMBER.

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

       DISPLAY-ERROR.
            IF VENDOR-ALLREADY-EXISTS
                DISPLAY "ERROR: VENDOR ALLREADY EXISTS".
