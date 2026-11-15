module rtlpp_03404(
    input wire clk,
    input wire [C_bpc - 1:0] r0,
    input wire [C_bpc - 1:0] g0,
    input wire [C_bpc - 1:0] b0,
    input wire [C_bpc - 1:0] r1,
    input wire [C_bpc - 1:0] g1,
    input wire [C_bpc - 1:0] b1,
    output wire [2:0] rgb0,
    output wire [2:0] rgb1,
    output wire [C_bits_x:0] addrx,
    output wire [C_bits_y - 2:0] addry,
    output wire latch,
    output wire blank
);

parameter C_bpc = 8;
parameter C_bits_x = 7;
parameter C_bits_y = 6;

reg [C_bits_x:0] R_addrx = -2;  
reg [C_bits_y - 2:0] R_addry = 0;  
reg R_latch = 0; 
reg R_blank = 0;  
reg [C_bpc - 1:0] R_bcm_counter = 0;  
wire [C_bpc - 1:0] S_compare_val;  
parameter C_2pixels_b4_1st_x_pixel = -2;  
parameter C_1pixel_b4_1st_x_pixel = -1;  
parameter C_last_x_pixel = 2 ** C_bits_x - 1;  
parameter C_1pixel_b4_last_x_pixel = 2 ** C_bits_x - 2;  

assign addrx = R_addrx;
assign addry = R_addry;
assign latch = R_latch;
assign blank = R_blank;

always @(posedge clk) begin
    if(R_addrx == C_last_x_pixel) begin
        R_addrx <= C_2pixels_b4_1st_x_pixel;
    end
    else begin
        R_addrx <= R_addrx + 1;
    end
    case(R_addrx)
        C_2pixels_b4_1st_x_pixel : begin
            R_blank <= 1'b1;
            R_addry <= R_addry + 1;
        end
        C_1pixel_b4_1st_x_pixel : begin
            R_blank <= 1'b0;
            if(R_addry == 0) begin
                R_bcm_counter <= R_bcm_counter + 1;
            end
        end
        C_1pixel_b4_last_x_pixel : begin
            R_latch <= 1'b1;
        end
        C_last_x_pixel : begin
            R_latch <= 1'b0;
        end
        default : begin
        end
    endcase
end

genvar i;
generate
    for (i = 0; i <= C_bpc - 1; i = i + 1) begin: F_reverse_bits
        assign S_compare_val[i] = R_bcm_counter[C_bpc - 1 - i];
    end
endgenerate

assign rgb0[0] = (S_compare_val < r0) ? 1'b1 : 1'b0;
assign rgb0[1] = (S_compare_val < g0) ? 1'b1 : 1'b0;
assign rgb0[2] = (S_compare_val < b0) ? 1'b1 : 1'b0;
assign rgb1[0] = (S_compare_val < r1) ? 1'b1 : 1'b0;
assign rgb1[1] = (S_compare_val < g1) ? 1'b1 : 1'b0;
assign rgb1[2] = (S_compare_val < b1) ? 1'b1 : 1'b0;

endmodule