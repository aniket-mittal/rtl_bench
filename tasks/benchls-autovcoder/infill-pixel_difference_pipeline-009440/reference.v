module autovcoder_009440 (
    pixel_in,
    predic_in,
    \pixel_in$1 ,
    \predic_in$2 ,
    end_in,
    rst,
    clk,
    val_out,
    \val_out$3 ,
    \val_out$4 ,
    \val_out$5 ,
    valid_out,
    end_out,
    valid_in
);
  wire [13:0] \$10 ;
  wire [12:0] \$11 ;
  wire [13:0] \$13 ;
  wire [13:0] \$15 ;
  wire [12:0] \$16 ;
  wire [13:0] \$18 ;
  wire [12:0] \$6 ;
  wire [12:0] \$8 ;
  (* src = "difference.py:72" *)
  reg \$next\end_out ;
  (* src = "difference.py:61" *)
  reg [12:0] \$next\val_out ;
  (* src = "difference.py:61" *)
  reg [12:0] \$next\val_out$3 ;
  (* src = "difference.py:64" *)
  reg [12:0] \$next\val_out$4 ;
  (* src = "difference.py:64" *)
  reg [12:0] \$next\val_out$5 ;
  (* src = "difference.py:68" *)
  reg \$next\valid_out ;
  (* src = "nmigen/hdl/mem.py:97" *)
  input clk;
  (* src = "difference.py:71" *)
  input end_in;
  (* init = 1'h0 *) (* src = "difference.py:72" *)
  output end_out;
  reg end_out = 1'h0;
  (* src = "difference.py:55" *)
  input [11:0] pixel_in;
  (* src = "difference.py:55" *)
  input [11:0] \pixel_in$1 ;
  (* src = "difference.py:58" *)
  input [11:0] predic_in;
  (* src = "difference.py:58" *)
  input [11:0] \predic_in$2 ;
  (* src = "clk_domains.py:5" *)
  input rst;
  (* init = 13'h0000 *) (* src = "difference.py:61" *)
  output [12:0] val_out;
  reg [12:0] val_out = 13'h0000;
  (* init = 13'h0000 *) (* src = "difference.py:61" *)
  output [12:0] \val_out$3 ;
  reg [12:0] \val_out$3 = 13'h0000;
  (* init = 13'h0000 *) (* src = "difference.py:64" *)
  output [12:0] \val_out$4 ;
  reg [12:0] \val_out$4 = 13'h0000;
  (* init = 13'h0000 *) (* src = "difference.py:64" *)
  output [12:0] \val_out$5 ;
  reg [12:0] \val_out$5 = 13'h0000;
  (* src = "difference.py:67" *)
  input valid_in;
  (* init = 1'h0 *) (* src = "difference.py:68" *)
  output valid_out;
  reg valid_out = 1'h0;
  assign \$11 = pixel_in - (* src = "difference.py:90" *) predic_in;
  assign \$13 = \$11 - (* src = "difference.py:90" *) 1'h1;
  assign \$16 = \pixel_in$1 - (* src = "difference.py:90" *) \predic_in$2 ;
  assign \$18 = \$16 - (* src = "difference.py:90" *) 1'h1;
  assign \$6  = pixel_in - (* src = "difference.py:89" *) predic_in;
  assign \$8  = \pixel_in$1 - (* src = "difference.py:89" *) \predic_in$2 ;
  always @(posedge clk) end_out <= \$next\end_out ;
  always @(posedge clk) valid_out <= \$next\valid_out ;
  always @(posedge clk) \val_out$5 <= \$next\val_out$5 ;
  always @(posedge clk) \val_out$4 <= \$next\val_out$4 ;
  always @(posedge clk) \val_out$3 <= \$next\val_out$3 ;
  always @(posedge clk) val_out <= \$next\val_out ;
  always @* begin
    \$next\val_out = val_out;
    casez (valid_in)
      1'h1: \$next\val_out = \$6 ;
    endcase
    casez (rst)
      1'h1: \$next\val_out = 13'h0000;
    endcase
  end
  always @* begin
    \$next\val_out$3 = \val_out$3 ;
    casez (valid_in)
      1'h1: \$next\val_out$3 = \$8 ;
    endcase
    casez (rst)
      1'h1: \$next\val_out$3 = 13'h0000;
    endcase
  end
  always @* begin
    \$next\val_out$4 = \val_out$4 ;
    casez (valid_in)
      1'h1: \$next\val_out$4 = \$10 [12:0];
    endcase
    casez (rst)
      1'h1: \$next\val_out$4 = 13'h0000;
    endcase
  end
  always @* begin
    \$next\val_out$5 = \val_out$5 ;
    casez (valid_in)
      1'h1: \$next\val_out$5 = \$15 [12:0];
    endcase
    casez (rst)
      1'h1: \$next\val_out$5 = 13'h0000;
    endcase
  end
  always @* begin
    \$next\valid_out = valid_out;
    \$next\valid_out = valid_in;
    casez (rst)
      1'h1: \$next\valid_out = 1'h0;
    endcase
  end
  always @* begin
    \$next\end_out = end_out;
    \$next\end_out = end_in;
    casez (rst)
      1'h1: \$next\end_out = 1'h0;
    endcase
  end
  assign \$10 = \$13 ;
  assign \$15 = \$18 ;
endmodule

