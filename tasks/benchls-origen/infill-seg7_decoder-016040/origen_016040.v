// Seven-Segment Display Decoder Module
module origen_016040(
    input [3:0] inp,
    output reg [6:0] out
);

[MASKED]

endmodule

// Testbench
module testbench;

reg [3:0] inp;
wire [6:0] out;

seg_disp uut (
    .inp(inp),
    .out(out)
);

initial begin
    $dumpfile("seg_disp.vcd");
    $dumpvars(0, testbench);
    
    $display("Input | Output");
    $display("------+--------");
    
    for (inp = 4'h0; inp <= 4'hF; inp = inp + 1) begin
        #10;
        $display(" %h    | %b", inp, out);
    end
    
    ;
end

endmodule