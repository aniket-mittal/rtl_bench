module fifo_to_packet (

      // Interface: clk
      input              clk,
      input              reset_n,

      // Interface: ST out
      input              out_ready,
      output reg         out_valid,
      output reg [ 7: 0] out_data,
      output reg         out_startofpacket,
      output reg         out_endofpacket,

      // Interface: FIFO in
      input  [ 35: 0]    fifo_readdata,
      output reg         fifo_read,
      input              fifo_empty 
);

reg [ 1: 0]     state;
reg             enable, sent_all;
reg [ 1: 0]     current_byte, byte_end;
reg             first_trans, last_trans;
reg [ 23:0]     fifo_data_buffer;

localparam    POP_FIFO        = 2'b00,
              POP_FIFO_WAIT   = 2'b01,
              FIFO_DATA_WAIT  = 2'b10,
              READ_SEND_ISSUE = 2'b11;

always @* begin
      enable = (!fifo_empty & sent_all);
end
          
[MASKED]
endmodule