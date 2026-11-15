module mg_07679 ( clk, preset, d, q );
input clk; 
  input preset; 
  input d; 
  output q; 
  (* register_duplication = "no" *) 
  (* shreg_extract = "no" *) 
  (* equivalent_register_removal = "no" *) 
  (* S = "TRUE" *) 
  (* KEEP = "TRUE" *) 
  reg q; 
  reg c_q; 
  (* register_duplication = "no" *) 
  (* shreg_extract = "no" *) 
  (* equivalent_register_removal = "no" *) 
  (* S = "TRUE" *) 
  (* KEEP = "TRUE" *) 
  reg meta1; 
 `ifdef RANDOM_INIT 
  reg c_meta2; 
  reg meta2; 
 `endif 
 `ifdef RANDOM_INIT 
  reg [31:0] seed; 
  initial 
  begin 
  $random_init("q", "meta1", "meta2"); 
  $random_value("seed"); 
  end 
 `endif 
 always @ (meta1`ifdef RANDOM_INITor d or meta2`endif) begin 
  c_q = meta1; 
 `ifdef RANDOM_INIT 
  c_meta2 = (d ^ meta1) & $random(seed); 
  c_q = c_meta2 | ((meta1 ^ meta2) & $random(seed)) | 
  (d & meta1 & meta2); 
  c_meta2 = c_meta2 | (d & meta1); 
 `endif 
  end 
  [MASKED] 
 endmodule