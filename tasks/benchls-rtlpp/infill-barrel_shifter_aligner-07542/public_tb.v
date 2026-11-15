// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07542 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .idata(in_vec[16:9]),
    .ivalid(in_vec[8:8]),
    .strobe(in_vec[7:0]),
    .odata(out_vec[8:1]),
    .ovalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h35383;
    stim[1] = 18'h3c79c;
    stim[2] = 18'h164cb;
    stim[3] = 18'h1cb31;
    stim[4] = 18'h13aad;
    stim[5] = 18'h08df7;
    stim[6] = 18'h09645;
    stim[7] = 18'h02bb4;
    stim[8] = 18'h0e541;
    stim[9] = 18'h06ce8;
    stim[10] = 18'h0f57e;
    stim[11] = 18'h068f7;
    stim[12] = 18'h035c0;
    stim[13] = 18'h05b80;
    stim[14] = 18'h1ee35;
    stim[15] = 18'h0e0d0;
    stim[16] = 18'h0d83b;
    stim[17] = 18'h0c984;
    stim[18] = 18'h0935e;
    stim[19] = 18'h1b07a;
    stim[20] = 18'h06234;
    stim[21] = 18'h1cee9;
    stim[22] = 18'h06afb;
    stim[23] = 18'h02137;
    stim[24] = 18'h05222;
    stim[25] = 18'h1e27b;
    stim[26] = 18'h0e16a;
    stim[27] = 18'h19f1f;
    stim[28] = 18'h10074;
    stim[29] = 18'h04a06;
    stim[30] = 18'h123e7;
    stim[31] = 18'h0a05a;
    stim[32] = 18'h08172;
    stim[33] = 18'h114fa;
    stim[34] = 18'h0a2e9;
    stim[35] = 18'h13db4;
    stim[36] = 18'h1b0aa;
    stim[37] = 18'h09712;
    stim[38] = 18'h0299b;
    stim[39] = 18'h1494a;
    stim[40] = 18'h125c4;
    stim[41] = 18'h06e75;
    stim[42] = 18'h0668a;
    stim[43] = 18'h0574f;
    stim[44] = 18'h0b250;
    stim[45] = 18'h11639;
    stim[46] = 18'h01b68;
    stim[47] = 18'h1fc96;
    stim[48] = 18'h0f4de;
    stim[49] = 18'h19212;
    stim[50] = 18'h06ea2;
    stim[51] = 18'h09f4f;
    stim[52] = 18'h15f12;
    stim[53] = 18'h08954;
    stim[54] = 18'h00850;
    stim[55] = 18'h0c55d;
    stim[56] = 18'h0a8f4;
    stim[57] = 18'h08ef7;
    stim[58] = 18'h0aa5c;
    stim[59] = 18'h1086f;
    stim[60] = 18'h1e93a;
    stim[61] = 18'h031ff;
    stim[62] = 18'h036c9;
    stim[63] = 18'h0744f;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h001;
      expv[2] = 9'h001;
      expv[3] = 9'h000;
      expv[4] = 9'h001;
      expv[5] = 9'h12c;
      expv[6] = 9'h12b;
      expv[7] = 9'h08c;
      expv[8] = 9'h08d;
      expv[9] = 9'h02b;
      expv[10] = 9'h1c8;
      expv[11] = 9'h1c9;
      expv[12] = 9'h1e8;
      expv[13] = 9'h1e9;
      expv[14] = 9'h035;
      expv[15] = 9'h05a;
      expv[16] = 9'h05a;
      expv[17] = 9'h05a;
      expv[18] = 9'h05b;
      expv[19] = 9'h0c9;
      expv[20] = 9'h126;
      expv[21] = 9'h124;
      expv[22] = 9'h126;
      expv[23] = 9'h124;
      expv[24] = 9'h125;
      expv[25] = 9'h080;
      expv[26] = 9'h086;
      expv[27] = 9'h083;
      expv[28] = 9'h1c3;
      expv[29] = 9'h0f8;
      expv[30] = 9'h0f2;
      expv[31] = 9'h0f9;
      expv[32] = 9'h122;
      expv[33] = 9'h123;
      expv[34] = 9'h102;
      expv[35] = 9'h100;
      expv[36] = 9'h103;
      expv[37] = 9'h13c;
      expv[38] = 9'h13d;
      expv[39] = 9'h0b1;
      expv[40] = 9'h029;
      expv[41] = 9'h093;
      expv[42] = 9'h124;
      expv[43] = 9'h124;
      expv[44] = 9'h125;
      expv[45] = 9'h0ac;
      expv[46] = 9'h0ae;
      expv[47] = 9'h0ad;
      expv[48] = 9'h036;
      expv[49] = 9'h034;
      expv[50] = 9'h036;
      expv[51] = 9'h034;
      expv[52] = 9'h035;
      expv[53] = 9'h13f;
      expv[54] = 9'h0f5;
      expv[55] = 9'h110;
      expv[56] = 9'h111;
      expv[57] = 9'h188;
      expv[58] = 9'h188;
      expv[59] = 9'h188;
      expv[60] = 9'h18a;
      expv[61] = 9'h18b;
      expv[62] = 9'h1a1;
      expv[63] = 9'h0c0;
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
