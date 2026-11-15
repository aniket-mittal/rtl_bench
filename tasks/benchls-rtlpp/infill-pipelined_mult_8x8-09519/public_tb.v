// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09519 dut (
    .clk(clk),
    .A(in_vec[15:8]),
    .B(in_vec[7:0]),
    .sum(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h03c1;
    stim[1] = 16'h75cd;
    stim[2] = 16'h34a9;
    stim[3] = 16'h734c;
    stim[4] = 16'h65c6;
    stim[5] = 16'hd102;
    stim[6] = 16'h38eb;
    stim[7] = 16'h05df;
    stim[8] = 16'h1d87;
    stim[9] = 16'hb302;
    stim[10] = 16'hbf48;
    stim[11] = 16'h651f;
    stim[12] = 16'hc969;
    stim[13] = 16'h8e98;
    stim[14] = 16'h7c31;
    stim[15] = 16'hc191;
    stim[16] = 16'h2484;
    stim[17] = 16'ha17b;
    stim[18] = 16'hb932;
    stim[19] = 16'h3029;
    stim[20] = 16'heff0;
    stim[21] = 16'hb895;
    stim[22] = 16'hfce4;
    stim[23] = 16'h0057;
    stim[24] = 16'hcef7;
    stim[25] = 16'h380f;
    stim[26] = 16'h4dcf;
    stim[27] = 16'h77c6;
    stim[28] = 16'h73fe;
    stim[29] = 16'ha781;
    stim[30] = 16'hd532;
    stim[31] = 16'h1a36;
    stim[32] = 16'hc8ec;
    stim[33] = 16'hca99;
    stim[34] = 16'he4eb;
    stim[35] = 16'h7d3a;
    stim[36] = 16'h0daa;
    stim[37] = 16'h3132;
    stim[38] = 16'he7ba;
    stim[39] = 16'h727b;
    stim[40] = 16'h9db5;
    stim[41] = 16'ha856;
    stim[42] = 16'h2589;
    stim[43] = 16'hdefe;
    stim[44] = 16'h6e6a;
    stim[45] = 16'h0aa4;
    stim[46] = 16'h3fa9;
    stim[47] = 16'heafc;
    stim[48] = 16'h07d3;
    stim[49] = 16'ha169;
    stim[50] = 16'he356;
    stim[51] = 16'h8f84;
    stim[52] = 16'h7a80;
    stim[53] = 16'he84e;
    stim[54] = 16'h2a30;
    stim[55] = 16'hff7f;
    stim[56] = 16'h6864;
    stim[57] = 16'h1536;
    stim[58] = 16'h56a1;
    stim[59] = 16'h1276;
    stim[60] = 16'h2f84;
    stim[61] = 16'hcdee;
    stim[62] = 16'h0bc5;
    stim[63] = 16'h4f5e;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hff43;
      expv[9] = 16'he8b1;
      expv[10] = 16'hee54;
      expv[11] = 16'h2224;
      expv[12] = 16'he91e;
      expv[13] = 16'hffa2;
      expv[14] = 16'hfb68;
      expv[15] = 16'hff5b;
      expv[16] = 16'hf24b;
      expv[17] = 16'hff66;
      expv[18] = 16'hedb8;
      expv[19] = 16'h0c3b;
      expv[20] = 16'he971;
      expv[21] = 16'h2e50;
      expv[22] = 16'h17bc;
      expv[23] = 16'h1b51;
      expv[24] = 16'hee90;
      expv[25] = 16'hd25b;
      expv[26] = 16'hf222;
      expv[27] = 16'h07b0;
      expv[28] = 16'h0110;
      expv[29] = 16'h1e18;
      expv[30] = 16'h0070;
      expv[31] = 16'h0000;
      expv[32] = 16'h01c2;
      expv[33] = 16'h0348;
      expv[34] = 16'hf143;
      expv[35] = 16'he50a;
      expv[36] = 16'hff1a;
      expv[37] = 16'h2c27;
      expv[38] = 16'hf79a;
      expv[39] = 16'h057c;
      expv[40] = 16'h0460;
      expv[41] = 16'h15ba;
      expv[42] = 16'h024c;
      expv[43] = 16'h1c52;
      expv[44] = 16'hfba2;
      expv[45] = 16'h0992;
      expv[46] = 16'h06d6;
      expv[47] = 16'h36c6;
      expv[48] = 16'h1d01;
      expv[49] = 16'he270;
      expv[50] = 16'heecd;
      expv[51] = 16'h0044;
      expv[52] = 16'h2d8c;
      expv[53] = 16'hfc68;
      expv[54] = 16'hea97;
      expv[55] = 16'h0058;
      expv[56] = 16'hfec5;
      expv[57] = 16'hd909;
      expv[58] = 16'hf642;
      expv[59] = 16'h36bc;
      expv[60] = 16'hc300;
      expv[61] = 16'hf8b0;
      expv[62] = 16'h07e0;
      expv[63] = 16'hff81;
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
