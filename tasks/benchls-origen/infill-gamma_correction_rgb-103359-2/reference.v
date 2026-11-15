module origen_103359
(
    input             clk_sys,
    input             clk_vid,
    input             ce_pix,

    input             gamma_en,
    input             gamma_wr,
    input       [9:0] gamma_wr_addr,
    input       [7:0] gamma_value,

    input      [23:0] RGB_in,
    input             HSync,
    input             VSync,
    input             DE,
    input             Blanking,

    output reg [23:0] RGB_out,
    output reg        HSync_out,
    output reg        VSync_out,
    output reg        DE_out,
    output reg        Blanking_out
);

reg [7:0] gamma_curve[768];

always @(posedge clk_sys) begin
    if(gamma_wr) gamma_curve[gamma_wr_addr] <= gamma_value;
end

reg [9:0] gamma_index;
reg [1:0] ctr;
reg [23:0] rgb1, rgb2;
reg hs1,vs1,de1,bl1;
reg hs2,vs2,de2,bl2;

always @(posedge clk_vid) begin
    if(ce_pix) begin
        {rgb2,hs2,vs2,de2,bl2} <= {rgb1,hs1,vs1,de1,bl1};
        {rgb1,hs1,vs1,de1,bl1} <= {RGB_in,HSync,VSync,DE,Blanking};

        ctr <= ctr + 1'd1;
        case(ctr)
            0: gamma_index <= {2'b00,rgb1[23:16]};
            1: gamma_index <= {2'b01,rgb1[15:8]};
            2: gamma_index <= {2'b10,rgb1[7:0]};
        endcase

        RGB_out <= gamma_en ? {gamma_curve[gamma_index], rgb2[15:0]} : rgb2;
        {HSync_out,VSync_out,DE_out,Blanking_out} <= {hs2,vs2,de2,bl2};
    end
end

endmodule

module gamma_fast
(
    input             clk_vid,
    input             ce_pix,

    inout      [21:0] gamma_bus,

    input      [23:0] RGB_in,
    input             HSync,
    input             VSync,
    input             DE,
    input             Blanking,

    output reg [23:0] RGB_out,
    output reg        HSync_out,
    output reg        VSync_out,
    output reg        DE_out,
    output reg        Blanking_out
);

wire clk_sys = gamma_bus[20];
wire gamma_wr = gamma_bus[19];
wire [9:0] gamma_wr_addr = gamma_bus[18:9];
wire [7:0] gamma_value = gamma_bus[7:0];
wire gamma_en = gamma_bus[21];

reg [7:0] gamma_r[256];
reg [7:0] gamma_g[256];
reg [7:0] gamma_b[256];

always @(posedge clk_sys) begin
    if(gamma_wr) begin
        case(gamma_wr_addr[9:8])
            2'b00: gamma_r[gamma_wr_addr[7:0]] <= gamma_value;
            2'b01: gamma_g[gamma_wr_addr[7:0]] <= gamma_value;
            2'b10: gamma_b[gamma_wr_addr[7:0]] <= gamma_value;
        endcase
    end
end

reg [23:0] rgb1;
reg hs1,vs1,de1,bl1;

always @(posedge clk_vid) begin
    if(ce_pix) begin
        {rgb1,hs1,vs1,de1,bl1} <= {RGB_in,HSync,VSync,DE,Blanking};

        RGB_out <= gamma_en ? {gamma_r[rgb1[23:16]], gamma_g[rgb1[15:8]], gamma_b[rgb1[7:0]]} : rgb1;
        {HSync_out,VSync_out,DE_out,Blanking_out} <= {hs1,vs1,de1,bl1};
    end
end

endmodule