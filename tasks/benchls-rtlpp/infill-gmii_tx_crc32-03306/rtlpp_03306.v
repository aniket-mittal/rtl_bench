module rtlpp_03306(
    input                 rst_n,
    input                 clk,
    input  wire           ppt2gtc_gmii_dv,
    input  wire           ppt2gtc_gmii_er,
    input  wire  [   7:0] ppt2gtc_gmii_data,
    
    output reg            gmii_tx_en,
    output reg            gmii_tx_er,
    output reg   [  7:0]  gmii_txd
    );

    reg            ppt2gtc_gmii_dv_r0;
    wire           pos_edge;
    wire           neg_edge;
    wire   [7:0]   data_in;
    wire   [31:0]  crc_f;
    reg    [31:0]  next_crc;
    wire   [31:0]  lastcrc;
    reg    [1:0]   crc_cnt;
   
    reg    [2:0]   ctrl_state;
    localparam IDLE_S = 3'd1,
               RCV_S  = 3'd2,
               CRC_S  = 3'd3,
               OUT_S  = 3'd4;

assign pos_edge =~ppt2gtc_gmii_dv_r0 & ppt2gtc_gmii_dv;
assign neg_edge =ppt2gtc_gmii_dv_r0 & ~ppt2gtc_gmii_dv;                 

always @ (posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        ppt2gtc_gmii_dv_r0 <= 1'b0;
    end
    else begin
        ppt2gtc_gmii_dv_r0 <= ppt2gtc_gmii_dv;
    end
end      

assign data_in = ppt2gtc_gmii_data;

assign crc_f = next_crc;
assign lastcrc = ~crc_f;

[MASKED]

endmodule