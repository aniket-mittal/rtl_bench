// 4-to-1 Multiplexer Module
module origen_088417 (
    input [1:0] selCh,
    input [31:0] inCh0, inCh1, inCh2, inCh3,
    output [31:0] selData
);

    [MASKED]

endmodule

// Testbench for 4-to-1 Multiplexer
module mux4to1_tb;
    reg [1:0] selCh;
    reg [31:0] inCh0, inCh1, inCh2, inCh3;
    wire [31:0] selData;

    mux4to1 uut (
        .selCh(selCh),
        .inCh0(inCh0),
        .inCh1(inCh1),
        .inCh2(inCh2),
        .inCh3(inCh3),
        .selData(selData)
    );

    initial begin
        $monitor("Time=%0t selCh=%b inCh0=%h inCh1=%h selData=%h", $time, selCh, inCh0, inCh1, selData);

        // Initialize inputs
        selCh = 2'b00;
        inCh0 = 32'h12345678;
        inCh1 = 32'h9ABCDEF0;
        inCh2 = 32'hFEDCBA98;
        inCh3 = 32'h76543210;

        // Test cases
        #10 selCh = 2'b01;
        #10 selCh = 2'b10;
        #10 selCh = 2'b11;
        #10 selCh = 2'b00;
        #10 inCh0 = 32'hAAAAAAAA;
        #10 selCh = 2'b01;
        #10 inCh1 = 32'hBBBBBBBB;
        #10 selCh = 2'b10;
        #10 inCh2 = 32'hCCCCCCCC;
        #10 selCh = 2'b11;
        #10 inCh3 = 32'hDDDDDDDD;

        #10 ;
    end

endmodule