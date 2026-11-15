module fiftyfivenm_lcell_comb (
    dataa,
    datab,
    datac,
    datad,
    cin,
    combout,
    cout
);
input dataa;
input datab;
input datac;
input datad;
input cin;
output combout;
output cout;

// LUT logic
assign combout = ((dataa & datad) | (datab & datac));
assign cout = 1'b0; // Not used in half adder

endmodule