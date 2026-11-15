module rtlpp_03736 (
    input  wire  clk_src,
    input  wire  clk_des,
    input  wire  rst_b,
    input  wire  d_in,

    output wire  d_sync_pos,
    output wire  d_sync_neg
);

reg [1:0]   d_in_clk_cross_des;
reg [1:0]   d_in_clk_cross_src;

reg         d_in_lev;
reg         d_des_sync_dly;
wire        d_src_sync;

always @(posedge clk_src or negedge rst_b) begin
        if(~rst_b)begin
            d_in_lev <= 1'b0;
        end
        else begin
        if (d_in)
            d_in_lev <= 1'b1;
        else if (d_src_sync)
            d_in_lev <= 1'b0;
        else;
    end
end


always@(posedge clk_des or negedge rst_b) begin 
    if(~rst_b) begin
        d_in_clk_cross_des <= {2{1'b0}};
    end
    else begin
        d_in_clk_cross_des <= {d_in_clk_cross_des[0],d_in_lev};
    end
end
assign d_des_sync = d_in_clk_cross_des[1];

always @(posedge clk_des or negedge rst_b) begin
    if (~rst_b) begin
        d_des_sync_dly <= 1'b0;
    end
    else begin
        d_des_sync_dly <= d_des_sync;
    end
end


always@(posedge clk_src or negedge rst_b) begin 
    if(~rst_b) begin
        d_in_clk_cross_src <= {2{1'b0}};
    end
    else begin
        d_in_clk_cross_src <= {d_in_clk_cross_src[0],d_des_sync_dly};
    end
end
assign d_src_sync = d_in_clk_cross_src[1];
    

assign d_sync_pos = d_des_sync && ~d_des_sync_dly;
assign d_sync_neg = ~d_des_sync && d_des_sync_dly;

endmodule