// 4-to-1 Multiplexer Module
module origen_088417 (
    input [1:0] selCh,
    input [31:0] inCh0, inCh1, inCh2, inCh3,
    output [31:0] selData
);

    assign selData = (selCh == 2'b00) ? inCh0 :
                     (selCh == 2'b01) ? inCh1 :
                     (selCh == 2'b10) ? inCh2 :
                     (selCh == 2'b11) ? inCh3 :
                     32'bx;

endmodule

// Testbench for 4-to-1 Multiplexer
