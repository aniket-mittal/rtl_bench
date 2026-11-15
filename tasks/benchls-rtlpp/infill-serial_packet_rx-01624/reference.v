module rtlpp_01624
(
  input  wire         clk,
  input  wire         reset,
  input  wire [3:0]   rx_in_d,
  input  wire         rx_in_rdy,
  input  wire [3:0]   pi_mosi_d,
  input  wire         pi_mosi_rdy,
  output wire [7:0]   rx_out_d,
  output wire         rx_out_rdy,
  output wire [7:0]   rx_loc_d,
  output wire         rx_loc_rdy,
  output wire         rx_loc_start,
  output wire         rx_loc_stop
); 

  reg           lbracket_jk;
  reg           passthru_jk;
  reg           broadcst_jk;
  reg           payload_jk;
  reg           process_jk;

  reg           packet_jk;
  reg           packet_jk_p1;
  reg [7:0]     byte_sr;
  reg           byte_pingpong;
  reg           rx_in_rdy_p1;
  reg           byte_rdy;
  reg           byte_rdy_p1;
  reg [3:0]     byte_cnt;
  reg [7:0]     byte_loc;
  reg [7:0]     byte_out;
  reg [7:0]     payload_cnt;
  reg           packet_done;

  reg           loc_start;
  reg [7:0]     loc_slot;
  reg [3:0]     loc_subslot;
  reg [3:0]     loc_command;
  reg [7:0]     loc_payload;

  assign rx_out_d     = byte_out[7:0];
  assign rx_out_rdy   = byte_rdy_p1;
  assign rx_loc_d     = byte_loc[7:0];
  assign rx_loc_rdy   = byte_rdy_p1;
  assign rx_loc_start = loc_start;
  assign rx_loc_stop  = packet_done;

  always @ ( posedge clk ) begin : proc_nib_in 
    rx_in_rdy_p1  <= rx_in_rdy | pi_mosi_rdy;
    if ( rx_in_rdy == 1 ) begin
      byte_sr[7:4]  <= byte_sr[3:0];
      byte_sr[3:0]  <= rx_in_d[3:0];
      byte_pingpong <= ~ byte_pingpong;
    end

    if ( pi_mosi_rdy == 1 ) begin
      byte_sr[7:4]  <= byte_sr[3:0];
      byte_sr[3:0]  <= pi_mosi_d[3:0];
      byte_pingpong <= ~ byte_pingpong;
    end

    if ( packet_jk == 0 ) begin
      byte_pingpong <= 0;
    end
    if ( reset == 1 ) begin
      byte_sr[7:0]  <= 8'hFF;
    end
  end

  always @ ( posedge clk ) begin : proc_byte_in 
    byte_rdy     <= 0;
    packet_jk_p1 <= packet_jk;

    if ( rx_in_rdy_p1 == 1 ) begin
      if ( byte_sr == 8'hF0 && packet_jk == 0 ) begin
        packet_jk <= 1;
        byte_rdy  <= 1;
      end
      if ( packet_jk == 1 && byte_pingpong == 0 ) begin
        byte_rdy <= 1;
      end
    end

    if ( reset == 1 || packet_done == 1 ) begin
      packet_jk <= 0;
    end
  end 

  always @ ( posedge clk ) begin : proc_header
    byte_rdy_p1 <= byte_rdy;
    packet_done <= 0;
    loc_start   <= 0;
    if ( byte_rdy == 1 ) begin
      if ( byte_cnt != 4'h4 ) begin
        byte_cnt <= byte_cnt + 1;
      end
      if ( byte_cnt == 4'h3 ) begin
        payload_cnt <= byte_sr[7:0];
        if ( byte_sr == 8'd0 ) begin
          packet_done <= 1;
        end
      end
      if ( byte_cnt == 4'h4 ) begin
        payload_cnt <= payload_cnt - 1;
      end
      if ( byte_cnt == 4'h4 && payload_cnt == 8'd1 ) begin
        packet_done <= 1;
      end

      if ( byte_cnt == 4'h0 ) begin
        loc_start <= 1;
      end
      if ( byte_cnt == 4'h1 ) begin
        loc_slot <= byte_sr[7:0];
      end
      if ( byte_cnt == 4'h2 ) begin
        loc_subslot <= byte_sr[7:4];
        loc_command <= byte_sr[3:0];
      end
      if ( byte_cnt == 4'h3 ) begin
        loc_payload <= byte_sr[7:0];
      end

      if ( byte_cnt == 4'h1 ) begin
        if ( byte_sr == 8'hFF || byte_sr == 8'hFE ) begin
          byte_loc <= byte_sr[7:0];
          byte_out <= byte_sr[7:0];
        end else if ( byte_sr != 8'h00 ) begin
          byte_loc <= 8'hFE;
          byte_out <= byte_sr[7:0] - 1;
        end else begin
          byte_loc <= byte_sr[7:0];
          byte_out <= 8'hFE;       
        end
      end else begin
        byte_loc <= byte_sr[7:0];
        byte_out <= byte_sr[7:0];
      end
    end 

    if ( packet_jk == 0 ) begin
      byte_cnt    <= 4'd0;
      payload_cnt <= 8'd0;
    end
  end 

endmodule