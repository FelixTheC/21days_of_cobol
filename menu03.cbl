      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menu03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01   MENU-PICK          PIC 9.
            88 PICK-IS-EXIT    VALUE 9.
            88 PICK-IS-VALID  VALUES 1 THRU 3, 9.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            MOVE 1 TO MENU-PICK.
            PERFORM GET-AND-DO-PICK
               UNTIL PICK-IS-EXIT.

            DISPLAY "Thank you. Exiting".

       PROGRAM-DONE.
            STOP RUN.

       GET-AND-DO-PICK.
            PERFORM GET-THE-MENU-PICK.
            PERFORM DO-THE-MENU-PICK.

       GET-THE-MENU-PICK.
            PERFORM DISPLAY-THE-MENU.
            PERFORM GET-THE-PICK.

       DO-THE-MENU-PICK.
            IF NOT PICK-IS-VALID
                DISPLAY "Invalid selection".
            IF MENU-PICK = 1
                DISPLAY "One for the money.".
            IF MENU-PICK = 2
                DISPLAY "Two for the show.".
            IF MENU-PICK = 3
                DISPLAY "Three to get ready.".

       DISPLAY-THE-MENU.
            DISPLAY "Please enter the number of the message".
            DISPLAY "that you wish to display.".
      * Display a blank line
            DISPLAY " ".
            DISPLAY "1. First Message".
            DISPLAY "2. Second Message".
            DISPLAY "3. Third Message".
      *Display a blank line
            DISPLAY " ".
            DISPLAY "9. EXIT".
            DISPLAY " ".
            DISPLAY "Your selection (1-3)?".

       GET-THE-PICK.
            ACCEPT MENU-PICK.
