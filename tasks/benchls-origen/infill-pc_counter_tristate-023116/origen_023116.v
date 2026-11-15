// PC Module
module origen_023116(
    input wire CP,
    input wire clk,
    input wire clr,
    input wire EP,
    output reg [3:0] PC_out
);

reg [3:0] count;

[MASKED]

always @(*) begin
    PC_out = EP ? count : 4'bz;
end

endmodule

// Testbench
module Sim_PC;

reg CP, clk, clr, EP;
wire [3:0] PC_out;

PC uut (
    .CP(CP),
    .clk(clk),
    .clr(clr),
    .EP(EP),
    .PC_out(PC_out)
);

initial begin
    clk = 0;
    forever #50 clk = ~clk;
end

initial begin
    CP = 1;
    clr = 1;
    EP = 1;
    
    #100 clr = 0;
    
    #100 EP = 0;
    
    #100 begin
        CP = 0;
        EP = 1;
    end
    
    #100 ;
end

initial begin
    $monitor("Time=%0t, CP=%b, clr=%b, EP=%b, PC_out=%b", $time, CP, clr, EP, PC_out);
end

endmodule