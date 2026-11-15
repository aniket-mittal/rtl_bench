// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ready_skid dut (
    .clk(clk),
    .arst(in_vec[18:18]),
    .valid_i(in_vec[17:17]),
    .dat_i(in_vec[16:1]),
    .ready_o(in_vec[0:0]),
    .ready_i(out_vec[17:17]),
    .valid_o(out_vec[16:16]),
    .dat_o(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h494c4;
    stim[1] = 19'h78921;
    stim[2] = 19'h2cac5;
    stim[3] = 19'h1226b;
    stim[4] = 19'h115de;
    stim[5] = 19'h1e7fa;
    stim[6] = 19'h018e4;
    stim[7] = 19'h16a55;
    stim[8] = 19'h3bedf;
    stim[9] = 19'h2c6bd;
    stim[10] = 19'h39e87;
    stim[11] = 19'h30f5d;
    stim[12] = 19'h19af2;
    stim[13] = 19'h3262d;
    stim[14] = 19'h3c81f;
    stim[15] = 19'h2174a;
    stim[16] = 19'h08b52;
    stim[17] = 19'h20490;
    stim[18] = 19'h2edf0;
    stim[19] = 19'h34b26;
    stim[20] = 19'h11875;
    stim[21] = 19'h10e24;
    stim[22] = 19'h182f1;
    stim[23] = 19'h25b8f;
    stim[24] = 19'h343d8;
    stim[25] = 19'h1e339;
    stim[26] = 19'h04216;
    stim[27] = 19'h2beee;
    stim[28] = 19'h295f8;
    stim[29] = 19'h34623;
    stim[30] = 19'h05b45;
    stim[31] = 19'h21ac2;
    stim[32] = 19'h3bb8d;
    stim[33] = 19'h35ef6;
    stim[34] = 19'h0074a;
    stim[35] = 19'h004c5;
    stim[36] = 19'h3cde8;
    stim[37] = 19'h0e9ca;
    stim[38] = 19'h134d6;
    stim[39] = 19'h325a6;
    stim[40] = 19'h19ef1;
    stim[41] = 19'h0031c;
    stim[42] = 19'h35243;
    stim[43] = 19'h0e808;
    stim[44] = 19'h31220;
    stim[45] = 19'h07432;
    stim[46] = 19'h39316;
    stim[47] = 19'h1e861;
    stim[48] = 19'h28111;
    stim[49] = 19'h02eb0;
    stim[50] = 19'h35332;
    stim[51] = 19'h16dcd;
    stim[52] = 19'h2c227;
    stim[53] = 19'h0b8e1;
    stim[54] = 19'h19fa9;
    stim[55] = 19'h2ca11;
    stim[56] = 19'h22f5a;
    stim[57] = 19'h3c2d1;
    stim[58] = 19'h2c91f;
    stim[59] = 19'h07df2;
    stim[60] = 19'h28427;
    stim[61] = 19'h28f12;
    stim[62] = 19'h2221e;
    stim[63] = 19'h3f8b5;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h20000;
      expv[4] = 18'h20000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h20000;
      expv[9] = 18'h3df6f;
      expv[10] = 18'h3635e;
      expv[11] = 18'h3cf43;
      expv[12] = 18'h387ae;
      expv[13] = 18'h187ae;
      expv[14] = 18'h287ae;
      expv[15] = 18'h3e40f;
      expv[16] = 18'h1e40f;
      expv[17] = 18'h1e40f;
      expv[18] = 18'h1e40f;
      expv[19] = 18'h1e40f;
      expv[20] = 18'h1e40f;
      expv[21] = 18'h30ba5;
      expv[22] = 18'h10ba5;
      expv[23] = 18'h20ba5;
      expv[24] = 18'h32dc7;
      expv[25] = 18'h12dc7;
      expv[26] = 18'h3a1ec;
      expv[27] = 18'h1a1ec;
      expv[28] = 18'h1a1ec;
      expv[29] = 18'h1a1ec;
      expv[30] = 18'h2a1ec;
      expv[31] = 18'h2a1ec;
      expv[32] = 18'h10d61;
      expv[33] = 18'h20d61;
      expv[34] = 18'h1af7b;
      expv[35] = 18'h1af7b;
      expv[36] = 18'h2af7b;
      expv[37] = 18'h1e6f4;
      expv[38] = 18'h1e6f4;
      expv[39] = 18'h1e6f4;
      expv[40] = 18'h1e6f4;
      expv[41] = 18'h2e6f4;
      expv[42] = 18'h0e6f4;
      expv[43] = 18'h2e6f4;
      expv[44] = 18'h0e6f4;
      expv[45] = 18'h0e6f4;
      expv[46] = 18'h0e6f4;
      expv[47] = 18'h0e6f4;
      expv[48] = 18'h2e6f4;
      expv[49] = 18'h34088;
      expv[50] = 18'h14088;
      expv[51] = 18'h14088;
      expv[52] = 18'h24088;
      expv[53] = 18'h36113;
      expv[54] = 18'h26113;
      expv[55] = 18'h26113;
      expv[56] = 18'h36508;
      expv[57] = 18'h16508;
      expv[58] = 18'h317ad;
      expv[59] = 18'h3648f;
      expv[60] = 18'h1648f;
      expv[61] = 18'h2648f;
      expv[62] = 18'h14789;
      expv[63] = 18'h14789;
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
