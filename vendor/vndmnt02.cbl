      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VNDMNT02.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            COPY "slvnd01.cbl".
            COPY "slstate.cbl".

       DATA DIVISION.
       FILE SECTION.

            COPY "fdvnd02.cbl".
            COPY "fdstate.cbl".

       WORKING-STORAGE SECTION.
       77   MENU-PICK                          PIC 9.
            88 MENU-PICK-IS-VALID              VALUES 0 THRU 4.

       77   THE-MODE                           PIC X(7).
       77   WHICH-FIELD                        PIC 9.
       77   OK-TO-DELETE                       PIC X.
       77   RECORD-FOUND                       PIC X.
       77   VENDOR-NUMBER-FIELD                PIC Z(5).

       77   ERROR-MESSAGE                      PIC X(79) VALUE SPACE.
       77   UPPER-ALPHA                        PIC X(26)
               VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
       77   LOWER-ALPHA                        PIC X(26)
               VALUE "abcdefghijklmnopqrstuvwxyz".

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

              FIND-VENDOR-RECORD.
            PERFORM READ-VENDOR-RECORD.
            IF RECORD-FOUND = "N"
                DISPLAY "RECORD NOT FOUND".
                PERFORM ENTER-VENDOR-NUMBER.

       ENTER-VENDOR-NAME.
            PERFORM ACCEPT-VENDOR-NAME.
            PERFORM RE-ACCEPT-VENDOR-NAME
               UNTIL VENDOR-NAME NOT = SPACE.

       ACCEPT-VENDOR-NAME.
            DISPLAY "ENTER VENDOR NAME".
            ACCEPT VENDOR-NAME.
            INSPECT VENDOR-NAME
               CONVERTING LOWER-ALPHA
               TO UPPER-ALPHA.

       ENTER-VENDOR-ADDRESS-1.
            PERFORM ACCEPT-VENDOR-ADDRESS-1.
            PERFORM RE-ACCEPT-VENDOR-ADDRESS-1
               UNTIL VENDOR-ADDRESS-1 NOT = SPACE.

       RE-ACCEPT-VENDOR-ADDRESS-1.
            DISPLAY "VENDOR NAME MUST BE ENTERED".
            PERFORM ACCEPT-VENDOR-NAME.

       ACCEPT-VENDOR-ADDRESS-1.
            DISPLAY "ENTER VENDOR ADDRESS-1".
            ACCEPT VENDOR-ADDRESS-1.
            INSPECT VENDOR-ADDRESS-1
               CONVERTING LOWER-ALPHA
               TO UPPER-ALPHA.

       RE-ACCEPT-VENDOR-ADDRESS-1.
            DISPLAY "VENDOR ADDRESS-1 MUST BE ENTERED".
            PERFORM ACCEPT-VENDOR-ADDRESS-1.

       ENTER-VENDOR-ADDRESS-2.
            DISPLAY "ENTER VENDOR ADDRESS-2".
            ACCEPT VENDOR-ADDRESS-2.
            INSPECT VENDOR-ADDRESS-2
               CONVERTING LOWER-ALPHA
               TO UPPER-ALPHA.

       ENTER-VENDOR-CITY.
            PERFORM ACCEPT-VENDOR-CITY.
            PERFORM RE-ACCEPT-VENDOR-CITY
               UNTIL VENDOR-CITY NOT = SPACE.

       ACCEPT-VENDOR-CITY.
            DISPLAY "ENTER VENDOR CITY".
            ACCEPT VENDOR-CITY.
            INSPECT VENDOR-CITY
               CONVERTING LOWER-ALPHA
               TO UPPER-ALPHA.

       RE-ACCEPT-VENDOR-CITY.
            DISPLAY "VENDOR CITY MUST BE ENTERED".
            PERFORM ACCEPT-VENDOR-CITY.

       ENTER-VENDOR-STATE.
            PERFORM ACCEPT-VENDOR-STATE.
            PERFORM RE-ACCEPT-VENDOR-STATE
               UNTIL VENDOR-STATE NOT = SPACE.

       ACCEPT-VENDOR-STATE.
            DISPLAY "ENTER VENDOR STATE".
            ACCEPT VENDOR-STATE.
            PERFORM EDIT-CHECK-VENDOR-STATE.

       RE-ACCEPT-VENDOR-STATE.
            DISPLAY ERROR-MESSAGE.
            PERFORM ACCEPT-VENDOR-STATE.

       EDIT-CHECK-VENDOR-STATE.
            PERFORM EDIT-VENDOR-STATE.
            PERFORM CHECK-VENDOR-STATE.

       EDIT-VENDOR-STATE.
            INSPECT VENDOR-STATE
               CONVERTING LOWER-ALPHA
               TO UPPER-ALPHA.

       CHECK-VENDOR-STATE.
            PERFORM VENDOR-STATE-REQUIRED.
            IF VENDOR-STATE NOT = SPACES
                PERFORM VENDOR-STATE-ON-FILE.

       VENDOR-STATE-REQUIRED.
            IF VENDOR-STATE = SPACE
                MOVE "VENDOR STATE MUST BE ENTERED"
                   TO ERROR-MESSAGE.

       VENDOR-STATE-ON-FILE.
            MOVE VENDOR-STATE TO STATE-CODE.
            PERFORM READ-STATE-RECORD.
            IF STATE-RECORD-FOUND = "N"
                MOVE "STATE CODE NOT FOUND IN CODES FILE"
                   TO ERROR-MESSAGE.

       ENTER-VENDOR-ZIP.
            PERFORM ACCEPT-VENDOR-ZIP.
            PERFORM RE-ACCEPT-VENDOR-ZIP
               UNTIL VENDOR-ZIP NOT = SPACE.

       ACCEPT-VENDOR-ZIP.
            DISPLAY "ENTER VENDOR ZIP".
            ACCEPT VENDOR-ZIP.
            INSPECT VENDOR-ZIP
               CONVERTING LOWER-ALPHA
                   TO UPPER-ALPHA.

       RE-ACCEPT-VENDOR-ZIP.
            DISPLAY "VENDOR ZIP MUST BE ENTERED".
            PERFORM ACCEPT-VENDOR-ZIP.

       ENTER-VENDOR-CONTACT.
            DISPLAY "ENTER VENDOR CONTACT".
            ACCEPT VENDOR-CONTACT.
            INSPECT VENDOR-CONTACT
               CONVERTING LOWER-ALPHA
                   TO UPPER-ALPHA.

       ENTER-VENDOR-PHONE.
            PERFORM ACCEPT-VENDOR-PHONE.
            PERFORM RE-ACCEPT-VENDOR-PHONE
               UNTIL VENDOR-PHONE NOT = SPACE.

       ACCEPT-VENDOR-PHONE.
            DISPLAY "ENTER VENDOR PHONE".
            ACCEPT VENDOR-PHONE.
            INSPECT VENDOR-PHONE
               CONVERTING LOWER-ALPHA
                   TO UPPER-ALPHA.

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
