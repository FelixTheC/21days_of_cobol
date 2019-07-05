      ******************************************************************
      * Author: Felix Eisenmenger
      * Date:
      * Purpose: training
      * Tectonics: cobc
      ******************************************************************
       fd   voucher-file
            label records are standard.

       01   voucher-record.
            05 voucher-number                          pic 9(5).
            05 voucher-vendor                          pic 9(5).
            05 voucher-invoice                         pic x(15).
            05 voucher-for                             pic x(30).

            05 voucher-amount                          pic S9(6)V99.
            05 voucher-date                            pic 9(8).
            05 voucher-due                             pic 9(8).
            05 voucher-deductible                      pic x.
            05 voucher-selected                        pic x.
            05 voucher-paid-amount                     pic S9(6)V99.
            05 voucher-paid-date                       pic 9(8).
            05 voucher-check-no                        pic 9(6).
