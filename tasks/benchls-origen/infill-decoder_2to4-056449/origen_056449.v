// Behavioral 2-to-4 Decoder
module origen_056449(
    input address0, address1, enable,
    output out0, out1, out2, out3
);
    wire [3:0] out;
    [MASKED]
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
module testDecoder;
    reg address0, address1, enable;
    wire out0, out1, out2, out3;

    structuralDecoder dut(
        .address0(address0),
        .address1(address1),
        .enable(enable),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

    initial begin
        $display("Time\tEnable\tAddr1\tAddr0\tOut3\tOut2\tOut1\tOut0");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", 
                 $time, enable, address1, address0, out3, out2, out1, out0);

        // Test all combinations
        enable = 0; address1 = 0; address0 = 0; #100;
        enable = 0; address1 = 0; address0 = 1; #100;
        enable = 0; address1 = 1; address0 = 0; #100;
        enable = 0; address1 = 1; address0 = 1; #100;
        enable = 1; address1 = 0; address0 = 0; #100;
        enable = 1; address1 = 0; address0 = 1; #100;
        enable = 1; address1 = 1; address0 = 0; #100;
        enable = 1; address1 = 1; address0 = 1; #100;

        ;
    end
endmodule