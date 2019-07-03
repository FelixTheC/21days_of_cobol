      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vndmnt04.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            COPY "slvnd02.cbl".
            COPY "slstate.cbl".

       DATA DIVISION.
       FILE SECTION.

            COPY "fdvnd04.cbl".
            COPY "fdstate.cbl".

       WORKING-STORAGE SECTION.

       77   MENU-PICK                            PIC 9.
               88 MENU-PICK-IS-VALID             VALUES 0 THRU 7.

       77   THE-MODE                             PIC X(7).
       77   WHICH-FIELD                          PIC 9.
       77   OK-TO-DELETE                         PIC X.
       77   VENDOR-RECORD-FOUND                  PIC X.
       77   STATE-RECORD-FOUND                   PIC X.

       77   VENDOR-NUMBER-FIELD                  PIC Z(5).

       77   ERROR-MESSAGE                        PIC X(79) VALUE SPACE.

       77   LOWER-ALPHA                          PIC X(26)
               VALUE "abcdefghijklmnopqrstuvwxyz".
       77   UPPER-ALPHA                          PIC X(26)
               VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".

            COPY "wssvnd01.cbl".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            PERFORM OPENING-PROCEDURE.
            PERFORM MAIN-PROCESS.
            PERFORM CLOSING-PROCEDURE.

       PROGRAM-EXIT.
            EXIT PROGRAM.

       PROGRAM-DONE.
            STOP RUN.

       OPENING-PROCEDURE.
            OPEN I-O VENDOR-FILE.
            OPEN I-O STATE-FILE.

       CLOSING-PROCEDURE.
            CLOSE VENDOR-FILE.
            CLOSE STATE-FILE.

       MAIN-PROCESS.
            PERFORM GET-MENU-PICK.
            PERFORM MAINTAIN-THE-FILE
               UNTIL MENU-PICK = 0.

      *--------------------------------
      * MENU
      *--------------------------------
       GET-MENU-PICK.
            PERFORM DISPLAY-THE-MENU.
            PERFORM ACCEPT-MENU-PICK..
            PERFORM RE-ACCEPT-MENU-PICK
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

       ACCEPT-MENU-PICK.
            DISPLAY "YOUR CHOICE (0-7)?".
            ACCEPT MENU-PICK.

       RE-ACCEPT-MENU-PICK.
            DISPLAY "INVALID SELECTION - PLEASE RE-TRY.".
            PERFORM ACCEPT-MENU-PICK.

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

            COPY "vndmdadd02.cbl".

      *--------------------------------
      * CHANGE
      *--------------------------------

            COPY "vndmdchng02.cbl".

      *--------------------------------
      * INQUIRE
      *--------------------------------
       INQUIRE-MODE.
            MOVE "DISPLAY" TO THE-MODE.
            PERFORM GET-EXISTING-RECORD.
            PERFORM INQUIRE-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES.

       INQUIRE-RECORDS.
            PERFORM DISPLAY-ALL-FIELDS.
            PERFORM GET-EXISTING-RECORD.

      *--------------------------------
      * DELETE
      *--------------------------------

            COPY "vndmddel02.cbl".

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

      *--------------------------------
      * INQUIRE BY NAME
      *--------------------------------
       INQUIRE-BY-NAME.
            PERFORM CLOSING-PROCEDURE.
            CALL "vninnm03".
            PERFORM OPENING-PROCEDURE.

      *--------------------------------
      * PRINT BY NAME
      *--------------------------------
       PRINT-BY-NAME.
            PERFORM CLOSING-PROCEDURE.
            DISPLAY " REPORT BY NAME IN PROGRESS".
            CALL "vnbynm02".
            PERFORM OPENING-PROCEDURE.

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
            MOVE "Y" TO VENDOR-RECORD-FOUND.
            READ VENDOR-FILE RECORD
               INVALID KEY
               MOVE "N" TO VENDOR-RECORD-FOUND.

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

       READ-STATE-RECORD.
            MOVE "Y" TO STATE-RECORD-FOUND.
            READ STATE-FILE RECORD
               INVALID KEY
               MOVE "N" TO STATE-RECORD-FOUND.

       GET-EXISTING-RECORD.
            PERFORM ACCEPT-EXISTING-KEY.
            PERFORM RE-ACCEPT-EXISTING-KEY
               UNTIL VENDOR-RECORD-FOUND = "Y" OR
               VENDOR-NUMBER = ZEROES.

       ACCEPT-EXISTING-KEY.
            PERFORM INIT-VENDOR-RECORD.
            PERFORM ENTER-VENDOR-NUMBER.
            IF VENDOR-NUMBER NOT = ZEROES
                PERFORM READ-VENDOR-RECORD.

       RE-ACCEPT-EXISTING-KEY.
            DISPLAY "RECORD NOT FOUND".
            PERFORM ACCEPT-EXISTING-KEY.
