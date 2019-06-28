      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VNDMNT01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            COPY "slvnd01.cbl".

       DATA DIVISION.
       FILE SECTION.

            COPY "fdvnd02.cbl".

       WORKING-STORAGE SECTION.
       77   MENU-PICK                          PIC 9.
            88 MENU-PICK-IS-VALID              VALUES 0 THRU 4.

       77   THE-MODE                           PIC X(7).
       77   WHICH-FIELD                        PIC 9.
       77   OK-TO-DELETE                       PIC X.
       77   RECORD-FOUND                       PIC X.
       77   VENDOR-NUMBER-FIELD                PIC Z(5).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM OPENING-PROCEDURE.
            PERFORM MAIN-PROCESS.
            PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

       OPENING-PROCEDURE.
            OPEN I-O VENDOR-FILE.

       CLOSING-PROCEDURE.
            CLOSE VENDOR-FILE.

       MAIN-PROCESS.
            PERFORM GET-MENU-PICK.
            PERFORM MAINTAIN-THE-FILE
               UNTIL MENU-PICK = 0.

      *--------------------------------
      * MENU
      *--------------------------------
       GET-MENU-PICK.
            PERFORM DISPLAY-THE-MENU.
            PERFORM GET-THE-PICK.
            PERFORM MENU-RETRY
               UNTIL MENU-PICK-IS-VALID.

       DISPLAY-THE-MENU.
            PERFORM CLEAR-SCREEN.
            DISPLAY "PLEASE SELECT:".
            DISPLAY " ".
            DISPLAY "1. ADD RECORDS".
            DISPLAY "2. CHANGE A RECORD".
            DISPLAY "3. LOOK UP A RECORD".
            DISPLAY "4. DELETE A RECORD".
            DISPLAY " ".
            DISPLAY "0. EXIT".
            PERFORM SCROLL-LINE 8 TIMES.

       CLEAR-SCREEN.
               PERFORM SCROLL-LINE 25 TIMES.

       SCROLL-LINE.
            DISPLAY " ".

       GET-THE-PICK.
            DISPLAY "YOUR CHOICE (0-4)?".
            ACCEPT MENU-PICK.

       MENU-RETRY.
            DISPLAY "INVALID SELECTION - PLEASE RE-TRY".
            PERFORM GET-THE-PICK.

       MAINTAIN-THE-FILE.
            PERFORM DO-THE-PICK.
            PERFORM GET-MENU-PICK.

       DO-THE-PICK.
            PERFORM ADD-MODE-SELECTED.
            PERFORM CHANGE-MODE-SELECTED.
            PERFORM INQUIRE-MODE-SELECTED.
            PERFORM DELETE-MODE-SELECTED.

       ADD-MODE-SELECTED.
            IF MENU-PICK = 1
                PERFORM ADD-MODE.

       CHANGE-MODE-SELECTED.
            IF MENU-PICK = 2
                PERFORM CHANGE-MODE.

       INQUIRE-MODE-SELECTED.
            IF MENU-PICK = 3
               PERFORM INQUIRE-MODE.

       DELETE-MODE-SELECTED.
            IF MENU-PICK = 4
               PERFORM DELETE-MODE.
      *--------------------------------
      * ADD
      *--------------------------------

            COPY "vndmdadd01.cbl".

      *--------------------------------
      * CHANGE
      *--------------------------------

            COPY "vndmdchng01.cbl".

      *--------------------------------
      * INQUIRE
      *--------------------------------
       INQUIRE-MODE.
            MOVE "INQUIRE" TO THE-MODE.
            PERFORM GET-VENDOR-RECORD.
            PERFORM INQUIRE-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES.

       INQUIRE-RECORDS.
            PERFORM DISPLAY-ALL-FIELDS.
            PERFORM GET-VENDOR-RECORD.

      *--------------------------------
      * DELETE
      *--------------------------------

            COPY "vndmddel01.cbl".

      *--------------------------------
      * ROUTINES FOR ALL
      *--------------------------------
       INIT-VENDOR-RECORD.
            MOVE SPACE TO VENDOR-RECORD.
            MOVE ZEROES TO VENDOR-NUMBER.

       ENTER-VENDOR-NUMBER.
            DISPLAY " ".
            DISPLAY "ENTER VENDOR NUMBER OF THE VENDOR" .
            DISPLAY "TO " THE-MODE " (1-99999)".
            DISPLAY "ENTER 0 TO STOP ENTRY".
            ACCEPT VENDOR-NUMBER-FIELD.

            MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER.

       GET-VENDOR-RECORD.
            PERFORM INIT-VENDOR-RECORD.
            PERFORM ENTER-VENDOR-NUMBER.
            MOVE "N" TO RECORD-FOUND.
            PERFORM FIND-VENDOR-RECORD
               UNTIL RECORD-FOUND = "Y" OR
                     VENDOR-NUMBER = ZEROES.

      *--------------------------------
      * ROUTINES FOR ADD AND CHANGE
      *--------------------------------

            COPY "vndrmfld01.cbl".

      *--------------------------------
      * ROUTINES FOR CHANGE,
      *    INQUIRE AND DELTE
      *--------------------------------

            COPY "vnddspallfld01.cbl".

      *--------------------------------
      * FILE I-O ROUTINES
      *--------------------------------
       READ-VENDOR-RECORD.
            MOVE "Y" TO RECORD-FOUND.
            READ VENDOR-FILE RECORD
               INVALID KEY
               MOVE "N" TO RECORD-FOUND.

       WRITE-VENDOR-RECORD.
            WRITE VENDOR-RECORD
               INVALID KEY
               DISPLAY "RECORD ALLREADY EXISTS".

       REWRITE-VENDOR-RECORD.
            REWRITE VENDOR-RECORD
               INVALID KEY
               DISPLAY "ERROR REWRIING VENDOR RECORD".

       DELETE-VENDOR-RECORD.
            DELETE VENDOR-FILE RECORD
               INVALID KEY
               DISPLAY "ERROR DELETING VENDOR RECORD".
