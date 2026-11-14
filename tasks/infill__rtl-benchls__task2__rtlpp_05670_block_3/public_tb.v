// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05670 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h117a0b;
    stim[1] = 22'h0c8196;
    stim[2] = 22'h21501c;
    stim[3] = 22'h03386f;
    stim[4] = 22'h1aede2;
    stim[5] = 22'h36182b;
    stim[6] = 22'h0eb7b5;
    stim[7] = 22'h025ccb;
    stim[8] = 22'h06b36c;
    stim[9] = 22'h1a28b6;
    stim[10] = 22'h229a11;
    stim[11] = 22'h0fc9a4;
    stim[12] = 22'h0aeafb;
    stim[13] = 22'h16c4b6;
    stim[14] = 22'h064ce8;
    stim[15] = 22'h02bddf;
    stim[16] = 22'h12cbf5;
    stim[17] = 22'h22093b;
    stim[18] = 22'h039554;
    stim[19] = 22'h3fb22a;
    stim[20] = 22'h2e24d6;
    stim[21] = 22'h23428e;
    stim[22] = 22'h1f1510;
    stim[23] = 22'h377b2d;
    stim[24] = 22'h338434;
    stim[25] = 22'h2f8cc0;
    stim[26] = 22'h3afef0;
    stim[27] = 22'h2ae1c4;
    stim[28] = 22'h136161;
    stim[29] = 22'h277a77;
    stim[30] = 22'h332fb2;
    stim[31] = 22'h36f36c;
    stim[32] = 22'h0364c2;
    stim[33] = 22'h2a2ba2;
    stim[34] = 22'h3f3f3b;
    stim[35] = 22'h232564;
    stim[36] = 22'h13cc13;
    stim[37] = 22'h01a943;
    stim[38] = 22'h3b7fa7;
    stim[39] = 22'h13059f;
    stim[40] = 22'h26e0f0;
    stim[41] = 22'h1683e8;
    stim[42] = 22'h0fe22f;
    stim[43] = 22'h33ca6e;
    stim[44] = 22'h372077;
    stim[45] = 22'h23dff2;
    stim[46] = 22'h3fb760;
    stim[47] = 22'h079bac;
    stim[48] = 22'h0b4c19;
    stim[49] = 22'h22e943;
    stim[50] = 22'h3fcf78;
    stim[51] = 22'h27dd78;
    stim[52] = 22'h0a221f;
    stim[53] = 22'h168c0b;
    stim[54] = 22'h2bb884;
    stim[55] = 22'h1a4aca;
    stim[56] = 22'h0b2ce6;
    stim[57] = 22'h07c261;
    stim[58] = 22'h369dea;
    stim[59] = 22'h0f535a;
    stim[60] = 22'h1ea099;
    stim[61] = 22'h33ca24;
    stim[62] = 22'h060d31;
    stim[63] = 22'h0b5f23;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00002;
      expv[9] = 17'h00002;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00005;
      expv[13] = 17'h00005;
      expv[14] = 17'h0c34f;
      expv[15] = 17'h00002;
      expv[16] = 17'h00000;
      expv[17] = 17'h0c4b6;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h0c4b6;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h0c4b6;
      expv[30] = 17'h0c4b6;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h0c4b6;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h0c34f;
      expv[41] = 17'h00000;
      expv[42] = 17'h0c34f;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h0c34f;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h0c34f;
      expv[51] = 17'h00000;
      expv[52] = 17'h0c34f;
      expv[53] = 17'h00000;
      expv[54] = 17'h083e8;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
