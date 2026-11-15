module origen_130532 (
    input wire clk,
    input wire rst_n,
    output wire out_1bit,
    output wire [2:0] out_3bit,
    output wire [7:0] out_8bit
);

reg [2:0] counter;
reg data_in, enable;
reg [2:0] data_3bit;
reg [7:0] data_8bit;

[MASKED]

reg ff_1bit, ff_3bit, ff_8bit;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ff_1bit <= 1'b0;
        ff_3bit <= 3'h0;
        ff_8bit <= 8'h00;
    end else if (enable) begin
        ff_1bit <= data_in;
        ff_3bit <= data_3bit;
        ff_8bit <= data_8bit;
    end
end

assign out_1bit = ff_1bit;
assign out_3bit = ff_3bit;
assign out_8bit = ff_8bit;

endmodule

module testbench;
    reg clk, rst_n;
    wire out_1bit;
    wire [2:0] out_3bit;
    wire [7:0] out_8bit;

    conditional_ff dut (
        .clk(clk),
        .rst_n(rst_n),
        .out_1bit(out_1bit),
        .out_3bit(out_3bit),
        .out_8bit(out_8bit)
    );

    initial begin
        clk = 0;
        rst_n = 0;
        #10 rst_n = 1;
        
        #10; // Cycle 1
        #10; // Cycle 2
        #10; // Cycle 3
        if (out_8bit !== 8'h11) $display("Error at cycle 3");
        #10; // Cycle 4
        if (out_8bit !== 8'h11) $display("Error at cycle 4");
        #10; // Cycle 5
        if (out_8bit !== 8'h44) $display("Error at cycle 5");
        #10; // Cycle 6
        if (out_8bit !== 8'h77) $display("Error at cycle 6");
        #10; // Cycle 7
        if (out_8bit !== 8'h88) $display("Error at cycle 7");
        
        ;
    end

    always #5 clk = ~clk;

endmodule