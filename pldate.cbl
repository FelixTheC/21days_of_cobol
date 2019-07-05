       get-a-date.
            perform accept-a-date.
            perform re-accept-a-date
               until date-is-ok.

       accept-a-date.
            display "ENTER A DATE (MM/DD/CCYY)".
            accept date-entry-field.
            perform edit-check-date.

       re-accept-a-date.
            display "INVALID DATE".
            perform accept-a-date.

       edit-check-date.
            perform edit-date.
            perform check-date.

       edit-date.
            move date-entry-field to date-mmddccyy.
            compute date-ccyymmdd = date-mmddccyy * 10000.0001.

       check-date.
            move "Y" to valid-date-flag.
            perform check-if-date-zeroes.
            if date-is-valid
                perform check-mm.
            if date-is-valid
                perform check-dd.
            if date-is-valid
                perform check-mmdd.
            if date-is-valid
                perform check-leap-year.

       check-if-date-zeroes.
            if date-ccyymmdd = zeroes
                move "0" to valid-date-flag.

       check-mm.
            if date-mm < 1 or date-mm > 12
                move "N" to valid-date-flag.

       check-dd.
            if date-dd < 1 or date-mm > 31
                move "N" to valid-date-flag.

       check-mmdd.
            if (date-dd > 30) and (date-mm = 2 or 4 or 6 or 9 or 11)
                move "N" to valid-date-flag
            else
                if date-dd > 29 and date-mm = 2
                    move "N" to valid-date-flag.

       check-leap-year.
            if date-dd = 29 and date-mm = 2
                divide date-ccyy by 400 giving date-quotient
                   remainder date-remainder
                if date-remainder = 0
                    move "Y" to valid-date-flag
                else
                    divide date-ccyy by 100 giving date-quotient
                       remainder date-remainder
                    if date-remainder = 0
                        move "N" to valid-date-flag
                    else
                        divide date-ccyy by 4 giving date-quotient
                           remainder date-remainder
                        if date-remainder = 0
                            move "Y" to valid-date-flag
                        else
                            move "N" to valid-date-flag.
