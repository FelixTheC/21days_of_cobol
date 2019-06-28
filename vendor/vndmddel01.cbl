       DELETE-MODE.
            MOVE "DELTE" TO THE-MODE.
            PERFORM GET-VENDOR-RECORD.
            PERFORM DELETE-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES.

       DELETE-RECORDS.
               PERFORM DISPLAY-ALL-FIELDS.
               MOVE "X" TO OK-TO-DELETE.

               PERFORM ASK-TO-DELETE
                   UNTIL OK-TO-DELETE = "Y" OR "N".

               IF OK-TO-DELETE = "Y"
                   PERFORM DELETE-VENDOR-RECORD.

               PERFORM GET-VENDOR-RECORD.

       ASK-TO-DELETE.
            DISPLAY "DELETE THIS RECORD (Y/N)?".
            ACCEPT OK-TO-DELETE.
            IF OK-TO-DELETE = "y"
                MOVE "Y" TO OK-TO-DELETE.
            IF OK-TO-DELETE = "n"
                MOVE "N" TO OK-TO-DELETE.
            IF OK-TO-DELETE NOT = "Y" AND
                OK-TO-DELETE NOT = "N"
                DISPLAY "YOU MUST ENTER YES OR NO".
