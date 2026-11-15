// Behavioral 2-to-4 Decoder
module origen_056449(
    input address0, address1, enable,
    output out0, out1, out2, out3
);
    wire [3:0] out;
    assign {out3, out2, out1, out0} = enable << {address1, address0};
endmodule

// Structural 2-to-4 Decoder
module structuralDecoder(
    input address0, address1, enable,
    output out0, out1, out2, out3
);
    wire naddress0, naddress1;

    not #50 (naddress0, address0);
    not #50 (naddress1, address1);

    and #50 (out0, naddress1, naddress0, enable);
    and #50 (out1, naddress1, address0, enable);
    and #50 (out2, address1, naddress0, enable);
    and #50 (out3, address1, address0, enable);
endmodule

// Testbench
