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
          
always @(posedge clk or negedge reset_n) begin
          if (!reset_n) begin
                fifo_data_buffer  <=  'b0;
                out_startofpacket <= 1'b0;
                out_endofpacket   <= 1'b0;
                out_valid         <= 1'b0;
                out_data          <=  'b0;
                state             <=  'b0;
                fifo_read         <= 1'b0;
                current_byte      <=  'b0;
                byte_end          <=  'b0;
                first_trans       <= 1'b0;
                last_trans        <= 1'b0;
                sent_all          <= 1'b1;
          end else begin
                if (out_ready) begin
                  out_startofpacket <= 1'b0;
                  out_endofpacket   <= 1'b0;
                end
                
                case (state)
                  POP_FIFO : begin
                            if (out_ready) begin
                                out_startofpacket   <= 1'b0;
                                out_endofpacket     <= 1'b0;
                                out_valid           <= 1'b0;
                                first_trans         <= 1'b0;
                                last_trans          <= 1'b0;
                                byte_end            <=  'b0;
                                fifo_read           <= 1'b0;
                                sent_all            <= 1'b1;
                            end
                            // start poping fifo after all data sent and data available
                            if (enable) begin   
                                fifo_read       <= 1'b1;
                                out_valid       <= 1'b0;
                                state           <= POP_FIFO_WAIT;
                            end
                  end
                  POP_FIFO_WAIT : begin
                  //fifo latency of 1
                                fifo_read               <= 1'b0;
                                state                   <= FIFO_DATA_WAIT;
                  end
                  FIFO_DATA_WAIT : begin
                                sent_all                <= 1'b0;
                                first_trans             <= fifo_readdata[35];
                                last_trans              <= fifo_readdata[34];
                                out_data                <= fifo_readdata[7:0];
                                fifo_data_buffer        <= fifo_readdata[31:8];
                                byte_end                <= fifo_readdata[33:32];
                                current_byte            <= 1'b1;
                                out_valid               <= 1'b1;
                                
                                // first byte sop eop handling
                                if (fifo_readdata[35] & fifo_readdata[34] & (fifo_readdata[33:32] == 0)) begin
                                    first_trans         <= 1'b0;
                                    last_trans          <= 1'b0;
                                    out_startofpacket   <= 1'b1;
                                    out_endofpacket     <= 1'b1;
                                    state <= POP_FIFO;
                                end else if (fifo_readdata[35] & (fifo_readdata[33:32] == 0)) begin
                                    first_trans         <= 1'b0;
                                    out_startofpacket   <= 1'b1;
                                    state               <= POP_FIFO;
                                end else if (fifo_readdata[35]) begin
                                   first_trans          <= 1'b0;
                                   out_startofpacket    <= 1'b1;
                                   state <= READ_SEND_ISSUE;
                                end else if (fifo_readdata[34] & (fifo_readdata[33:32] == 0)) begin
                                    last_trans          <= 1'b0;
                                    out_endofpacket     <= 1'b1;
                                    state               <= POP_FIFO;
                                end else begin
                                    state               <= READ_SEND_ISSUE;
                                end
                                
                  end
                  READ_SEND_ISSUE : begin
                            out_valid         <= 1'b1;
                            sent_all          <= 1'b0;
                            
                            if (out_ready) begin
                                out_startofpacket <= 1'b0;
                                // last byte
                                if (last_trans & (current_byte == byte_end)) begin
                                        last_trans      <= 1'b0;
                                        out_endofpacket <= 1'b1;
                                        state           <= POP_FIFO;
                                end
                                case (current_byte)
                                       3: begin
                                          out_data <= fifo_data_buffer[23:16];
                                       end
                                       2: begin
                                          out_data <= fifo_data_buffer[15:8];
                                       end
                                       1: begin
                                          out_data <= fifo_data_buffer[7:0];
                                       end
                                       default: begin
                                          //out_data        <= fifo_readdata[7:0];
                                       end
                                endcase
                                current_byte <= current_byte + 1'b1;
                                if (current_byte == byte_end) begin
                                    state <= POP_FIFO;
                                end else begin
                                    state <= READ_SEND_ISSUE;
                                end
                            end
                  end
                endcase
          end
    end
endmodule