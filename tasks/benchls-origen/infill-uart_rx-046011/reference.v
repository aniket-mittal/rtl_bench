module origen_046011
  #(parameter CLKS_PER_BIT = 217)
  (
   input        i_clk,
   input        i_rx_serial,
   output       o_rx_dv,
   output [7:0] o_rx_byte
   );
    
  parameter STATE_IDLE     = 3'b000;
  parameter STATE_STARTBIT = 3'b001;
  parameter STATE_DATABITS = 3'b010;
  parameter STATE_STOPBIT  = 3'b011;
  parameter STATE_CLEANUP  = 3'b100;
   
  reg           r_rx_data_r = 1'b1;
  reg           r_rx_data   = 1'b1;
   
  reg [7:0]     r_counter   = 0;
  reg [2:0]     r_bit_index = 0;
  reg [7:0]     r_rx_byte   = 0;
  reg           r_rx_dv     = 0;
  reg [2:0]     r_state     = STATE_IDLE;
   
  always @(posedge i_clk)
    begin
      r_rx_data_r <= i_rx_serial;
      r_rx_data   <= r_rx_data_r;
    end
   
  always @(posedge i_clk)
    begin
      case (r_state)
        STATE_IDLE :
          begin
            r_rx_dv     <= 1'b0;
            r_counter   <= 0;
            r_bit_index <= 0;
             
            if (r_rx_data == 1'b0)
              r_state <= STATE_STARTBIT;
            else
              r_state <= STATE_IDLE;
          end
         
        STATE_STARTBIT :
          begin
            if (r_counter == (CLKS_PER_BIT-1)/2)
              begin
                if (r_rx_data == 1'b0)
                  begin
                    r_counter <= 0;
                    r_state   <= STATE_DATABITS;
                  end
                else
                  r_state <= STATE_IDLE;
              end
            else
              begin
                r_counter <= r_counter + 1;
                r_state   <= STATE_STARTBIT;
              end
          end
         
        STATE_DATABITS :
          begin
            if (r_counter < CLKS_PER_BIT-1)
              begin
                r_counter <= r_counter + 1;
                r_state   <= STATE_DATABITS;
              end
            else
              begin
                r_counter <= 0;
                r_rx_byte[r_bit_index] <= r_rx_data;
                 
                if (r_bit_index < 7)
                  begin
                    r_bit_index <= r_bit_index + 1;
                    r_state     <= STATE_DATABITS;
                  end
                else
                  begin
                    r_bit_index <= 0;
                    r_state     <= STATE_STOPBIT;
                  end
              end
          end
    
        STATE_STOPBIT :
          begin
            if (r_counter < CLKS_PER_BIT-1)
              begin
                r_counter <= r_counter + 1;
                r_state   <= STATE_STOPBIT;
              end
            else
              begin
                r_rx_dv     <= 1'b1;
                r_counter   <= 0;
                r_state     <= STATE_CLEANUP;
              end
          end
    
        STATE_CLEANUP :
          begin
            r_state <= STATE_IDLE;
            r_rx_dv <= 1'b0;
          end
         
        default :
          r_state <= STATE_IDLE;
         
      endcase
    end   
   
  assign o_rx_dv   = r_rx_dv;
  assign o_rx_byte = r_rx_byte;
   
endmodule