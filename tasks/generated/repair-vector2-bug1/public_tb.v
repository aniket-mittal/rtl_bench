// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'haa82ea19;
    stim[1] = 32'hc0e44037;
    stim[2] = 32'h729b733b;
    stim[3] = 32'h19a140aa;
    stim[4] = 32'h6da45a4f;
    stim[5] = 32'hc6f7947d;
    stim[6] = 32'hb5fc336d;
    stim[7] = 32'h6a10b63d;
    stim[8] = 32'h763df4b0;
    stim[9] = 32'h03f407c2;
    stim[10] = 32'h2422c48f;
    stim[11] = 32'h6b70c9d8;
    stim[12] = 32'hf7aea0af;
    stim[13] = 32'h56e3826b;
    stim[14] = 32'h7250650c;
    stim[15] = 32'hbc449a2c;
    stim[16] = 32'ha6a42dba;
    stim[17] = 32'hce3b9474;
    stim[18] = 32'hd7966979;
    stim[19] = 32'hf76b0f20;
    stim[20] = 32'h6b736d01;
    stim[21] = 32'h235ffd86;
    stim[22] = 32'h6bf07aaa;
    stim[23] = 32'h0a71981f;
    stim[24] = 32'hb026c726;
    stim[25] = 32'h2831dedd;
    stim[26] = 32'hf0747be2;
    stim[27] = 32'hae0fdb4b;
    stim[28] = 32'h89977883;
    stim[29] = 32'h2a6a13f3;
    stim[30] = 32'h6ac8f162;
    stim[31] = 32'h1c9949ff;
    stim[32] = 32'h5d5534b8;
    stim[33] = 32'h9444866d;
    stim[34] = 32'hfc926cfd;
    stim[35] = 32'hdaaa40fa;
    stim[36] = 32'h6ad7ee40;
    stim[37] = 32'hdb000cfd;
    stim[38] = 32'h17162317;
    stim[39] = 32'h885e8a83;
    stim[40] = 32'h04bd2c56;
    stim[41] = 32'h5df9cea6;
    stim[42] = 32'h8df25774;
    stim[43] = 32'h0c1cfeeb;
    stim[44] = 32'h7eaf1326;
    stim[45] = 32'h13e8503f;
    stim[46] = 32'h32b1d1d2;
    stim[47] = 32'h44aa5292;
    stim[48] = 32'h395f1322;
    stim[49] = 32'h64e4227b;
    stim[50] = 32'hb286b441;
    stim[51] = 32'ha625b9d6;
    stim[52] = 32'h39cdc9c6;
    stim[53] = 32'h56384697;
    stim[54] = 32'ha367ae4d;
    stim[55] = 32'h88d5644d;
    stim[56] = 32'h806d9b3a;
    stim[57] = 32'hf073bcff;
    stim[58] = 32'hec66bef9;
    stim[59] = 32'h91cc1ad2;
    stim[60] = 32'hf23449cc;
    stim[61] = 32'h35ad29fe;
    stim[62] = 32'hacbdb995;
    stim[63] = 32'h7180cb8b;
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
      expv[0] = 32'h0cf502aa;
      expv[1] = 32'h1ba064c0;
      expv[2] = 32'h1db99b72;
      expv[3] = 32'h55202119;
      expv[4] = 32'h27ad246d;
      expv[5] = 32'h3eca77c6;
      expv[6] = 32'h3699fcb5;
      expv[7] = 32'h1edb106a;
      expv[8] = 32'h587a3d76;
      expv[9] = 32'h6103f403;
      expv[10] = 32'h47e22224;
      expv[11] = 32'h6c64f06b;
      expv[12] = 32'h57d02ef7;
      expv[13] = 32'h35c16356;
      expv[14] = 32'h0632d072;
      expv[15] = 32'h164d44bc;
      expv[16] = 32'h5d16a4a6;
      expv[17] = 32'h3a4a3bce;
      expv[18] = 32'h3cb496d7;
      expv[19] = 32'h1007ebf7;
      expv[20] = 32'h00b6f36b;
      expv[21] = 32'h437edf23;
      expv[22] = 32'h553d706b;
      expv[23] = 32'h0fcc710a;
      expv[24] = 32'h1363a6b0;
      expv[25] = 32'h6eef3128;
      expv[26] = 32'h713df4f0;
      expv[27] = 32'h25ed8fae;
      expv[28] = 32'h41bc1789;
      expv[29] = 32'h7989ea2a;
      expv[30] = 32'h3178c86a;
      expv[31] = 32'h7fa4991c;
      expv[32] = 32'h5c1a555d;
      expv[33] = 32'h36c34494;
      expv[34] = 32'h7eb612fc;
      expv[35] = 32'h7d202ada;
      expv[36] = 32'h2077576a;
      expv[37] = 32'h7e8600db;
      expv[38] = 32'h0b919617;
      expv[39] = 32'h41c55e88;
      expv[40] = 32'h2b163d04;
      expv[41] = 32'h5367795d;
      expv[42] = 32'h3a2bf28d;
      expv[43] = 32'h75ff1c0c;
      expv[44] = 32'h1309af7e;
      expv[45] = 32'h1fa86813;
      expv[46] = 32'h6968b132;
      expv[47] = 32'h49292a44;
      expv[48] = 32'h1109df39;
      expv[49] = 32'h3d916464;
      expv[50] = 32'h20da06b2;
      expv[51] = 32'h6b5ca5a6;
      expv[52] = 32'h6364cd39;
      expv[53] = 32'h4ba33856;
      expv[54] = 32'h26d767a3;
      expv[55] = 32'h26b25588;
      expv[56] = 32'h1d4ded80;
      expv[57] = 32'h7fde73f0;
      expv[58] = 32'h7cdf66ec;
      expv[59] = 32'h690d4c91;
      expv[60] = 32'h6624b4f2;
      expv[61] = 32'h7f14ad35;
      expv[62] = 32'h4adcbdac;
      expv[63] = 32'h45e58071;
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
