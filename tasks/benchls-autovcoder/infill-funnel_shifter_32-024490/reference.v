module autovcoder_024490 (
    lsf_out,
    hi,
    lo,
    lsa
);

  output [31:0] lsf_out;
  input [31:0] hi;
  input [31:1] lo;
  input [4:0] lsa;

  /* Logic
assign lsf[62:0] = {hi[31:0],lo[31:1]} << lsa[4:0] ;
assign lsf_out[31:0] = lsf[62:31];
*/

  // The following module has indentical functionality as above assignment.
  // It should be used in circuit design. 
  // Only lvl_0[46:16] portion is two loads to inputs and the other two portions
  // has one loading to previous stage.
  // If inverting mux provides better timing and area than non_inverting one,the 
  // inverting type mux should be used, and a row of inverting output buffer 
  // should be provided. 
  // Total of 47+39+35+33+32 = 186 2:1 muxs.
  // Implementation tips: lev_1 through lev_5 indicates 5-level of two_to_one mux 
  // structure which can be implemented differently by using 4:1 or even 8:1 mux 
  // if over all area and timing can be improved. Circuit group have the  
  // flexibility to implemente it differently. Adequate buffering should be 
  // provided on lsa pins, especially on rsa[4] and rsa[3] pins.

  wire [62:0] lvl_0;  // level 0 wiring.
  wire [46:0] lvl_1;  // level_1 47-bit 2:1 mux output
  wire [38:0] lvl_2;  // level_2 39-bit 2:1 mux output
  wire [34:0] lvl_3;  // level_3 35-bit 2:1 mux output
  wire [32:0] lvl_4;  // level_4 33-bit 2:1 mux output
  wire [31:0] lvl_5;  // level_5 32-bit 2:1 mux output
  wire [ 4:0] mux_sel;  // internal buffering;

  assign mux_sel[4:0] = ~lsa[4:0];  // inverting & buffering once for left shift.

  // wiring lvl_0.
  assign lvl_0[62:0] = {hi[31:0], lo[31:1]};
  assign lvl_1 = ~((mux_sel[4]) ? (lvl_0[62:16]) : (lvl_0[46:0]));
  assign lvl_2 = ~((mux_sel[3]) ? (lvl_1[46:8]) : (lvl_1[38:0]));
  assign lvl_3 = ~((mux_sel[2]) ? (lvl_2[38:4]) : (lvl_2[34:0]));
  assign lvl_4 = ~((mux_sel[1]) ? (lvl_3[34:2]) : (lvl_3[32:0]));
  assign lvl_5 = ~((mux_sel[0]) ? (lvl_4[32:1]) : (lvl_4[31:0]));
  assign lsf_out[31:0] = ~lvl_5;

endmodule

