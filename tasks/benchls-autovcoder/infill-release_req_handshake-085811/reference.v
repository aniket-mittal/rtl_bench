module autovcoder_085811 (
    input      clk,
    input      reset_,
    input      release_req,       // from TL Logic 	(Event)
    input      release_ack_rcvd,  // from TL Logic 	(Pulse)
    output reg release_req_ack    // to TL Logic		(Pulse)
);

  // FSM - State Machine states
  localparam RLS_IDLE = 3'h1;
  localparam RLS_ACK_WT = 3'h2;
  localparam RLS_DONE = 3'h4;

  reg  [2:0] rls_state;

  wire       rls_idle_st = rls_state[0];
  wire       rls_ack_wt_st = rls_state[1];
  wire       rls_done_st = rls_state[2];

  // SM assignment
  always @(posedge clk) begin
    if (!reset_) begin
      rls_state <= RLS_IDLE;
    end else begin
      if (rls_idle_st) begin
        rls_state <= release_req ? RLS_ACK_WT : RLS_IDLE;
      end
      if (rls_ack_wt_st) begin
        rls_state <= release_ack_rcvd ? RLS_DONE : RLS_ACK_WT;
      end
      if (rls_done_st) begin
        rls_state <= RLS_IDLE;
      end
    end
  end


  always @(posedge clk) begin
    if (!reset_) begin
      release_req_ack <= 1'b0;

    end else begin
      release_req_ack <= rls_idle_st & release_req ? 1'b1 : 1'b0;
    end
  end

  //synopsys translate_off
  reg [16*8-1:0] ascii_rls_state;

  always @(rls_state) begin
    case (rls_state)
      RLS_IDLE  :  ascii_rls_state = "RLS_IDLE"  ;
      RLS_ACK_WT  : ascii_rls_state = "RLS_ACK_WT"  ;
      RLS_DONE  : ascii_rls_state = "RLS_DONE"  ;
      default   : ascii_rls_state = "Unknown"   ;
    endcase
  end

  //synopsys translate_on


endmodule

