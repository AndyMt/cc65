;
; 2020-01-08, Greg King
;
; void waitvsync (void);
; /* Wait for the start of the next video field. */
;
; VERA's vertical sync causes IRQs which increment the jiffy timer.
;

        .export         _waitvsync

        .include        "cx16.inc"

_waitvsync:
        ldx     BANK_RAM_SEL    ; (TIMER is in RAM bank 0)
        stz     BANK_RAM_SEL
        lda     TIMER + 2
:       cmp     TIMER + 2
        beq     :-              ; Wait for next jiffy
        stx     BANK_RAM_SEL
        rts
