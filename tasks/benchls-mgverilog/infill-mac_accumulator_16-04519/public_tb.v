// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04519 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .A(in_vec[15:8]),
    .B(in_vec[7:0]),
    .Z(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1e4b6;
    stim[1] = 17'h16638;
    stim[2] = 17'h0aff8;
    stim[3] = 17'h08902;
    stim[4] = 17'h0a3d1;
    stim[5] = 17'h08a0c;
    stim[6] = 17'h0982b;
    stim[7] = 17'h0e4e2;
    stim[8] = 17'h0f9e0;
    stim[9] = 17'h08c20;
    stim[10] = 17'h05a9d;
    stim[11] = 17'h00c48;
    stim[12] = 17'h0aa1f;
    stim[13] = 17'h0902b;
    stim[14] = 17'h0aaf5;
    stim[15] = 17'h06e64;
    stim[16] = 17'h092bd;
    stim[17] = 17'h03ef0;
    stim[18] = 17'h0addc;
    stim[19] = 17'h01cfe;
    stim[20] = 17'h06eed;
    stim[21] = 17'h0c8ff;
    stim[22] = 17'h0c176;
    stim[23] = 17'h02a26;
    stim[24] = 17'h06513;
    stim[25] = 17'h0554e;
    stim[26] = 17'h0cefd;
    stim[27] = 17'h04828;
    stim[28] = 17'h0dc40;
    stim[29] = 17'h0e866;
    stim[30] = 17'h02e61;
    stim[31] = 17'h03689;
    stim[32] = 17'h0c87a;
    stim[33] = 17'h053b8;
    stim[34] = 17'h0f3b7;
    stim[35] = 17'h012fb;
    stim[36] = 17'h08a6e;
    stim[37] = 17'h01ed1;
    stim[38] = 17'h0003f;
    stim[39] = 17'h09994;
    stim[40] = 17'h09b0e;
    stim[41] = 17'h18dfb;
    stim[42] = 17'h02b26;
    stim[43] = 17'h05790;
    stim[44] = 17'h0be82;
    stim[45] = 17'h13fe4;
    stim[46] = 17'h0e82f;
    stim[47] = 17'h018da;
    stim[48] = 17'h08135;
    stim[49] = 17'h0ff77;
    stim[50] = 17'h001f7;
    stim[51] = 17'h08c13;
    stim[52] = 17'h05f76;
    stim[53] = 17'h0e77b;
    stim[54] = 17'h08f37;
    stim[55] = 17'h059ee;
    stim[56] = 17'h0d25f;
    stim[57] = 17'h0d071;
    stim[58] = 17'h00d35;
    stim[59] = 17'h0d385;
    stim[60] = 17'h0cea2;
    stim[61] = 17'h0ff4d;
    stim[62] = 17'h01fd5;
    stim[63] = 17'h067d6;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'ha988;
      expv[4] = 16'haa9a;
      expv[5] = 16'h2fad;
      expv[6] = 16'h3625;
      expv[7] = 16'h4fad;
      expv[8] = 16'h18f5;
      expv[9] = 16'hf2d5;
      expv[10] = 16'h0455;
      expv[11] = 16'h3b87;
      expv[12] = 16'h3ee7;
      expv[13] = 16'h537d;
      expv[14] = 16'h6bad;
      expv[15] = 16'h0e5f;
      expv[16] = 16'h3957;
      expv[17] = 16'ha521;
      expv[18] = 16'hdf41;
      expv[19] = 16'h73ed;
      expv[20] = 16'h8fb5;
      expv[21] = 16'hf58b;
      expv[22] = 16'hbcc3;
      expv[23] = 16'h15b9;
      expv[24] = 16'h1bf5;
      expv[25] = 16'h2374;
      expv[26] = 16'h3d5a;
      expv[27] = 16'h08f0;
      expv[28] = 16'h1430;
      expv[29] = 16'h4b30;
      expv[30] = 16'ha7a0;
      expv[31] = 16'hb90e;
      expv[32] = 16'hd5f4;
      expv[33] = 16'h3544;
      expv[34] = 16'h70ec;
      expv[35] = 16'h1ea1;
      expv[36] = 16'h3047;
      expv[37] = 16'h6b93;
      expv[38] = 16'h8411;
      expv[39] = 16'h8411;
      expv[40] = 16'hdc85;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0662;
      expv[44] = 16'h3752;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h2a98;
      expv[48] = 16'h3f08;
      expv[49] = 16'h59bd;
      expv[50] = 16'hd046;
      expv[51] = 16'hd13d;
      expv[52] = 16'hdba1;
      expv[53] = 16'h076b;
      expv[54] = 16'h7668;
      expv[55] = 16'h9521;
      expv[56] = 16'he7df;
      expv[57] = 16'h35cd;
      expv[58] = 16'h919d;
      expv[59] = 16'h944e;
      expv[60] = 16'h01ed;
      expv[61] = 16'h8449;
      expv[62] = 16'hd0fc;
      expv[63] = 16'heac7;
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
