module origen_159912(
  input [5:0] sel,
  output reg txd
);

always @(*) begin
  case (sel)
    6'd0:   txd = 1'b0;
    6'd1:   txd = 1'b1;
    6'd2:   txd = 1'b0;
    6'd3:   txd = 1'b1;
    6'd4:   txd = 1'b0;
    6'd5:   txd = 1'b1;
    6'd6:   txd = 1'b0;
    6'd7:   txd = 1'b1;
    6'd8:   txd = 1'b0;
    6'd9:   txd = 1'b1;
    6'd10:  txd = 1'b0;
    6'd11:  txd = 1'b1;
    6'd12:  txd = 1'b0;
    6'd13:  txd = 1'b1;
    6'd14:  txd = 1'b0;
    6'd15:  txd = 1'b1;
    6'd16:  txd = 1'b0;
    6'd17:  txd = 1'b1;
    6'd18:  txd = 1'b0;
    6'd19:  txd = 1'b1;
    6'd20:  txd = 1'b0;
    6'd21:  txd = 1'b1;
    6'd22:  txd = 1'b0;
    6'd23:  txd = 1'b1;
    6'd24:  txd = 1'b0;
    6'd25:  txd = 1'b1;
    6'd26:  txd = 1'b0;
    6'd27:  txd = 1'b1;
    6'd28:  txd = 1'b0;
    6'd29:  txd = 1'b1;
    6'd30:  txd = 1'b0;
    6'd31:  txd = 1'b1;
    6'd32:  txd = 1'b0;
    6'd33:  txd = 1'b1;
    6'd34:  txd = 1'b0;
    6'd35:  txd = 1'b1;
    6'd36:  txd = 1'b0;
    6'd37:  txd = 1'b1;
    6'd38:  txd = 1'b0;
    6'd39:  txd = 1'b1;
    default: txd = 1'b1;
  endcase
end

endmodule