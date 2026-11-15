module autovcoder_115066 (
    pcs_ctrl_in1,
    pcs_ctrl_in2,
    pcs_ctrl_in3,
    pcs_ctrl_in4,
    pcs_ctrl_in5,
    pcs_ctrl_in6,
    pcs_ctrl_in7,
    pcs_ctrl_in8,
    pcs_ctrl_in9,
    pcs_ctrl_in10,
    pcs_ctrl_in11,
    pcs_ctrl_in12,
    pcs_ctrl_in13,
    pcs_ctrl_in14,
    pcs_ctrl_in15,
    pcs_ctrl_in16,
    hw_address_ctrl_in1,
    hw_address_ctrl_in2,
    hw_address_ctrl_in3,
    hw_address_ctrl_in4,
    hw_address_ctrl_in5,
    hw_address_ctrl_in6,
    hw_address_ctrl_in7,
    hw_address_ctrl_in8,
    hw_address_ctrl_in9,
    hw_address_ctrl_in10,
    hw_address_ctrl_in11,
    hw_address_ctrl_in12,
    hw_address_ctrl_in13,
    hw_address_ctrl_in14,
    hw_address_ctrl_in15,
    hw_address_ctrl_in16,
    reg_addr,
    pcs_ctrl_out
);

  input [15:0] pcs_ctrl_in1;
  input [15:0] pcs_ctrl_in2;
  input [15:0] pcs_ctrl_in3;
  input [15:0] pcs_ctrl_in4;
  input [15:0] pcs_ctrl_in5;
  input [15:0] pcs_ctrl_in6;
  input [15:0] pcs_ctrl_in7;
  input [15:0] pcs_ctrl_in8;
  input [15:0] pcs_ctrl_in9;
  input [15:0] pcs_ctrl_in10;
  input [15:0] pcs_ctrl_in11;
  input [15:0] pcs_ctrl_in12;
  input [15:0] pcs_ctrl_in13;
  input [15:0] pcs_ctrl_in14;
  input [15:0] pcs_ctrl_in15;
  input [15:0] pcs_ctrl_in16;
  input [15:0] hw_address_ctrl_in1;
  input [15:0] hw_address_ctrl_in2;
  input [15:0] hw_address_ctrl_in3;
  input [15:0] hw_address_ctrl_in4;
  input [15:0] hw_address_ctrl_in5;
  input [15:0] hw_address_ctrl_in6;
  input [15:0] hw_address_ctrl_in7;
  input [15:0] hw_address_ctrl_in8;
  input [15:0] hw_address_ctrl_in9;
  input [15:0] hw_address_ctrl_in10;
  input [15:0] hw_address_ctrl_in11;
  input [15:0] hw_address_ctrl_in12;
  input [15:0] hw_address_ctrl_in13;
  input [15:0] hw_address_ctrl_in14;
  input [15:0] hw_address_ctrl_in15;
  input [15:0] hw_address_ctrl_in16;
  input [15:0] reg_addr;

  output [15:0] pcs_ctrl_out;

  assign  pcs_ctrl_out = (reg_addr == hw_address_ctrl_in1 ) ?  pcs_ctrl_in1  :
                       (reg_addr == hw_address_ctrl_in2 ) ?  pcs_ctrl_in2  :
                       (reg_addr == hw_address_ctrl_in3 ) ?  pcs_ctrl_in3  :
                       (reg_addr == hw_address_ctrl_in4 ) ?  pcs_ctrl_in4  :
                       (reg_addr == hw_address_ctrl_in5 ) ?  pcs_ctrl_in5  :
                       (reg_addr == hw_address_ctrl_in6 ) ?  pcs_ctrl_in6  :
                       (reg_addr == hw_address_ctrl_in7 ) ?  pcs_ctrl_in7  :
                       (reg_addr == hw_address_ctrl_in8 ) ?  pcs_ctrl_in8  :
                       (reg_addr == hw_address_ctrl_in9 ) ?  pcs_ctrl_in9  :
                       (reg_addr == hw_address_ctrl_in10) ?  pcs_ctrl_in10 :
                       (reg_addr == hw_address_ctrl_in11) ?  pcs_ctrl_in11 :
                       (reg_addr == hw_address_ctrl_in12) ?  pcs_ctrl_in12 :
                       (reg_addr == hw_address_ctrl_in13) ?  pcs_ctrl_in13 :
                       (reg_addr == hw_address_ctrl_in14) ?  pcs_ctrl_in14 :
                       (reg_addr == hw_address_ctrl_in15) ?  pcs_ctrl_in15 :
                       (reg_addr == hw_address_ctrl_in16) ?  pcs_ctrl_in16 :
                       16'h0000;

endmodule

