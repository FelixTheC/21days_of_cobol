      ******************************************************************
      *fdvnd04.cbl
      *Primary Key - VENDOR-NUMBER
      *Alternate - NAME with duplicates
      * NAME, ADDRESS-1, CITY, STATE,
      *    and PHONE are required fields.
      *
      * VENDOR-STATE must be looked up
      *    and must exist in the STATE-FILE
      *    to be valid.
      * VENDOR-ADDRESS-2 not always used
      *    so may be SPACES
      * VENDOR-PHONE is usually the
      *    number for VENDOR-CONTACT
      * All fields should be entered in
      *    UPPER case.
      ******************************************************************
       fd   vendor-file
            label records are standard.

       01   vendor-record.
            05 vendor-number               pic 9(5).
            05 vendor-name                 pic x(30).
            05 vendor-address-1            pic x(30).
            05 vendor-address-2            pic x(30).
            05 vendor-city                 pic x(20).
            05 vendor-state                pic x(2).
            05 vendor-zip                  pic x(10).
            05 vendor-contact              pic x(30).
            05 vendor-phone                pic x(15).
