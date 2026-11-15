module autovcoder_079665 (
    pixel_in,
    predic_in,
    end_in,
    rst,
    clk,
    val_out,
    \val_out$1 ,
    valid_out,
    end_out,
    valid_in
);
  wire [12:0] \$2 ;
  wire [13:0] \$4 ;
  wire [12:0] \$5 ;
  wire [13:0] \$7 ;
  (* src = "difference.py:72" *)
  reg \$next\end_out ;
  (* src = "difference.py:61" *)
  reg [12:0] \$next\val_out ;
  (* src = "difference.py:64" *)
  reg [12:0] \$next\val_out$1 ;
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
  (* src = "difference.py:58" *)
  input [11:0] predic_in;
  (* src = "clk_domains.py:5" *)
  input rst;
  (* init = 13'h0000 *) (* src = "difference.py:61" *)
  output [12:0] val_out;
  reg [12:0] val_out = 13'h0000;
  (* init = 13'h0000 *) (* src = "difference.py:64" *)
  output [12:0] \val_out$1 ;
  reg [12:0] \val_out$1 = 13'h0000;
  (* src = "difference.py:67" *)
  input valid_in;
  (* init = 1'h0 *) (* src = "difference.py:68" *)
  output valid_out;
  reg valid_out = 1'h0;
  assign \$2 = pixel_in - (* src = "difference.py:89" *) predic_in;
  assign \$5 = pixel_in - (* src = "difference.py:90" *) predic_in;
  assign \$7 = \$5 - (* src = "difference.py:90" *) 1'h1;
  always @(posedge clk) end_out <= \$next\end_out ;
  always @(posedge clk) valid_out <= \$next\valid_out ;
  always @(posedge clk) \val_out$1 <= \$next\val_out$1 ;
  always @(posedge clk) val_out <= \$next\val_out ;
  always @* begin
    \$next\val_out = val_out;
    casez (valid_in)
      1'h1: \$next\val_out = \$2 ;
    endcase
    casez (rst)
      1'h1: \$next\val_out = 13'h0000;
    endcase
  end
  always @* begin
    \$next\val_out$1 = \val_out$1 ;
    casez (valid_in)
      1'h1: \$next\val_out$1 = \$4 [12:0];
    endcase
    casez (rst)
      1'h1: \$next\val_out$1 = 13'h0000;
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
  assign \$4 = \$7 ;
endmodule

