// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01423 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
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
    stim[0] = 38'h142f255d01;
    stim[1] = 38'h3ded3c868f;
    stim[2] = 38'h37e7ee10e3;
    stim[3] = 38'h2ea686f30e;
    stim[4] = 38'h3a01b4ab77;
    stim[5] = 38'h2bd217c2c4;
    stim[6] = 38'h23d1db345f;
    stim[7] = 38'h133b6a4092;
    stim[8] = 38'h3b2a3bb387;
    stim[9] = 38'h133e993a8d;
    stim[10] = 38'h23e1d007e3;
    stim[11] = 38'h3b89300bfb;
    stim[12] = 38'h2b63065489;
    stim[13] = 38'h033e3046a7;
    stim[14] = 38'h36b1a537f5;
    stim[15] = 38'h17c41101b7;
    stim[16] = 38'h139ef111be;
    stim[17] = 38'h1fc3f16d37;
    stim[18] = 38'h1eac9fc06a;
    stim[19] = 38'h0661c1fb5f;
    stim[20] = 38'h3e9151cbb8;
    stim[21] = 38'h0b40c8c522;
    stim[22] = 38'h2b8c57752f;
    stim[23] = 38'h22341b90dd;
    stim[24] = 38'h3e6f20cb82;
    stim[25] = 38'h3a502d28cc;
    stim[26] = 38'h0a22d065db;
    stim[27] = 38'h1b26baecef;
    stim[28] = 38'h3b2ff9f7ca;
    stim[29] = 38'h27778c8294;
    stim[30] = 38'h06c7836044;
    stim[31] = 38'h17b24218a1;
    stim[32] = 38'h27133bd4b4;
    stim[33] = 38'h0f34973f46;
    stim[34] = 38'h26d0f0bf6b;
    stim[35] = 38'h2e7ef8061f;
    stim[36] = 38'h2b3bfed236;
    stim[37] = 38'h1280cc0878;
    stim[38] = 38'h3a0b098e75;
    stim[39] = 38'h1adf49c847;
    stim[40] = 38'h363981a842;
    stim[41] = 38'h163120000c;
    stim[42] = 38'h138fd85726;
    stim[43] = 38'h12b59f55fc;
    stim[44] = 38'h1e89f4a45a;
    stim[45] = 38'h03da775948;
    stim[46] = 38'h1f0262fd6e;
    stim[47] = 38'h23e3f388b4;
    stim[48] = 38'h1a2a931480;
    stim[49] = 38'h1eb9975835;
    stim[50] = 38'h0240bd5683;
    stim[51] = 38'h1e38cb4757;
    stim[52] = 38'h2a9d024cca;
    stim[53] = 38'h1be6672d2e;
    stim[54] = 38'h226a99037f;
    stim[55] = 38'h0befd7a424;
    stim[56] = 38'h0b7202a20f;
    stim[57] = 38'h2ec4a63ca9;
    stim[58] = 38'h23eaed3fbd;
    stim[59] = 38'h2afc1d3483;
    stim[60] = 38'h13b4a7e959;
    stim[61] = 38'h2aa59cb1b4;
    stim[62] = 38'h17c74b7016;
    stim[63] = 38'h023b59c921;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000000;
      expv[39] = 33'h000000001;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000000;
      expv[46] = 33'h100000000;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000001;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h100000000;
      expv[59] = 33'h100000001;
      expv[60] = 33'h100000001;
      expv[61] = 33'h100000000;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
