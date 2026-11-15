// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072492 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h721;
    stim[1] = 11'h54b;
    stim[2] = 11'h32e;
    stim[3] = 11'h316;
    stim[4] = 11'h008;
    stim[5] = 11'h29a;
    stim[6] = 11'h330;
    stim[7] = 11'h22e;
    stim[8] = 11'h062;
    stim[9] = 11'h204;
    stim[10] = 11'h188;
    stim[11] = 11'h008;
    stim[12] = 11'h15d;
    stim[13] = 11'h243;
    stim[14] = 11'h00a;
    stim[15] = 11'h2ec;
    stim[16] = 11'h2d2;
    stim[17] = 11'h17e;
    stim[18] = 11'h3f8;
    stim[19] = 11'h2dc;
    stim[20] = 11'h2b2;
    stim[21] = 11'h22f;
    stim[22] = 11'h2f1;
    stim[23] = 11'h1ba;
    stim[24] = 11'h65c;
    stim[25] = 11'h0f5;
    stim[26] = 11'h2a8;
    stim[27] = 11'h068;
    stim[28] = 11'h232;
    stim[29] = 11'h27d;
    stim[30] = 11'h0f7;
    stim[31] = 11'h298;
    stim[32] = 11'h000;
    stim[33] = 11'h391;
    stim[34] = 11'h273;
    stim[35] = 11'h32b;
    stim[36] = 11'h08f;
    stim[37] = 11'h351;
    stim[38] = 11'h35f;
    stim[39] = 11'h2fa;
    stim[40] = 11'h153;
    stim[41] = 11'h1e9;
    stim[42] = 11'h3af;
    stim[43] = 11'h0f2;
    stim[44] = 11'h20c;
    stim[45] = 11'h10e;
    stim[46] = 11'h305;
    stim[47] = 11'h11b;
    stim[48] = 11'h385;
    stim[49] = 11'h1d3;
    stim[50] = 11'h296;
    stim[51] = 11'h072;
    stim[52] = 11'h0d5;
    stim[53] = 11'h051;
    stim[54] = 11'h3ee;
    stim[55] = 11'h030;
    stim[56] = 11'h363;
    stim[57] = 11'h012;
    stim[58] = 11'h11b;
    stim[59] = 11'h262;
    stim[60] = 11'h00a;
    stim[61] = 11'h1ce;
    stim[62] = 11'h19e;
    stim[63] = 11'h0e2;
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
      expv[2] = 12'h290;
      expv[3] = 12'he58;
      expv[4] = 12'he2d;
      expv[5] = 12'he2d;
      expv[6] = 12'h62e;
      expv[7] = 12'h62e;
      expv[8] = 12'h62e;
      expv[9] = 12'h62e;
      expv[10] = 12'h62e;
      expv[11] = 12'h62e;
      expv[12] = 12'h62e;
      expv[13] = 12'hd35;
      expv[14] = 12'hc85;
      expv[15] = 12'h486;
      expv[16] = 12'h486;
      expv[17] = 12'h486;
      expv[18] = 12'h486;
      expv[19] = 12'h486;
      expv[20] = 12'h486;
      expv[21] = 12'h486;
      expv[22] = 12'h815;
      expv[23] = 12'h810;
      expv[24] = 12'hb75;
      expv[25] = 12'h370;
      expv[26] = 12'hb70;
      expv[27] = 12'hb70;
      expv[28] = 12'hb70;
      expv[29] = 12'hc65;
      expv[30] = 12'hc60;
      expv[31] = 12'h9ed;
      expv[32] = 12'h9ed;
      expv[33] = 12'h9ed;
      expv[34] = 12'h9e8;
      expv[35] = 12'hce5;
      expv[36] = 12'he55;
      expv[37] = 12'h91d;
      expv[38] = 12'h918;
      expv[39] = 12'hebd;
      expv[40] = 12'h6be;
      expv[41] = 12'hdf5;
      expv[42] = 12'hdf0;
      expv[43] = 12'hf5d;
      expv[44] = 12'h75e;
      expv[45] = 12'h75e;
      expv[46] = 12'h75e;
      expv[47] = 12'h9e5;
      expv[48] = 12'ha35;
      expv[49] = 12'ha30;
      expv[50] = 12'hba5;
      expv[51] = 12'h3a6;
      expv[52] = 12'h3a6;
      expv[53] = 12'hd2d;
      expv[54] = 12'hd28;
      expv[55] = 12'hfdd;
      expv[56] = 12'hfdd;
      expv[57] = 12'hec5;
      expv[58] = 12'h6c6;
      expv[59] = 12'h825;
      expv[60] = 12'h026;
      expv[61] = 12'h026;
      expv[62] = 12'h026;
      expv[63] = 12'h026;
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
