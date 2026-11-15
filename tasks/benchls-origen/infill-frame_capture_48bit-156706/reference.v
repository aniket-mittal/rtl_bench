module origen_156706(
    input pclk,
    input vsync,
    input hsync,
    input [7:0] din_8bit,
    output reg [18:0] address,
    output reg [47:0] dout_48bit,
    output reg we
);

    reg [15:0] din_latch_reg;
    reg [5:0] count;
    reg [18:0] addr_next;
    reg wr_hold;
    reg [47:0] dout_48bit_reg;

    always @(posedge pclk) begin
        if (vsync) begin
            addr_next <= 0;
            count <= 0;
            wr_hold <= 0;
        end
        else if (hsync) begin
            din_latch_reg <= {din_8bit, din_latch_reg[15:8]};
            if (wr_hold) begin
                address <= addr_next;
                dout_48bit <= dout_48bit_reg;
                we <= 1'b1;
                addr_next <= addr_next + 1'b1;
                count <= 0;
            end
            else begin
                we <= 1'b0;
            end
            wr_hold <= 1'b1;
        end
        else begin
            if (count == 0) begin
                dout_48bit_reg[47:32] <= din_latch_reg;
            end
            else if (count == 1) begin
                dout_48bit_reg[31:16] <= din_latch_reg;
            end
            else if (count == 2) begin
                dout_48bit_reg[15:0] <= din_latch_reg;
                wr_hold <= 1'b0;
            end
            count <= count + 1'b1;
        end
    end

endmodule