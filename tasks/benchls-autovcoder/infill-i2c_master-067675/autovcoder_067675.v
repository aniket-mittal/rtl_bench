module autovcoder_067675 (

    input            i_start,
    input            i_cclk,
    input            i_read,
    input            i_stop,
    input            i_sda,
    input      [7:1] i_address,
    input      [8:1] i_txdata,
    output     [8:1] i_rxdata,
    output           o_scl,
    output reg       o_busy,
    output reg       o_sda

);

  reg    a_ack;
  reg    d_ack;
  reg    stop_bit;
  reg [2:0] a_cycle;
  reg [3:0] x_cycle;
  reg [8:1] r_txdata;
  reg [8:1] r_rxdata;
  reg [7:1] r_i_address;
  reg [2:0] state;

  parameter	IDLE	= 3'b000,
						ADDR	= 3'b001,
						MODR 	= 3'b010,
						AACK 	= 3'b011,
						READ	= 3'b100,
						WRTE 	= 3'b101,
						FINL	= 3'b110;

  initial begin
    o_sda       <= 1'b0;
    o_busy      <= 1'b0;
    a_ack       <= 1'b0;
    d_ack       <= 'b0;
    stop_bit    <= 'b0;
    a_cycle     <= 3'b111;
    x_cycle     <= 'd8;
    r_txdata    <= 8'd0;
    r_rxdata    <= 8'd0;
    r_i_address <= 7'b0;
    state       <= 3'b0;
  end

  // State Machine
  //==============

  [MASKED]

  // Controller clock

  assign o_scl = i_cclk;
  assign i_rxdata = r_rxdata;

endmodule

