module autovcoder_092972 (
    input  wire       clock,
    input  wire       reset,
    input  wire [3:0] high,        // IOCPU, prescaleregister
    input  wire [3:0] low,         // IOCPU, prescaleregister
    output reg        Prescale_EN  // DW 2005.06.21 Prescale Enable
);

  //tmrg default triplicate
  //tmrg tmr_error false

  reg  [3:0] lo_count;
  reg  [3:0] hi_count;
  reg        hilo;
  // int_high, int_low entfallen, conversion entfaellt

  wire [3:0] lo_countVoted = lo_count;
  wire [3:0] hi_countVoted = hi_count;
  wire [3:0] hiloVoted = hilo;


  always @(posedge clock, negedge reset) begin
    if (reset == 1'b0) begin
      lo_count    <= 4'b0000;
      hi_count    <= 4'b0000;
      hilo        <= 1'b1;
      Prescale_EN <= 1'b0;
    end else begin
      lo_count <= lo_countVoted;
      hi_count <= hi_countVoted;
      hilo     <= hiloVoted;
      if (hiloVoted == 1'b1) begin
        Prescale_EN <= 1'b0;
        if (hi_countVoted == high) begin
          hi_count <= 4'b0000;
          hilo     <= 1'b0;
        end else hi_count <= hi_countVoted + 1;
        //  hilo     <= 1'b1;
      end else begin
        if (lo_countVoted == low) begin
          Prescale_EN <= 1'b1;
          lo_count    <= 4'b0000;
          hilo        <= 1'b1;
        end else begin
          Prescale_EN <= 1'b0;
          lo_count    <= lo_countVoted + 1;
          //              hilo        <= 1'b0;
        end
      end
    end
  end
endmodule

