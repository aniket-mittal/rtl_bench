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

  rtlpp_11187 dut (
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
    stim[0] = 24'h848fbf;
    stim[1] = 24'hb0fefc;
    stim[2] = 24'hea0149;
    stim[3] = 24'h097fff;
    stim[4] = 24'h65c55c;
    stim[5] = 24'h0c4b1d;
    stim[6] = 24'hb3d05a;
    stim[7] = 24'h53ab09;
    stim[8] = 24'hc21a3d;
    stim[9] = 24'h88bd7b;
    stim[10] = 24'h1c17d1;
    stim[11] = 24'h75bc01;
    stim[12] = 24'h9e794f;
    stim[13] = 24'h413a3f;
    stim[14] = 24'h53cc2f;
    stim[15] = 24'hef42fb;
    stim[16] = 24'h9e2607;
    stim[17] = 24'h982b30;
    stim[18] = 24'h7ddd0d;
    stim[19] = 24'hc7ec70;
    stim[20] = 24'hf11ec1;
    stim[21] = 24'hb73943;
    stim[22] = 24'hd48985;
    stim[23] = 24'h3efd41;
    stim[24] = 24'hb6915a;
    stim[25] = 24'h1376be;
    stim[26] = 24'h50b70a;
    stim[27] = 24'h304e23;
    stim[28] = 24'h0dd88f;
    stim[29] = 24'hd91e4c;
    stim[30] = 24'ha1cd28;
    stim[31] = 24'h0f6d1f;
    stim[32] = 24'h86a17c;
    stim[33] = 24'ha5c649;
    stim[34] = 24'h10e360;
    stim[35] = 24'hfb8a93;
    stim[36] = 24'heae0f4;
    stim[37] = 24'hf8634b;
    stim[38] = 24'h6191c0;
    stim[39] = 24'h33434f;
    stim[40] = 24'h64b00d;
    stim[41] = 24'h756d01;
    stim[42] = 24'h001267;
    stim[43] = 24'h507b7d;
    stim[44] = 24'hd7c2ac;
    stim[45] = 24'hb2a609;
    stim[46] = 24'h74c198;
    stim[47] = 24'h713d56;
    stim[48] = 24'h17651e;
    stim[49] = 24'he40140;
    stim[50] = 24'h482229;
    stim[51] = 24'hce3e88;
    stim[52] = 24'h2316b5;
    stim[53] = 24'h4518b6;
    stim[54] = 24'h358672;
    stim[55] = 24'h6fbd22;
    stim[56] = 24'h93e8b3;
    stim[57] = 24'he34d7f;
    stim[58] = 24'h2d2a6a;
    stim[59] = 24'h12d5a6;
    stim[60] = 24'h47373e;
    stim[61] = 24'hc50c7d;
    stim[62] = 24'h7cdc30;
    stim[63] = 24'h5be7d1;
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
      expv[3] = 12'hf0b;
      expv[4] = 12'hf76;
      expv[5] = 12'hfdf;
      expv[6] = 12'hb3b;
      expv[7] = 12'hea9;
      expv[8] = 12'hb9d;
      expv[9] = 12'hf7a;
      expv[10] = 12'he60;
      expv[11] = 12'hf9a;
      expv[12] = 12'hf16;
      expv[13] = 12'hccf;
      expv[14] = 12'hedf;
      expv[15] = 12'hf4e;
      expv[16] = 12'he06;
      expv[17] = 12'he60;
      expv[18] = 12'hfe5;
      expv[19] = 12'hf4e;
      expv[20] = 12'hf3f;
      expv[21] = 12'hef7;
      expv[22] = 12'hfa1;
      expv[23] = 12'hfe8;
      expv[24] = 12'hf82;
      expv[25] = 12'hfba;
      expv[26] = 12'hdf7;
      expv[27] = 12'hf82;
      expv[28] = 12'hc44;
      expv[29] = 12'he52;
      expv[30] = 12'hd96;
      expv[31] = 12'hbc8;
      expv[32] = 12'hfc1;
      expv[33] = 12'hf52;
      expv[34] = 12'hbf1;
      expv[35] = 12'hf11;
      expv[36] = 12'hf5c;
      expv[37] = 12'hc11;
      expv[38] = 12'hff7;
      expv[39] = 12'hfdf;
      expv[40] = 12'hff4;
      expv[41] = 12'he9a;
      expv[42] = 12'hdac;
      expv[43] = 12'hea5;
      expv[44] = 12'hedf;
      expv[45] = 12'h431;
      expv[46] = 12'he52;
      expv[47] = 12'hfbe;
      expv[48] = 12'hf7a;
      expv[49] = 12'hedc;
      expv[50] = 12'hed2;
      expv[51] = 12'hc8a;
      expv[52] = 12'hfd5;
      expv[53] = 12'he2c;
      expv[54] = 12'hfb0;
      expv[55] = 12'hd21;
      expv[56] = 12'he1c;
      expv[57] = 12'hdbe;
      expv[58] = 12'hecb;
      expv[59] = 12'hf31;
      expv[60] = 12'hfd2;
      expv[61] = 12'hd7e;
      expv[62] = 12'hc3b;
      expv[63] = 12'he26;
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
