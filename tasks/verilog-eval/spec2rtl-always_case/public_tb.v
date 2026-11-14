// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .sel(in_vec[26:24]),
    .data0(in_vec[23:20]),
    .data1(in_vec[19:16]),
    .data2(in_vec[15:12]),
    .data3(in_vec[11:8]),
    .data4(in_vec[7:4]),
    .data5(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h3b5ead2;
    stim[1] = 27'h51b1786;
    stim[2] = 27'h086e6f5;
    stim[3] = 27'h107da5e;
    stim[4] = 27'h062118b;
    stim[5] = 27'h43e9ea9;
    stim[6] = 27'h39d0fd4;
    stim[7] = 27'h1cf2c6c;
    stim[8] = 27'h1c468a8;
    stim[9] = 27'h79dd40a;
    stim[10] = 27'h69e84a2;
    stim[11] = 27'h4ecb95a;
    stim[12] = 27'h111c6cd;
    stim[13] = 27'h6d3e432;
    stim[14] = 27'h1f5abb2;
    stim[15] = 27'h034419d;
    stim[16] = 27'h3f49e6a;
    stim[17] = 27'h0ad93f9;
    stim[18] = 27'h7537226;
    stim[19] = 27'h540c95a;
    stim[20] = 27'h3a38974;
    stim[21] = 27'h1542cbb;
    stim[22] = 27'h2a6a9f0;
    stim[23] = 27'h1d40a49;
    stim[24] = 27'h6ea5abf;
    stim[25] = 27'h31be98a;
    stim[26] = 27'h4772b8b;
    stim[27] = 27'h489c5c2;
    stim[28] = 27'h25acd1d;
    stim[29] = 27'h76a30cb;
    stim[30] = 27'h1475491;
    stim[31] = 27'h385a429;
    stim[32] = 27'h63f13c4;
    stim[33] = 27'h7fc1b2a;
    stim[34] = 27'h412c875;
    stim[35] = 27'h29e2b07;
    stim[36] = 27'h7e8d232;
    stim[37] = 27'h6898dc1;
    stim[38] = 27'h020ac4b;
    stim[39] = 27'h739219c;
    stim[40] = 27'h47bf94e;
    stim[41] = 27'h4067e95;
    stim[42] = 27'h69d599b;
    stim[43] = 27'h024fdce;
    stim[44] = 27'h3899cdf;
    stim[45] = 27'h68b7686;
    stim[46] = 27'h25bd528;
    stim[47] = 27'h6c278d0;
    stim[48] = 27'h7e4f9a0;
    stim[49] = 27'h1cfb2dd;
    stim[50] = 27'h599a87f;
    stim[51] = 27'h3c11fda;
    stim[52] = 27'h3e83007;
    stim[53] = 27'h1874694;
    stim[54] = 27'h6560366;
    stim[55] = 27'h4fab6c4;
    stim[56] = 27'h1916bdc;
    stim[57] = 27'h68dbd3f;
    stim[58] = 27'h03825f5;
    stim[59] = 27'h1e52ab2;
    stim[60] = 27'h1f4ddfb;
    stim[61] = 27'h76875fe;
    stim[62] = 27'h534123f;
    stim[63] = 27'h449f274;
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
      expv[0] = 4'ha;
      expv[1] = 4'h6;
      expv[2] = 4'h8;
      expv[3] = 4'h7;
      expv[4] = 4'h6;
      expv[5] = 4'ha;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'h4;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h5;
      expv[12] = 4'h1;
      expv[13] = 4'h0;
      expv[14] = 4'h5;
      expv[15] = 4'h3;
      expv[16] = 4'he;
      expv[17] = 4'ha;
      expv[18] = 4'h0;
      expv[19] = 4'ha;
      expv[20] = 4'h9;
      expv[21] = 4'h4;
      expv[22] = 4'ha;
      expv[23] = 4'h4;
      expv[24] = 4'h0;
      expv[25] = 4'h9;
      expv[26] = 4'h8;
      expv[27] = 4'hc;
      expv[28] = 4'hc;
      expv[29] = 4'h0;
      expv[30] = 4'h7;
      expv[31] = 4'h4;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h7;
      expv[35] = 4'h2;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h2;
      expv[39] = 4'h0;
      expv[40] = 4'h4;
      expv[41] = 4'h9;
      expv[42] = 4'h0;
      expv[43] = 4'h2;
      expv[44] = 4'hc;
      expv[45] = 4'h0;
      expv[46] = 4'hd;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'hf;
      expv[50] = 4'hf;
      expv[51] = 4'hf;
      expv[52] = 4'h0;
      expv[53] = 4'h7;
      expv[54] = 4'h0;
      expv[55] = 4'hc;
      expv[56] = 4'h1;
      expv[57] = 4'h0;
      expv[58] = 4'h3;
      expv[59] = 4'h5;
      expv[60] = 4'h4;
      expv[61] = 4'h0;
      expv[62] = 4'hf;
      expv[63] = 4'h7;
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
