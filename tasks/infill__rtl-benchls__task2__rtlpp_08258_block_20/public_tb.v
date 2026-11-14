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

  rtlpp_08258 dut (
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
    stim[0] = 38'h20c2a08e18;
    stim[1] = 38'h1ddee0b50c;
    stim[2] = 38'h3e0035b59f;
    stim[3] = 38'h17947dd148;
    stim[4] = 38'h2b4dca2e4d;
    stim[5] = 38'h12d6f7d2ca;
    stim[6] = 38'h0f98988a32;
    stim[7] = 38'h32f0bb94b3;
    stim[8] = 38'h36f25a7ca6;
    stim[9] = 38'h0f9d75dc27;
    stim[10] = 38'h1397ee8c98;
    stim[11] = 38'h07ee7819af;
    stim[12] = 38'h39b648a457;
    stim[13] = 38'h12ab552a4b;
    stim[14] = 38'h307f4e3f24;
    stim[15] = 38'h133dea3fb2;
    stim[16] = 38'h0e4dd02bcf;
    stim[17] = 38'h06a03e8c78;
    stim[18] = 38'h27709e03fa;
    stim[19] = 38'h3f214a814a;
    stim[20] = 38'h0e1f815646;
    stim[21] = 38'h27a221796c;
    stim[22] = 38'h3b09033af2;
    stim[23] = 38'h224ecdf4c8;
    stim[24] = 38'h0f6b2a63d0;
    stim[25] = 38'h32d0daeb26;
    stim[26] = 38'h0f5228aacb;
    stim[27] = 38'h0e4e51ca51;
    stim[28] = 38'h2ee2919859;
    stim[29] = 38'h1f461e066e;
    stim[30] = 38'h165264870e;
    stim[31] = 38'h0f9119041b;
    stim[32] = 38'h02fad9a077;
    stim[33] = 38'h13a6158d9f;
    stim[34] = 38'h1225eef0a8;
    stim[35] = 38'h338a45145a;
    stim[36] = 38'h127d19aa34;
    stim[37] = 38'h33cf29ec92;
    stim[38] = 38'h36da7c4fbc;
    stim[39] = 38'h122ac284a4;
    stim[40] = 38'h3b94727245;
    stim[41] = 38'h1fd37693da;
    stim[42] = 38'h07b619cfeb;
    stim[43] = 38'h2e295b342c;
    stim[44] = 38'h3e44042999;
    stim[45] = 38'h3f5a362a13;
    stim[46] = 38'h23d8ac8dec;
    stim[47] = 38'h19ace2cd50;
    stim[48] = 38'h3bb6f5a588;
    stim[49] = 38'h3274cb9de9;
    stim[50] = 38'h0c123e53b2;
    stim[51] = 38'h2e271911df;
    stim[52] = 38'h1f19eeba50;
    stim[53] = 38'h372e6cb365;
    stim[54] = 38'h2e3c79865d;
    stim[55] = 38'h2316c087b8;
    stim[56] = 38'h1e3f3d37d6;
    stim[57] = 38'h1e0d13cbb9;
    stim[58] = 38'h13d060ee0e;
    stim[59] = 38'h1fa2d15209;
    stim[60] = 38'h16b0731816;
    stim[61] = 38'h1e38082ed1;
    stim[62] = 38'h1a876148a0;
    stim[63] = 38'h0fbe93b98c;
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
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000001;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000001;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000001;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000001;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000001;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000001;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000001;
      expv[56] = 33'h000000001;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h100000000;
      expv[63] = 33'h100000000;
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
