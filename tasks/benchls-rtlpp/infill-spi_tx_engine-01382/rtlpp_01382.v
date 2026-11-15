module rtlpp_01382 (
    input rst_i,
    input clk_i,
    input cyc_i,
    input stb_i,
    output ack_o,
    input we_i,
    input [127:0] dat_i,
    input cs_i,
    input sclk,
    input cts,
    output [3:0] txd,
    output reg empty
);
    reg txing;
    reg [135:0] tx_data;
    reg [127:0] fdo;
    reg [8:0] cnt;
    reg rd;

    assign ack_o = cyc_i & stb_i & cs_i;
    assign txd = tx_data[3:0];

    // Edge Detector Logic
    reg pe_ack_d1, ack_o_d1;

    always @(posedge sclk or posedge rst_i) begin
        if (rst_i) begin
            pe_ack_d1 <= 1'b0;
            ack_o_d1 <= 1'b0;
        end 
        else begin
            ack_o_d1 <= ack_o & we_i;
            pe_ack_d1 <= ack_o_d1 & ~(ack_o & we_i);
        end
    end
    
    wire pe_ack = pe_ack_d1;

    [MASKED]

endmodule