module origen_024427 (
    input wire clk,
    input wire [2:0] addr1,
    input wire [2:0] addr2,
    output reg [63:0] dout1,
    output reg [63:0] dout2
);

    // ROM contents
    localparam [63:0] loc0 = 64'h0123456789ABCDEF;
    localparam [63:0] loc1 = 64'hFEDCBA9876543210;
    localparam [63:0] loc2 = 64'hAAAAAAAA55555555;
    localparam [63:0] loc3 = 64'h5555555AAAAAAAAA;
    localparam [63:0] loc4 = 64'hF0F0F0F00F0F0F0F;
    localparam [63:0] loc5 = 64'h0F0F0F0FF0F0F0F0;
    localparam [63:0] loc6 = 64'hFFFF0000FFFF0000;
    localparam [63:0] loc7 = 64'h00FFFF0000FFFF00;

    reg [63:0] dout1_next, dout2_next;
    reg [63:0] dout1_reg1, dout2_reg1;

    [MASKED]

    always @(posedge clk) begin
        dout1_reg1 <= dout1_next;
        dout2_reg1 <= dout2_next;
        dout1 <= dout1_reg1;
        dout2 <= dout2_reg1;
    end

endmodule