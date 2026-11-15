// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004895 dut (
    .clk(clk),
    .rst(in_vec[24:24]),
    .data_1(in_vec[23:16]),
    .data_2(in_vec[15:8]),
    .data_3(in_vec[7:0]),
    .data_min(out_vec[23:16]),
    .data_middle(out_vec[15:8]),
    .data_max(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1863ccd;
    stim[1] = 25'h1bb8d9e;
    stim[2] = 25'h03c06e4;
    stim[3] = 25'h012077b;
    stim[4] = 25'h04402b1;
    stim[5] = 25'h0791c3e;
    stim[6] = 25'h08c235f;
    stim[7] = 25'h0fe0043;
    stim[8] = 25'h088ba9a;
    stim[9] = 25'h00ce75e;
    stim[10] = 25'h000cf53;
    stim[11] = 25'h0a65466;
    stim[12] = 25'h047ebab;
    stim[13] = 25'h0c58b0a;
    stim[14] = 25'h0155e20;
    stim[15] = 25'h0e41bf4;
    stim[16] = 25'h0febe4b;
    stim[17] = 25'h0af8998;
    stim[18] = 25'h0269780;
    stim[19] = 25'h091e025;
    stim[20] = 25'h07397dc;
    stim[21] = 25'h014c5b1;
    stim[22] = 25'h09b1470;
    stim[23] = 25'h07b8068;
    stim[24] = 25'h09e76a3;
    stim[25] = 25'h05040c8;
    stim[26] = 25'h01e3773;
    stim[27] = 25'h0a48d7a;
    stim[28] = 25'h0fcfe68;
    stim[29] = 25'h01811e3;
    stim[30] = 25'h04767b3;
    stim[31] = 25'h0b87049;
    stim[32] = 25'h0f9cb27;
    stim[33] = 25'h0df6215;
    stim[34] = 25'h0e56e35;
    stim[35] = 25'h03b1d69;
    stim[36] = 25'h019b031;
    stim[37] = 25'h0f3d92d;
    stim[38] = 25'h0184f5e;
    stim[39] = 25'h04be1a7;
    stim[40] = 25'h0cfea69;
    stim[41] = 25'h0d22a4f;
    stim[42] = 25'h0eb8357;
    stim[43] = 25'h05f2540;
    stim[44] = 25'h0a1c9a4;
    stim[45] = 25'h0b78ef7;
    stim[46] = 25'h0495eaa;
    stim[47] = 25'h06ca0a0;
    stim[48] = 25'h0aa43e0;
    stim[49] = 25'h04c8279;
    stim[50] = 25'h0aeb759;
    stim[51] = 25'h1ce1604;
    stim[52] = 25'h06a907d;
    stim[53] = 25'h067684a;
    stim[54] = 25'h0e8abe9;
    stim[55] = 25'h03f5a9a;
    stim[56] = 25'h066b473;
    stim[57] = 25'h089aadf;
    stim[58] = 25'h08ef999;
    stim[59] = 25'h03d678c;
    stim[60] = 25'h0064723;
    stim[61] = 25'h03172ab;
    stim[62] = 25'h05986e8;
    stim[63] = 25'h09ec835;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h063ce4;
      expv[4] = 24'h07127b;
      expv[5] = 24'h0244b1;
      expv[6] = 24'h1c3e79;
      expv[7] = 24'h235f8c;
      expv[8] = 24'h0043fe;
      expv[9] = 24'h889aba;
      expv[10] = 24'h0c5ee7;
      expv[11] = 24'h0053cf;
      expv[12] = 24'h5466a6;
      expv[13] = 24'h47abeb;
      expv[14] = 24'h0a8bc5;
      expv[15] = 24'h15205e;
      expv[16] = 24'h1be4f4;
      expv[17] = 24'h4bbefe;
      expv[18] = 24'h8998af;
      expv[19] = 24'h268097;
      expv[20] = 24'h2591e0;
      expv[21] = 24'h7397dc;
      expv[22] = 24'h14b1c5;
      expv[23] = 24'h14709b;
      expv[24] = 24'h687b80;
      expv[25] = 24'h769ea3;
      expv[26] = 24'h4050c8;
      expv[27] = 24'h1e3773;
      expv[28] = 24'h7a8da4;
      expv[29] = 24'h68fcfe;
      expv[30] = 24'h1118e3;
      expv[31] = 24'h4767b3;
      expv[32] = 24'h4970b8;
      expv[33] = 24'h27cbf9;
      expv[34] = 24'h1562df;
      expv[35] = 24'h356ee5;
      expv[36] = 24'h1d3b69;
      expv[37] = 24'h1931b0;
      expv[38] = 24'h2dd9f3;
      expv[39] = 24'h184f5e;
      expv[40] = 24'h4ba7e1;
      expv[41] = 24'h69cfea;
      expv[42] = 24'h2a4fd2;
      expv[43] = 24'h5783eb;
      expv[44] = 24'h25405f;
      expv[45] = 24'ha1a4c9;
      expv[46] = 24'h8eb7f7;
      expv[47] = 24'h495eaa;
      expv[48] = 24'h6ca0a0;
      expv[49] = 24'h43aae0;
      expv[50] = 24'h4c7982;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h6a7d90;
      expv[54] = 24'h4a6768;
      expv[55] = 24'habe8e9;
      expv[56] = 24'h3f5a9a;
      expv[57] = 24'h6673b4;
      expv[58] = 24'h89aadf;
      expv[59] = 24'h8e99f9;
      expv[60] = 24'h3d678c;
      expv[61] = 24'h062347;
      expv[62] = 24'h3172ab;
      expv[63] = 24'h5986e8;
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
