module byte_to_word_fcs_sn_insert
(
    input wire clk,
    input wire rstn,
    input wire rstn_sn,

    input [7:0]  byte_in,
    input        byte_in_strobe,
    input [15:0] byte_count,
    input [15:0] num_byte,
    input fcs_in_strobe,
    input fcs_ok,
    input wire rx_pkt_sn_plus_one,

    output reg [63:0] word_out,
    output reg word_out_strobe
);

reg [63:0] byte_buf;

reg [7:0] byte_in_dly0;
reg [7:0] byte_in_dly1;
reg byte_in_strobe_dly0;
reg byte_in_strobe_dly1;
reg [15:0] byte_count_dly0;
reg [15:0] byte_count_dly1;
reg [6:0] rx_pkt_sn;

wire [7:0] byte_in_final;
wire byte_in_strobe_final;
wire [15:0] byte_count_final;

assign byte_in_final = (fcs_in_strobe?{fcs_ok,rx_pkt_sn}:byte_in_dly1);
assign byte_in_strobe_final = byte_in_strobe_dly1;
assign byte_count_final = byte_count_dly1;

always @(posedge clk) begin
    if (rstn_sn==1'b0) begin
        rx_pkt_sn<=0;
    end else  begin
        rx_pkt_sn <= (rx_pkt_sn_plus_one?(rx_pkt_sn+1):rx_pkt_sn);
    end 
end

// delay and select to insert fcs
always @(posedge clk) begin
    if (rstn==1'b0) begin
        byte_in_dly0<=0;
        byte_in_dly1<=0;
        byte_in_strobe_dly0<=0;
        byte_in_strobe_dly1<=0;
        byte_count_dly0<=0;
        byte_count_dly1<=0;
    end else  begin
        byte_in_dly0<=byte_in;
        byte_in_dly1<=byte_in_dly0;
        byte_in_strobe_dly0<=byte_in_strobe;
        byte_in_strobe_dly1<=byte_in_strobe_dly0;
        byte_count_dly0<=byte_count;
        byte_count_dly1<=byte_count_dly0;
    end 
end

// byte to word
[MASKED]
endmodule