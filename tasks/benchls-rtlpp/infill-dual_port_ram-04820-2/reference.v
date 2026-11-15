module rtlpp_04820
        (
          input clk, 
          input we, 
          input [addr_width-1:0] a, 
          input [addr_width-1:0] dpra, 
          input  [data_width-1:0] di, 
          output reg [data_width-1:0] dpo
        );

parameter addr_width = 4;
parameter data_width = 8;
parameter depth = 16;

reg [data_width-1:0] ram [depth-1:0];

always @(posedge clk) begin
    if (we)
        ram[a] <= di;
end

always @(posedge clk) begin
    dpo <= ram[dpra];
end

endmodule