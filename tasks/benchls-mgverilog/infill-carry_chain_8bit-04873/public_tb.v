// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04873 dut (
    .CI(in_vec[17:17]),
    .CI_TOP(in_vec[16:16]),
    .DI(in_vec[15:8]),
    .S(in_vec[7:0]),
    .CO(out_vec[15:8]),
    .O(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3ac99;
    stim[1] = 18'h29f19;
    stim[2] = 18'h24bfd;
    stim[3] = 18'h2867d;
    stim[4] = 18'h3e10d;
    stim[5] = 18'h1cea8;
    stim[6] = 18'h15162;
    stim[7] = 18'h2b274;
    stim[8] = 18'h16780;
    stim[9] = 18'h0cad7;
    stim[10] = 18'h18f3e;
    stim[11] = 18'h1b7bf;
    stim[12] = 18'h1e632;
    stim[13] = 18'h34caf;
    stim[14] = 18'h10d77;
    stim[15] = 18'h09fb3;
    stim[16] = 18'h296aa;
    stim[17] = 18'h2deca;
    stim[18] = 18'h356fe;
    stim[19] = 18'h34ed5;
    stim[20] = 18'h01825;
    stim[21] = 18'h219ce;
    stim[22] = 18'h220d9;
    stim[23] = 18'h1a416;
    stim[24] = 18'h2f21f;
    stim[25] = 18'h12bc6;
    stim[26] = 18'h379e1;
    stim[27] = 18'h36d9e;
    stim[28] = 18'h36c78;
    stim[29] = 18'h1f48a;
    stim[30] = 18'h39011;
    stim[31] = 18'h24ae2;
    stim[32] = 18'h16de2;
    stim[33] = 18'h3dae7;
    stim[34] = 18'h00a00;
    stim[35] = 18'h3c019;
    stim[36] = 18'h0fcec;
    stim[37] = 18'h1891f;
    stim[38] = 18'h0b8cd;
    stim[39] = 18'h36c53;
    stim[40] = 18'h07148;
    stim[41] = 18'h000fe;
    stim[42] = 18'h1763c;
    stim[43] = 18'h30681;
    stim[44] = 18'h31383;
    stim[45] = 18'h0889d;
    stim[46] = 18'h2c93c;
    stim[47] = 18'h37081;
    stim[48] = 18'h04f73;
    stim[49] = 18'h30f6c;
    stim[50] = 18'h08c66;
    stim[51] = 18'h0388e;
    stim[52] = 18'h227c2;
    stim[53] = 18'h2503a;
    stim[54] = 18'h27564;
    stim[55] = 18'h26faf;
    stim[56] = 18'h197fb;
    stim[57] = 18'h28ff8;
    stim[58] = 18'h35d0c;
    stim[59] = 18'h0e590;
    stim[60] = 18'h35675;
    stim[61] = 18'h20902;
    stim[62] = 18'h2a36c;
    stim[63] = 18'h166fe;
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
      expv[0] = 16'h3de2;
      expv[1] = 16'h9f26;
      expv[2] = 16'hff02;
      expv[3] = 16'hff82;
      expv[4] = 16'he1ce;
      expv[5] = 16'hce34;
      expv[6] = 16'h7384;
      expv[7] = 16'h8679;
      expv[8] = 16'he74e;
      expv[9] = 16'h18e7;
      expv[10] = 16'hbf40;
      expv[11] = 16'h00bf;
      expv[12] = 16'hc4ba;
      expv[13] = 16'hcf30;
      expv[14] = 16'h7887;
      expv[15] = 16'h3ccb;
      expv[16] = 16'h3cd3;
      expv[17] = 16'h1cf3;
      expv[18] = 16'h00ff;
      expv[19] = 16'h1fea;
      expv[20] = 16'h3855;
      expv[21] = 16'h1ff1;
      expv[22] = 16'he11a;
      expv[23] = 16'ha056;
      expv[24] = 16'hffe0;
      expv[25] = 16'hef18;
      expv[26] = 16'hf912;
      expv[27] = 16'hff61;
      expv[28] = 16'h7c81;
      expv[29] = 16'hfc72;
      expv[30] = 16'h8112;
      expv[31] = 16'h08f3;
      expv[32] = 16'h0ffc;
      expv[33] = 16'hff18;
      expv[34] = 16'h0a14;
      expv[35] = 16'hc19a;
      expv[36] = 16'hf00c;
      expv[37] = 16'h801f;
      expv[38] = 16'hf02d;
      expv[39] = 16'h7fac;
      expv[40] = 16'h71aa;
      expv[41] = 16'h00fe;
      expv[42] = 16'h7ec0;
      expv[43] = 16'h078e;
      expv[44] = 16'h13a4;
      expv[45] = 16'h009d;
      expv[46] = 16'hc1bf;
      expv[47] = 16'hf162;
      expv[48] = 16'h7c8b;
      expv[49] = 16'h0f73;
      expv[50] = 16'h8876;
      expv[51] = 16'h30ee;
      expv[52] = 16'he70d;
      expv[53] = 16'h40bb;
      expv[54] = 16'h7187;
      expv[55] = 16'hcf30;
      expv[56] = 16'hfc03;
      expv[57] = 16'hff07;
      expv[58] = 16'h51af;
      expv[59] = 16'he55a;
      expv[60] = 16'h077a;
      expv[61] = 16'h0b15;
      expv[62] = 16'h8f73;
      expv[63] = 16'h00fe;
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
