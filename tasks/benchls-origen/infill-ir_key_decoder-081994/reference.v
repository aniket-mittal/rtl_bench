module origen_081994 (
    input wire dout_vld,
    input wire [7:0] dout,
    output reg [1:0] blue_LR,
    output reg blue_key_left,
    output reg blue_key_down,
    output reg blue_key_right,
    output reg blue_key_up,
    output reg blue_key_unknown,
    output reg blue_wendu,
    output reg blue_Go
);

    always @(posedge dout_vld) begin
        case (dout)
            8'h01: begin
                blue_Go <= 1'b1;
            end
            8'h02: begin
                blue_Go <= 1'b0;
            end
            8'h03: begin
                blue_LR <= 2'b01;
            end
            8'h04: begin
                blue_LR <= 2'b00;
            end
            8'h05: begin
                blue_LR <= 2'b10;
            end
            8'h06: begin
                blue_LR <= 2'b11;
            end
            8'h12: begin
                blue_key_left <= 1'b1;
                blue_key_down <= 1'b0;
                blue_key_right <= 1'b0;
                blue_key_up <= 1'b0;
                blue_key_unknown <= 1'b0;
            end
            8'h13: begin
                blue_key_left <= 1'b0;
                blue_key_down <= 1'b1;
                blue_key_right <= 1'b0;
                blue_key_up <= 1'b0;
                blue_key_unknown <= 1'b0;
            end
            8'h14: begin
                blue_key_left <= 1'b0;
                blue_key_down <= 1'b0;
                blue_key_right <= 1'b1;
                blue_key_up <= 1'b0;
                blue_key_unknown <= 1'b0;
            end
            8'h15: begin
                blue_key_left <= 1'b0;
                blue_key_down <= 1'b0;
                blue_key_right <= 1'b0;
                blue_key_up <= 1'b1;
                blue_key_unknown <= 1'b0;
            end
            8'h16: begin
                blue_key_left <= 1'b0;
                blue_key_down <= 1'b0;
                blue_key_right <= 1'b0;
                blue_key_up <= 1'b0;
                blue_key_unknown <= 1'b1;
            end
            8'h31: begin
                blue_wendu <= 1'b1;
            end
            8'h33: begin
                blue_wendu <= 1'b0;
            end
            default: begin
                blue_LR <= blue_LR;
                blue_key_left <= blue_key_left;
                blue_key_down <= blue_key_down;
                blue_key_right <= blue_key_right;
                blue_key_up <= blue_key_up;
                blue_key_unknown <= blue_key_unknown;
                blue_wendu <= blue_wendu;
                blue_Go <= blue_Go;
            end
        endcase
    end

endmodule