       CHANGE-MODE.
            MOVE "CHANGE" TO THE-MODE.
            PERFORM GET-VENDOR-RECORD.
            PERFORM CHANGE-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES.

       CHANGE-RECORDS.
            PERFORM GET-FIELD-TO-CHANGE.
            PERFORM CHANGE-ONE-FIELD
               UNTIL WHICH-FIELD = ZERO.
            PERFORM GET-VENDOR-RECORD.

       GET-FIELD-TO-CHANGE.
            PERFORM DISPLAY-ALL-FIELDS.
            PERFORM ASK-WHICH-FIELD.

       ASK-WHICH-FIELD.
            DISPLAY "ENTER THE NUMBER OF THE FIELD".
            DISPLAY "TO CHANGE (1-8) OR 0 TO EXIT".
            ACCEPT WHICH-FIELD.
            IF WHICH-FIELD > 8
                DISPLAY "INVALID ENTRY".

       CHANGE-ONE-FIELD.
            PERFORM CHANGE-THIS-FIELD.
            PERFORM GET-FIELD-TO-CHANGE.

       CHANGE-THIS-FIELD.
            IF WHICH-FIELD = 1
                PERFORM ENTER-VENDOR-NAME.
            IF WHICH-FIELD = 2
                PERFORM ENTER-VENDOR-ADDRESS-1.
            IF WHICH-FIELD = 3
                PERFORM ENTER-VENDOR-ADDRESS-2.
            IF WHICH-FIELD = 4
                PERFORM ENTER-VENDOR-CITY.
            IF WHICH-FIELD = 5
                PERFORM ENTER-VENDOR-STATE.
            IF WHICH-FIELD = 6
                PERFORM ENTER-VENDOR-ZIP.
            IF WHICH-FIELD = 7
                PERFORM ENTER-VENDOR-CONTACT.
            IF WHICH-FIELD = 8
                PERFORM ENTER-VENDOR-PHONE.

            PERFORM REWRITE-VENDOR-RECORD.
