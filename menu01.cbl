      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. menu01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01   MENU-PICK       PIC 9.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

            PERFORM GET-THE-MENU-PICK.

            PERFORM DO-THE-MENU-PICK.

       PROGRAM-DONE.
            STOP RUN.

       GET-THE-MENU-PICK.

            PERFORM DISPLAY-THE-MENU.
            PERFORM GET-THE-PICK.

       DO-THE-MENU-PICK.
            IF MENU-PICK < 1 OR
                MENU-PICK > 3
                    DISPLAY "Invalid selection".

            IF MENU-PICK = 1
                DISPLAY "One for the money".

            IF MENU-PICK = 2
                DISPLAY "Two for the show".

            if MENU-PICK = 3
                DISPLAY "Three to get ready".

       DISPLAY-THE-MENU.
            DISPLAY "Please enter the number of the message".
            DISPLAY "that you whish to display.".
            DISPLAY " ".
            DISPLAY "1.    First  Message".
            DISPLAY "2.    Second Message".
            DISPLAY "3.    Third  Message".
            DISPLAY " ".
            DISPLAY "Your selction (1-3)?".

       GET-THE-PICK.
            ACCEPT MENU-PICK.
