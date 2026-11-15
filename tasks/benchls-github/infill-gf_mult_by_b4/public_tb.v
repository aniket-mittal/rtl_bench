// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_b4 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h8f;
    stim[1] = 8'hc5;
    stim[2] = 8'hc9;
    stim[3] = 8'hb6;
    stim[4] = 8'h54;
    stim[5] = 8'h21;
    stim[6] = 8'h55;
    stim[7] = 8'he1;
    stim[8] = 8'h7d;
    stim[9] = 8'hbc;
    stim[10] = 8'hd6;
    stim[11] = 8'h56;
    stim[12] = 8'h61;
    stim[13] = 8'h92;
    stim[14] = 8'h07;
    stim[15] = 8'h31;
    stim[16] = 8'h50;
    stim[17] = 8'h3b;
    stim[18] = 8'h7d;
    stim[19] = 8'h5e;
    stim[20] = 8'h70;
    stim[21] = 8'h00;
    stim[22] = 8'h5a;
    stim[23] = 8'h78;
    stim[24] = 8'hba;
    stim[25] = 8'h77;
    stim[26] = 8'h10;
    stim[27] = 8'h25;
    stim[28] = 8'hd5;
    stim[29] = 8'ha6;
    stim[30] = 8'hbc;
    stim[31] = 8'h16;
    stim[32] = 8'hc2;
    stim[33] = 8'hf2;
    stim[34] = 8'h7f;
    stim[35] = 8'h44;
    stim[36] = 8'h8f;
    stim[37] = 8'h51;
    stim[38] = 8'h2f;
    stim[39] = 8'h3f;
    stim[40] = 8'h9e;
    stim[41] = 8'h96;
    stim[42] = 8'h68;
    stim[43] = 8'h00;
    stim[44] = 8'h8c;
    stim[45] = 8'hc9;
    stim[46] = 8'ha0;
    stim[47] = 8'h2f;
    stim[48] = 8'h29;
    stim[49] = 8'hf6;
    stim[50] = 8'h0e;
    stim[51] = 8'h5c;
    stim[52] = 8'h1d;
    stim[53] = 8'h15;
    stim[54] = 8'h3a;
    stim[55] = 8'hfb;
    stim[56] = 8'h82;
    stim[57] = 8'hf2;
    stim[58] = 8'h16;
    stim[59] = 8'hf6;
    stim[60] = 8'h71;
    stim[61] = 8'h22;
    stim[62] = 8'h0d;
    stim[63] = 8'h3e;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'hee;
      expv[1] = 8'h54;
      expv[2] = 8'h77;
      expv[3] = 8'h1f;
      expv[4] = 8'h63;
      expv[5] = 8'hb7;
      expv[6] = 8'hd7;
      expv[7] = 8'hbd;
      expv[8] = 8'h1d;
      expv[9] = 8'ha3;
      expv[10] = 8'h1a;
      expv[11] = 8'h16;
      expv[12] = 8'hb1;
      expv[13] = 8'hf6;
      expv[14] = 8'h2b;
      expv[15] = 8'h38;
      expv[16] = 8'h89;
      expv[17] = 8'h84;
      expv[18] = 8'h1d;
      expv[19] = 8'hdf;
      expv[20] = 8'h8a;
      expv[21] = 8'h00;
      expv[22] = 8'h35;
      expv[23] = 8'h43;
      expv[24] = 8'h3c;
      expv[25] = 8'ha1;
      expv[26] = 8'h8f;
      expv[27] = 8'h5d;
      expv[28] = 8'hdb;
      expv[29] = 8'h90;
      expv[30] = 8'ha3;
      expv[31] = 8'h10;
      expv[32] = 8'h7f;
      expv[33] = 8'hf3;
      expv[34] = 8'h68;
      expv[35] = 8'hec;
      expv[36] = 8'hee;
      expv[37] = 8'h3d;
      expv[38] = 8'he1;
      expv[39] = 8'h6e;
      expv[40] = 8'hd5;
      expv[41] = 8'h1c;
      expv[42] = 8'hcc;
      expv[43] = 8'h00;
      expv[44] = 8'h2f;
      expv[45] = 8'h77;
      expv[46] = 8'h0f;
      expv[47] = 8'he1;
      expv[48] = 8'h7e;
      expv[49] = 8'h19;
      expv[50] = 8'h56;
      expv[51] = 8'haa;
      expv[52] = 8'h18;
      expv[53] = 8'hd1;
      expv[54] = 8'h30;
      expv[55] = 8'h8e;
      expv[56] = 8'h79;
      expv[57] = 8'hf3;
      expv[58] = 8'h10;
      expv[59] = 8'h19;
      expv[60] = 8'h3e;
      expv[61] = 8'h76;
      expv[62] = 8'h97;
      expv[63] = 8'hda;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
