module autovcoder_030773 #(
    parameter _saxi_maskwidth = 4,
    parameter _saxi_shift = 2,
    parameter _saxi_mask = {_saxi_maskwidth{1'd1}}
) (
    input CLK,
    input RST,
    output reg [32-1:0] _saxi_register_fsm,
    input i__tmp_2,
    input i__tmp_1,
    input [32-1:0] i__tmp_0,
    input i_saxi_rready,
    input i_saxi_rvalid,
    output reg [_saxi_maskwidth-1:0] _tmp_5
);

  localparam _saxi_register_fsm_init = 0;
  localparam _saxi_register_fsm_1 = 1;
  localparam _saxi_register_fsm_2 = 2;

  always @(posedge CLK) begin
    if (RST) begin
      _saxi_register_fsm <= _saxi_register_fsm_init;
    end else begin
      case (_saxi_register_fsm)
        _saxi_register_fsm_init: begin
          if (i__tmp_2 || i__tmp_1) begin
            _tmp_5 <= (i__tmp_0 >> _saxi_shift) & _saxi_mask;
          end
          if (i__tmp_2) begin
            _saxi_register_fsm <= _saxi_register_fsm_1;
          end
          if (i__tmp_1) begin
            _saxi_register_fsm <= _saxi_register_fsm_2;
          end
        end
        _saxi_register_fsm_1: begin
          if (i_saxi_rready || !i_saxi_rvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end
        end
        _saxi_register_fsm_2: begin
          _saxi_register_fsm <= _saxi_register_fsm_init;
        end
      endcase
    end
  end


endmodule

