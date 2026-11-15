// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074576 dut (
    .d_in(in_vec[11:0]),
    .exp(out_vec[7:5]),
    .sig(out_vec[4:1]),
    .fifth(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbac;
    stim[1] = 12'h1bf;
    stim[2] = 12'h2fe;
    stim[3] = 12'h771;
    stim[4] = 12'hd13;
    stim[5] = 12'hd18;
    stim[6] = 12'h45b;
    stim[7] = 12'h2f9;
    stim[8] = 12'h5bc;
    stim[9] = 12'h54a;
    stim[10] = 12'h11b;
    stim[11] = 12'h86a;
    stim[12] = 12'h85e;
    stim[13] = 12'hce1;
    stim[14] = 12'hf3b;
    stim[15] = 12'h812;
    stim[16] = 12'h8e0;
    stim[17] = 12'h08e;
    stim[18] = 12'h965;
    stim[19] = 12'h1cf;
    stim[20] = 12'h061;
    stim[21] = 12'hfde;
    stim[22] = 12'h1c9;
    stim[23] = 12'h8ee;
    stim[24] = 12'hf7a;
    stim[25] = 12'hb1d;
    stim[26] = 12'hec7;
    stim[27] = 12'h612;
    stim[28] = 12'h5e4;
    stim[29] = 12'h17c;
    stim[30] = 12'h8c6;
    stim[31] = 12'h233;
    stim[32] = 12'h9b2;
    stim[33] = 12'hf62;
    stim[34] = 12'h692;
    stim[35] = 12'h56a;
    stim[36] = 12'hc65;
    stim[37] = 12'hcf8;
    stim[38] = 12'hb28;
    stim[39] = 12'h1d4;
    stim[40] = 12'h475;
    stim[41] = 12'h7ca;
    stim[42] = 12'h1b4;
    stim[43] = 12'h1b0;
    stim[44] = 12'ha4a;
    stim[45] = 12'h103;
    stim[46] = 12'hdc6;
    stim[47] = 12'h876;
    stim[48] = 12'h8e9;
    stim[49] = 12'h2a5;
    stim[50] = 12'h4da;
    stim[51] = 12'h514;
    stim[52] = 12'hce3;
    stim[53] = 12'hfe6;
    stim[54] = 12'h430;
    stim[55] = 12'hfef;
    stim[56] = 12'h33a;
    stim[57] = 12'h1e1;
    stim[58] = 12'hf36;
    stim[59] = 12'h983;
    stim[60] = 12'h93a;
    stim[61] = 12'h847;
    stim[62] = 12'hc44;
    stim[63] = 12'hfb3;
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
      expv[0] = 8'hf7;
      expv[1] = 8'hbb;
      expv[2] = 8'hd7;
      expv[3] = 8'hee;
      expv[4] = 8'hfa;
      expv[5] = 8'hfa;
      expv[6] = 8'he8;
      expv[7] = 8'hd7;
      expv[8] = 8'heb;
      expv[9] = 8'hea;
      expv[10] = 8'hb1;
      expv[11] = 8'hf0;
      expv[12] = 8'hf0;
      expv[13] = 8'hf9;
      expv[14] = 8'hfe;
      expv[15] = 8'hf0;
      expv[16] = 8'hf1;
      expv[17] = 8'h91;
      expv[18] = 8'hf2;
      expv[19] = 8'hbc;
      expv[20] = 8'h78;
      expv[21] = 8'hff;
      expv[22] = 8'hbc;
      expv[23] = 8'hf1;
      expv[24] = 8'hfe;
      expv[25] = 8'hf6;
      expv[26] = 8'hfd;
      expv[27] = 8'hec;
      expv[28] = 8'heb;
      expv[29] = 8'hb7;
      expv[30] = 8'hf1;
      expv[31] = 8'hd1;
      expv[32] = 8'hf3;
      expv[33] = 8'hfe;
      expv[34] = 8'hed;
      expv[35] = 8'hea;
      expv[36] = 8'hf8;
      expv[37] = 8'hf9;
      expv[38] = 8'hf6;
      expv[39] = 8'hbd;
      expv[40] = 8'he8;
      expv[41] = 8'hef;
      expv[42] = 8'hbb;
      expv[43] = 8'hbb;
      expv[44] = 8'hf4;
      expv[45] = 8'hb0;
      expv[46] = 8'hfb;
      expv[47] = 8'hf0;
      expv[48] = 8'hf1;
      expv[49] = 8'hd5;
      expv[50] = 8'he9;
      expv[51] = 8'hea;
      expv[52] = 8'hf9;
      expv[53] = 8'hff;
      expv[54] = 8'he8;
      expv[55] = 8'hff;
      expv[56] = 8'hd9;
      expv[57] = 8'hbe;
      expv[58] = 8'hfe;
      expv[59] = 8'hf3;
      expv[60] = 8'hf2;
      expv[61] = 8'hf0;
      expv[62] = 8'hf8;
      expv[63] = 8'hff;
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
