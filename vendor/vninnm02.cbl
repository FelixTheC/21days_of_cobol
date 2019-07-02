      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. vninnm02.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

            copy "slvnd02.cbl".
            copy "slstate.cbl".

       DATA DIVISION.
       FILE SECTION.

            copy "fdvnd04.cbl".
            copy "fdstate.cbl".

       WORKING-STORAGE SECTION.
       77   vendor-file-at-end                     pic x.
       77   state-record-found                     pic x.
       77   see-next-record                        pic x.
       77   vendor-name-field                      pic x(30).

       77   lower-alpha                            pic x(26)
               value "abcdefghijklmnopqrstuvwxyz".
       77   upper-alpha                            pic x(26)
               value "ABCDEFGHIJKLMNOPQRSTUVWXYZ".

            copy "wssvnd01.cbl".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            perform opening-procedure.
            perform main-process.
            perform closing-procedure.

       PROGRAM-DONE.
            STOP RUN.

       opening-procedure.
            open i-o vendor-file.
            open i-o state-file.

       closing-procedure.
            close vendor-file.
            close state-file.

       main-process.
            perform inquire-by-name.

       inquire-by-name.
            perform get-existing-record.
            perform inquire-records
               until vendor-name = spaces.

       inquire-records.
            perform show-this-record.
            perform show-next-record
               until see-next-record = "N" or
                   vendor-file-at-end = "Y".

            perform get-existing-record.

       show-this-record.
            perform display-all-records.
            perform get-see-next-record.

       show-next-record.
            perform read-next-vendor-record.
            if vendor-file-at-end not = "Y"
                perform show-this-record.

       get-existing-record.
            perform accept-existing-key.
            perform re-accept-existing-key
               until vendor-file-at-end not = "Y".

       accept-existing-key.
            perform init-for-key-entry.
            perform enter-vendor-name.
            if vendor-name not = spaces
                perform read-first-vendor-record.

       re-accept-existing-key.
            display "RECORD NOT FOUND".
            perform accept-existing-key.

       enter-vendor-name.
            perform accept-vendor-name.

       accept-vendor-name.
            display "ENTER VENDOR NAME".
            accept vendor-name.
            inspect vendor-name
               converting lower-alpha
               to upper-alpha.

       get-see-next-record.
            perform accept-see-next-record.
            perform re-accept-see-next-record
               until see-next-record = "Y" or "N".

       accept-see-next-record.
            display "DISPLAY NEXT RECORD (Y/N)?".
            accept see-next-record.

            if see-next-record = space
                move "Y" to see-next-record.

            inspect see-next-record
               converting lower-alpha
               to upper-alpha.

       re-accept-see-next-record.
            display "MUST ENTER YES OR NO".
            perform accept-see-next-record.

       display-all-records.
            DISPLAY " ".
            PERFORM DISPLAY-VENDOR-NUMBER.
            PERFORM DISPLAY-VENDOR-NAME.
            PERFORM DISPLAY-VENDOR-ADDRESS-1.
            PERFORM DISPLAY-VENDOR-ADDRESS-2.
            PERFORM DISPLAY-VENDOR-CITY.
            PERFORM DISPLAY-VENDOR-STATE.
            PERFORM DISPLAY-VENDOR-ZIP.
            PERFORM DISPLAY-VENDOR-CONTACT.
            PERFORM DISPLAY-VENDOR-PHONE.
            DISPLAY " ".

       DISPLAY-VENDOR-NUMBER.
            DISPLAY "VENDOR NUMBER: " VENDOR-NUMBER.

       DISPLAY-VENDOR-NAME.
            DISPLAY "1. VENDOR NAME: " VENDOR-NAME.

       DISPLAY-VENDOR-ADDRESS-1.
            DISPLAY "2. VENDOR ADDRESS-1: " VENDOR-ADDRESS-1.

       DISPLAY-VENDOR-ADDRESS-2.
            DISPLAY "3. VENDOR ADDRESS-2: " VENDOR-ADDRESS-2.

       DISPLAY-VENDOR-CITY.
            DISPLAY "4. VENDOR CITY: " VENDOR-CITY.

       DISPLAY-VENDOR-STATE.
            DISPLAY "5. VENDOR STATE: " VENDOR-STATE.

       DISPLAY-VENDOR-ZIP.
            DISPLAY "6. VENDOR ZIP: " VENDOR-ZIP.

       DISPLAY-VENDOR-CONTACT.
            DISPLAY "7. VENDOR CONTACT: " VENDOR-CONTACT.

       DISPLAY-VENDOR-PHONE.
            DISPLAY "8. VENDOR PHONE: " VENDOR-PHONE.

       init-for-key-entry.
            move space to vendor-record.
            move zeroes to vendor-number.
            move "N" to vendor-file-at-end.

       read-first-vendor-record.
            move "N" to vendor-file-at-end.
            start vendor-file
               key not < vendor-name
               invalid key
               move "Y" to vendor-file-at-end.

            if vendor-file-at-end not = "Y"
                perform read-next-vendor-record.

       read-next-vendor-record.
            read vendor-file next record
               at end
                   move "Y" to vendor-file-at-end.

       read-state-record.
            move "Y" to state-record-found.
            read state-file record
               invalid key
                   move "N" to state-record-found.
