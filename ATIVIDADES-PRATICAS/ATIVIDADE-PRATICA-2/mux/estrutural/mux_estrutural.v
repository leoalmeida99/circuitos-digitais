module mux_estrutural(D0, D1, D2, D3, S0, S1, Y);

    input D0, D1, D2, D3, S0, S1;
    output Y;
    wire FIO_NOT_1, FIO_NOT_2, FIO_AND_1, FIO_AND_2, FIO_AND_3, FIO_AND_4;

    not i0 (FIO_NOT_1, S1);
    not i1 (FIO_NOT_2, S0);

    and i2 (FIO_AND_1, FIO_NOT_1, FIO_NOT_2, D0);
    and i3 (FIO_AND_2, FIO_NOT_2, S1, D1);
    and i4 (FIO_AND_3, S0, FIO_NOT_1, D2);
    and i5 (FIO_AND_4, S1, S0, D3);

    or i6 (Y, FIO_AND_1, FIO_AND_2, FIO_AND_3, FIO_AND_4);

endmodule