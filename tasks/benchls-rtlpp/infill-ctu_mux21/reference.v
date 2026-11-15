module ctu_mux21(
    input s,
    input d0,
    input d1,
    output z
);
assign z = s ? d0 : d1;
endmodule