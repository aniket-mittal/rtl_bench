// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_126935 dut (
    .clock(clk),
    .reset(in_vec[30:30]),
    .mdc(in_vec[29:29]),
    .mdi(in_vec[28:28]),
    .mode(in_vec[27:27]),
    .begin_transaction(in_vec[26:26]),
    .phy_address(in_vec[25:21]),
    .reg_address(in_vec[20:16]),
    .data_in(in_vec[15:0]),
    .mdo(out_vec[16:16]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h743c30c3;
    stim[1] = 31'h670ffc61;
    stim[2] = 31'h198dfe4b;
    stim[3] = 31'h61493e45;
    stim[4] = 31'h349af240;
    stim[5] = 31'h0396556a;
    stim[6] = 31'h040b2325;
    stim[7] = 31'h269fe66a;
    stim[8] = 31'h33b7919f;
    stim[9] = 31'h3b06dce4;
    stim[10] = 31'h138294df;
    stim[11] = 31'h1c984de2;
    stim[12] = 31'h3e4d8294;
    stim[13] = 31'h07a9798a;
    stim[14] = 31'h1d399ea2;
    stim[15] = 31'h395071ef;
    stim[16] = 31'h3a914542;
    stim[17] = 31'h2cef6679;
    stim[18] = 31'h0c6f26da;
    stim[19] = 31'h2ce2e200;
    stim[20] = 31'h293436ea;
    stim[21] = 31'h2e507808;
    stim[22] = 31'h0e4d33ac;
    stim[23] = 31'h1c461982;
    stim[24] = 31'h0c67e484;
    stim[25] = 31'h1ec5f51e;
    stim[26] = 31'h05eab925;
    stim[27] = 31'h081081b6;
    stim[28] = 31'h297e08c8;
    stim[29] = 31'h4d0cfa64;
    stim[30] = 31'h324eab67;
    stim[31] = 31'h3c552fa3;
    stim[32] = 31'h3817284b;
    stim[33] = 31'h1b98ba5e;
    stim[34] = 31'h0f392ad7;
    stim[35] = 31'h4c96db02;
    stim[36] = 31'h08742768;
    stim[37] = 31'h3e77224b;
    stim[38] = 31'h102cacbd;
    stim[39] = 31'h0c257ef6;
    stim[40] = 31'h3468cf4a;
    stim[41] = 31'h0d974327;
    stim[42] = 31'h33ed2698;
    stim[43] = 31'h30e16027;
    stim[44] = 31'h0d0038f9;
    stim[45] = 31'h07c1e155;
    stim[46] = 31'h1695f8d3;
    stim[47] = 31'h11783e6d;
    stim[48] = 31'h23d76312;
    stim[49] = 31'h08c88570;
    stim[50] = 31'h0acf5e26;
    stim[51] = 31'h012c8021;
    stim[52] = 31'h291be5d3;
    stim[53] = 31'h1e19cfa3;
    stim[54] = 31'h2c45e9ca;
    stim[55] = 31'h0ee0510d;
    stim[56] = 31'h2c29e623;
    stim[57] = 31'h2933cbbc;
    stim[58] = 31'h23b9f627;
    stim[59] = 31'h2ef294d0;
    stim[60] = 31'h0f5c5e7f;
    stim[61] = 31'h0ddad417;
    stim[62] = 31'h072aac09;
    stim[63] = 31'h353ae840;
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
      expv[0] = 17'hx0000;
      expv[1] = 17'hx0000;
      expv[2] = 17'hx0000;
      expv[3] = 17'hx0000;
      expv[4] = 17'hx0000;
      expv[5] = 17'hx0000;
      expv[6] = 17'h00000;
      expv[7] = 17'h10000;
      expv[8] = 17'h10000;
      expv[9] = 17'h10000;
      expv[10] = 17'h10000;
      expv[11] = 17'h10000;
      expv[12] = 17'h10000;
      expv[13] = 17'h10000;
      expv[14] = 17'h10000;
      expv[15] = 17'h10000;
      expv[16] = 17'h10000;
      expv[17] = 17'h10000;
      expv[18] = 17'h10000;
      expv[19] = 17'h10000;
      expv[20] = 17'h10000;
      expv[21] = 17'h10000;
      expv[22] = 17'h10000;
      expv[23] = 17'h10000;
      expv[24] = 17'h10000;
      expv[25] = 17'h10000;
      expv[26] = 17'h10000;
      expv[27] = 17'h10000;
      expv[28] = 17'h10000;
      expv[29] = 17'hx0000;
      expv[30] = 17'hx0000;
      expv[31] = 17'hx0000;
      expv[32] = 17'hx0000;
      expv[33] = 17'h00000;
      expv[34] = 17'h10000;
      expv[35] = 17'hx0000;
      expv[36] = 17'hx0000;
      expv[37] = 17'hx0000;
      expv[38] = 17'hx0000;
      expv[39] = 17'h00000;
      expv[40] = 17'h10000;
      expv[41] = 17'h10000;
      expv[42] = 17'h10000;
      expv[43] = 17'h10000;
      expv[44] = 17'h10000;
      expv[45] = 17'h10000;
      expv[46] = 17'h10000;
      expv[47] = 17'h10000;
      expv[48] = 17'h10000;
      expv[49] = 17'h10000;
      expv[50] = 17'h10000;
      expv[51] = 17'h10000;
      expv[52] = 17'h10000;
      expv[53] = 17'h10000;
      expv[54] = 17'h10000;
      expv[55] = 17'h10000;
      expv[56] = 17'h10000;
      expv[57] = 17'h10000;
      expv[58] = 17'h10000;
      expv[59] = 17'h10000;
      expv[60] = 17'h10000;
      expv[61] = 17'h10000;
      expv[62] = 17'h10000;
      expv[63] = 17'h10000;
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
