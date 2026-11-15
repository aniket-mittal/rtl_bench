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

  rtlpp_10874 dut (
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
    stim[0] = 38'h05ff287561;
    stim[1] = 38'h3dc5811f51;
    stim[2] = 38'h3fff8f5ce5;
    stim[3] = 38'h1a4fbc102e;
    stim[4] = 38'h03a3bf1c8f;
    stim[5] = 38'h265f73ab9f;
    stim[6] = 38'h17437c2beb;
    stim[7] = 38'h33bec758af;
    stim[8] = 38'h3a17b3959e;
    stim[9] = 38'h3056b8d790;
    stim[10] = 38'h2b9376bda1;
    stim[11] = 38'h335746f598;
    stim[12] = 38'h0a6663eba1;
    stim[13] = 38'h04d8f67c84;
    stim[14] = 38'h025e00e599;
    stim[15] = 38'h3e29ab6120;
    stim[16] = 38'h0e7a6b2069;
    stim[17] = 38'h2f26c2aae3;
    stim[18] = 38'h0ebdbcdb63;
    stim[19] = 38'h0234bdc71b;
    stim[20] = 38'h1f3cb90539;
    stim[21] = 38'h1691ef49c5;
    stim[22] = 38'h2ffcc59d5c;
    stim[23] = 38'h2f6b0e8873;
    stim[24] = 38'h262b25faef;
    stim[25] = 38'h02a1a223ee;
    stim[26] = 38'h3b96dc4216;
    stim[27] = 38'h0d9b7911ff;
    stim[28] = 38'h075cb4875f;
    stim[29] = 38'h2a8132e0b7;
    stim[30] = 38'h0719984042;
    stim[31] = 38'h3fb306173a;
    stim[32] = 38'h3ea96e763f;
    stim[33] = 38'h0b7ef56b9f;
    stim[34] = 38'h0b89c78315;
    stim[35] = 38'h1b1f72f95f;
    stim[36] = 38'h2b934275a9;
    stim[37] = 38'h1b016c549f;
    stim[38] = 38'h2b302215b7;
    stim[39] = 38'h36e20d9d9a;
    stim[40] = 38'h3a7693e634;
    stim[41] = 38'h3ab87ade56;
    stim[42] = 38'h23b5538f9a;
    stim[43] = 38'h2a19e19e6f;
    stim[44] = 38'h1edadec83e;
    stim[45] = 38'h36ac9448b2;
    stim[46] = 38'h0696d0211b;
    stim[47] = 38'h323da45adf;
    stim[48] = 38'h0a6b15a95b;
    stim[49] = 38'h278d4b3478;
    stim[50] = 38'h178fef1c64;
    stim[51] = 38'h0fb41b9700;
    stim[52] = 38'h0b82a96fc4;
    stim[53] = 38'h2fd538351c;
    stim[54] = 38'h1368365220;
    stim[55] = 38'h3bd56f94e6;
    stim[56] = 38'h26f0bd7e35;
    stim[57] = 38'h3307fce3c2;
    stim[58] = 38'h1f3f1130be;
    stim[59] = 38'h3f118eef8b;
    stim[60] = 38'h0f585a938c;
    stim[61] = 38'h2e5115ffc0;
    stim[62] = 38'h3e6cd7a040;
    stim[63] = 38'h0f48a9cb07;
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
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000001;
      expv[30] = 33'h000000000;
      expv[31] = 33'h100000001;
      expv[32] = 33'h100000001;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000001;
      expv[41] = 33'h000000001;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000001;
      expv[44] = 33'h000000001;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000001;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000001;
      expv[53] = 33'h100000000;
      expv[54] = 33'h100000001;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000001;
      expv[57] = 33'h100000001;
      expv[58] = 33'h100000001;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000001;
      expv[61] = 33'h100000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000001;
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
