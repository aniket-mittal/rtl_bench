module autovcoder_004984 (

    // Interface: clk
    input            clk,
    input            reset_n,
    // Interface: ST in
    output reg       in_ready,
    input            in_valid,
    input      [7:0] in_data,

    // Interface: ST out 
    input            out_ready,
    output reg       out_valid,
    output reg [7:0] out_data
);

  // ---------------------------------------------------------------------
  //| Signal Declarations
  // ---------------------------------------------------------------------

  reg received_esc;
  wire escape_char, idle_char;

  // ---------------------------------------------------------------------
  //| Thingofamagick
  // ---------------------------------------------------------------------

  assign idle_char   = (in_data == 8'h4a);
  assign escape_char = (in_data == 8'h4d);

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      received_esc <= 0;
    end else begin
      if (in_valid & out_ready) begin
        if ((idle_char | escape_char) & ~received_esc & out_ready) begin
          received_esc <= 1;
        end else begin
          received_esc <= 0;
        end
      end
    end
  end

  [MASKED]
endmodule

