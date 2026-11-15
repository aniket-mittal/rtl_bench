// Module test0: Synchronous AND gate with asynchronous reset
module origen_021335 (
    input wire a,
    input wire b,
    input wire clk,
    input wire reset_,
    output reg z
);

always @(posedge clk or negedge reset_) begin
    if (!reset_)
        z <= 1'b0;
    else
        z <= a & b;
end

endmodule

// Module test1: Single-port synchronous RAM with separate read and write enables
module test1 (
    input wire clk,
    input wire [7:0] raddr,
    input wire [7:0] waddr,
    input wire [7:0] wdata,
    input wire we,
    output reg [7:0] rdata
);

reg [7:0] mem [0:255];

always @(posedge clk) begin
    if (we)
        mem[waddr] <= wdata;
    rdata <= mem[raddr];
end

endmodule

// Module test2: Synchronous RAM with registered read address
module test2 (
    input wire clk,
    input wire [7:0] raddr,
    input wire [7:0] waddr,
    input wire [7:0] wdata,
    input wire we,
    output wire [7:0] rdata
);

reg [7:0] mem [0:255];
reg [7:0] raddr_p1;

always @(posedge clk) begin
    if (we)
        mem[waddr] <= wdata;
    raddr_p1 <= raddr;
end

assign rdata = mem[raddr_p1];

endmodule