// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11164 dut (
    .clk(clk),
    .DIN(in_vec[23:0]),
    .DOUT(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h0b9d66;
    stim[1] = 24'hfe40fd;
    stim[2] = 24'h916218;
    stim[3] = 24'h8043b0;
    stim[4] = 24'h3a2a84;
    stim[5] = 24'hbaba0d;
    stim[6] = 24'h134842;
    stim[7] = 24'h6f2802;
    stim[8] = 24'h0457f9;
    stim[9] = 24'h14523b;
    stim[10] = 24'h345e1f;
    stim[11] = 24'h489004;
    stim[12] = 24'h6c5aa5;
    stim[13] = 24'hce164d;
    stim[14] = 24'h9962e4;
    stim[15] = 24'h6f8a64;
    stim[16] = 24'hc27553;
    stim[17] = 24'h453f58;
    stim[18] = 24'h3cbc56;
    stim[19] = 24'h0bb963;
    stim[20] = 24'h08dd6e;
    stim[21] = 24'h503c1b;
    stim[22] = 24'haafa9f;
    stim[23] = 24'hc6e029;
    stim[24] = 24'h250207;
    stim[25] = 24'h328631;
    stim[26] = 24'h87acf9;
    stim[27] = 24'h4b7aa2;
    stim[28] = 24'haa25b3;
    stim[29] = 24'hb74882;
    stim[30] = 24'h801151;
    stim[31] = 24'h370ce1;
    stim[32] = 24'hcf3304;
    stim[33] = 24'h4bf4ca;
    stim[34] = 24'h1cda4d;
    stim[35] = 24'h9fd267;
    stim[36] = 24'h5833fd;
    stim[37] = 24'h1ea004;
    stim[38] = 24'hebbdb3;
    stim[39] = 24'h8902fb;
    stim[40] = 24'h037f51;
    stim[41] = 24'hf2da8b;
    stim[42] = 24'h74709c;
    stim[43] = 24'h708747;
    stim[44] = 24'h4b67a6;
    stim[45] = 24'ha23362;
    stim[46] = 24'h2424f6;
    stim[47] = 24'h2b841d;
    stim[48] = 24'h8bf238;
    stim[49] = 24'hd07cb7;
    stim[50] = 24'h8518e0;
    stim[51] = 24'h7f69d1;
    stim[52] = 24'hedabe8;
    stim[53] = 24'h6f54b0;
    stim[54] = 24'hd87ebf;
    stim[55] = 24'h29251e;
    stim[56] = 24'h474444;
    stim[57] = 24'h80034d;
    stim[58] = 24'h507ce2;
    stim[59] = 24'h53bf68;
    stim[60] = 24'h4ff061;
    stim[61] = 24'h8d177b;
    stim[62] = 24'hb85900;
    stim[63] = 24'ha5bbe0;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hb86;
      expv[4] = 12'hffd;
      expv[5] = 12'hf2c;
      expv[6] = 12'hf00;
      expv[7] = 12'hddc;
      expv[8] = 12'hf8a;
      expv[9] = 12'hc44;
      expv[10] = 12'hecb;
      expv[11] = 12'ha1c;
      expv[12] = 12'hc57;
      expv[13] = 12'hdb3;
      expv[14] = 12'he2c;
      expv[15] = 12'hec1;
      expv[16] = 12'hfb0;
      expv[17] = 12'hf3f;
      expv[18] = 12'hecb;
      expv[19] = 12'hf9a;
      expv[20] = 12'he1c;
      expv[21] = 12'hdeb;
      expv[22] = 12'hb8a;
      expv[23] = 12'hb21;
      expv[24] = 12'he52;
      expv[25] = 12'hf69;
      expv[26] = 12'hfa1;
      expv[27] = 12'hd36;
      expv[28] = 12'hda9;
      expv[29] = 12'hf11;
      expv[30] = 12'he3b;
      expv[31] = 12'hf69;
      expv[32] = 12'hf82;
      expv[33] = 12'hf00;
      expv[34] = 12'hdc8;
      expv[35] = 12'hfb0;
      expv[36] = 12'he3b;
      expv[37] = 12'hcd8;
      expv[38] = 12'hf4e;
      expv[39] = 12'he76;
      expv[40] = 12'hcee;
      expv[41] = 12'hfdf;
      expv[42] = 12'hf16;
      expv[43] = 12'h9cb;
      expv[44] = 12'hfeb;
      expv[45] = 12'hedc;
      expv[46] = 12'hecf;
      expv[47] = 12'he3b;
      expv[48] = 12'hf57;
      expv[49] = 12'hd2c;
      expv[50] = 12'hd71;
      expv[51] = 12'hf1c;
      expv[52] = 12'hfb3;
      expv[53] = 12'hf0b;
      expv[54] = 12'hefd;
      expv[55] = 12'hfe2;
      expv[56] = 12'hecb;
      expv[57] = 12'hfc1;
      expv[58] = 12'hd5c;
      expv[59] = 12'he26;
      expv[60] = 12'hf00;
      expv[61] = 12'he52;
      expv[62] = 12'he60;
      expv[63] = 12'he4e;
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
