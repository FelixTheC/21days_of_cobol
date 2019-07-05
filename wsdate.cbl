       77   date-entry-field                           pic z9/99/9999.
       77   date-mmddccyy                              pic 9(8).
       77   date-quotient                              pic 9(4).
       77   date-remainder                             pic 9(4).

       77   valid-date-flag                         pic x.
            88 date-is-invalid                         value "N".
            88 date-is-zero                            value "0".
            88 date-is-valid                           value "Y".
            88 date-is-ok                              value "Y" "0".

       01   date-ccyymmdd                              pic 9(8).
       01   filler redefines date-ccyymmdd.
            05 date-ccyy                               pic 9(4).
            05 date-mm                                 pic 9(2).
            05 date-dd                                 pic 9(2).
