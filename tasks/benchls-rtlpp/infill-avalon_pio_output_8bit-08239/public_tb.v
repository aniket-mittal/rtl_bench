// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08239 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h048b641661;
    stim[1] = 37'h040c1b5d2c;
    stim[2] = 37'h0237c1e807;
    stim[3] = 37'h062e240bad;
    stim[4] = 37'h07c55ca4b6;
    stim[5] = 37'h1fd0a6fe5c;
    stim[6] = 37'h0b2d2a5335;
    stim[7] = 37'h173767b329;
    stim[8] = 37'h1b8fc5d592;
    stim[9] = 37'h1b6a493580;
    stim[10] = 37'h1b5152a402;
    stim[11] = 37'h133a882013;
    stim[12] = 37'h0f9b1d30c6;
    stim[13] = 37'h0bfe1beb9b;
    stim[14] = 37'h0a22889328;
    stim[15] = 37'h1b1ac891f4;
    stim[16] = 37'h06a710147e;
    stim[17] = 37'h1828c19e52;
    stim[18] = 37'h1bb7068e15;
    stim[19] = 37'h1faa68c033;
    stim[20] = 37'h168b0f4b69;
    stim[21] = 37'h0fc8a7225d;
    stim[22] = 37'h12f45b293c;
    stim[23] = 37'h0f210018fe;
    stim[24] = 37'h1ff8dffbd8;
    stim[25] = 37'h1e43682a54;
    stim[26] = 37'h16ddf38a55;
    stim[27] = 37'h0b4f4b72fd;
    stim[28] = 37'h02b85224ae;
    stim[29] = 37'h03e875dea5;
    stim[30] = 37'h0654bd71ba;
    stim[31] = 37'h1a3894b99b;
    stim[32] = 37'h1e3fdef48f;
    stim[33] = 37'h0a566d5db5;
    stim[34] = 37'h0eaca717ea;
    stim[35] = 37'h07ac3ab42c;
    stim[36] = 37'h0bd291510c;
    stim[37] = 37'h070d975506;
    stim[38] = 37'h0fe0cab491;
    stim[39] = 37'h1f7d914b68;
    stim[40] = 37'h0a8c19d76c;
    stim[41] = 37'h031435ab9e;
    stim[42] = 37'h17f296d5f1;
    stim[43] = 37'h0f9032b191;
    stim[44] = 37'h1fd63e9097;
    stim[45] = 37'h0f658c2ac7;
    stim[46] = 37'h03fe7c8fe9;
    stim[47] = 37'h1315f80b49;
    stim[48] = 37'h0f0a8226c1;
    stim[49] = 37'h173e08f834;
    stim[50] = 37'h1e7ec4a38d;
    stim[51] = 37'h0fbe022135;
    stim[52] = 37'h1e6f9a5af8;
    stim[53] = 37'h07d200c6fd;
    stim[54] = 37'h1322458b1b;
    stim[55] = 37'h0b1f60a5ed;
    stim[56] = 37'h033fab5ad0;
    stim[57] = 37'h0aaa083a02;
    stim[58] = 37'h1b74f4b2b2;
    stim[59] = 37'h16201f2d94;
    stim[60] = 37'h179131bcb7;
    stim[61] = 37'h17c920b402;
    stim[62] = 37'h1a8b94c953;
    stim[63] = 37'h0a844a0bd0;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'had000000ad;
      expv[5] = 40'had00000000;
      expv[6] = 40'had00000000;
      expv[7] = 40'had00000000;
      expv[8] = 40'had00000000;
      expv[9] = 40'had00000000;
      expv[10] = 40'had00000000;
      expv[11] = 40'had00000000;
      expv[12] = 40'had00000000;
      expv[13] = 40'had00000000;
      expv[14] = 40'had00000000;
      expv[15] = 40'had00000000;
      expv[16] = 40'had000000ad;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'hba00000000;
      expv[32] = 40'hba00000000;
      expv[33] = 40'hba00000000;
      expv[34] = 40'hba00000000;
      expv[35] = 40'hba000000ba;
      expv[36] = 40'hba00000000;
      expv[37] = 40'hba000000ba;
      expv[38] = 40'hba00000000;
      expv[39] = 40'hba00000000;
      expv[40] = 40'hba00000000;
      expv[41] = 40'hba000000ba;
      expv[42] = 40'hba00000000;
      expv[43] = 40'hba00000000;
      expv[44] = 40'hba00000000;
      expv[45] = 40'hba00000000;
      expv[46] = 40'hba000000ba;
      expv[47] = 40'hba00000000;
      expv[48] = 40'hba00000000;
      expv[49] = 40'hba00000000;
      expv[50] = 40'hba00000000;
      expv[51] = 40'hba00000000;
      expv[52] = 40'hba00000000;
      expv[53] = 40'hba000000ba;
      expv[54] = 40'hba00000000;
      expv[55] = 40'hba00000000;
      expv[56] = 40'hba000000ba;
      expv[57] = 40'hba00000000;
      expv[58] = 40'hba00000000;
      expv[59] = 40'hba00000000;
      expv[60] = 40'hba00000000;
      expv[61] = 40'hba00000000;
      expv[62] = 40'hba00000000;
      expv[63] = 40'hba00000000;
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
