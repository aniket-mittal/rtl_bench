// 3-to-8 Decoder Module
module origen_059402(
    input [2:0] in,
    input en,
    output reg [7:0] out
);

[MASKED]

endmodule

// Testbench for 3-to-8 Decoder
module tb_decoder38();

reg [2:0] in;
reg en;
wire [7:0] out;

decoder38 dut (
    .in(in),
    .en(en),
    .out(out)
);

initial begin
    $monitor("Time=%0t en=%b in=%b out=%b", $time, en, in, out);
    
    // Test with enable high
    en = 1;
    for (in = 0; in < 8; in = in + 1) begin
        #10;
    end
    
    // Test with enable low
    en = 0;
    in = 3'b111;
    #10;
    
    ;
end

endmodule