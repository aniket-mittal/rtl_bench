// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06623 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .switches(in_vec[15:0]),
    .leds(out_vec[63:48]),
    .tiles(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1c0df;
    stim[1] = 17'h1bc03;
    stim[2] = 17'h04d93;
    stim[3] = 17'h00535;
    stim[4] = 17'h0fb89;
    stim[5] = 17'h0c2bb;
    stim[6] = 17'h043ad;
    stim[7] = 17'h02295;
    stim[8] = 17'h0330d;
    stim[9] = 17'h03856;
    stim[10] = 17'h0a0b8;
    stim[11] = 17'h0400b;
    stim[12] = 17'h088a6;
    stim[13] = 17'h0bbe5;
    stim[14] = 17'h05a87;
    stim[15] = 17'h0d571;
    stim[16] = 17'h05a72;
    stim[17] = 17'h04ce2;
    stim[18] = 17'h16dd4;
    stim[19] = 17'h0cccb;
    stim[20] = 17'h0aec0;
    stim[21] = 17'h075dd;
    stim[22] = 17'h0fae4;
    stim[23] = 17'h0e4ff;
    stim[24] = 17'h0ca80;
    stim[25] = 17'h09613;
    stim[26] = 17'h0644e;
    stim[27] = 17'h09815;
    stim[28] = 17'h03c74;
    stim[29] = 17'h06c4f;
    stim[30] = 17'h08a57;
    stim[31] = 17'h0fd43;
    stim[32] = 17'h08e04;
    stim[33] = 17'h0c94d;
    stim[34] = 17'h054d1;
    stim[35] = 17'h0f15d;
    stim[36] = 17'h0bddc;
    stim[37] = 17'h06204;
    stim[38] = 17'h0a719;
    stim[39] = 17'h06c7d;
    stim[40] = 17'h07eab;
    stim[41] = 17'h0a99b;
    stim[42] = 17'h0a5b6;
    stim[43] = 17'h07bca;
    stim[44] = 17'h07e2f;
    stim[45] = 17'h029d3;
    stim[46] = 17'h02c31;
    stim[47] = 17'h049f1;
    stim[48] = 17'h0dc04;
    stim[49] = 17'h0d77e;
    stim[50] = 17'h03de1;
    stim[51] = 17'h060b7;
    stim[52] = 17'h0bb83;
    stim[53] = 17'h00695;
    stim[54] = 17'h018de;
    stim[55] = 17'h05ca4;
    stim[56] = 17'h0c719;
    stim[57] = 17'h0a026;
    stim[58] = 17'h072a4;
    stim[59] = 17'h0fd27;
    stim[60] = 17'h087d5;
    stim[61] = 17'h06443;
    stim[62] = 17'h09f10;
    stim[63] = 17'h03f55;
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
      expv[0] = 64'h0000xxxxxxxxxxxx;
      expv[1] = 64'h0000xxxxxxxxxxxx;
      expv[2] = 64'h0000xxxxxxxxxxxx;
      expv[3] = 64'h0000xxxxxxxxxxxx;
      expv[4] = 64'h0000xxxxxxxxxxxx;
      expv[5] = 64'h0000xxxxxxxxxxxx;
      expv[6] = 64'h0000xxxxxxxxxxxx;
      expv[7] = 64'h0000xxxxxxxxxxxx;
      expv[8] = 64'h0000xxxxxxxxxxxx;
      expv[9] = 64'h0000xxxxxxxxxxxx;
      expv[10] = 64'h0000xxxxxxxxxxxx;
      expv[11] = 64'h0000xxxxxxxxxxxx;
      expv[12] = 64'h0000xxxxxxxxxxxx;
      expv[13] = 64'h0000xxxxxxxxxxxx;
      expv[14] = 64'h0000xxxxxxxxxxxx;
      expv[15] = 64'h0000xxxxxxxxxxxx;
      expv[16] = 64'h0000xxxxxxxxxxxx;
      expv[17] = 64'h0000xxxxxxxxxxxx;
      expv[18] = 64'h0000xxxxxxxxxxxx;
      expv[19] = 64'h0000xxxxxxxxxxxx;
      expv[20] = 64'h0000xxxxxxxxxxxx;
      expv[21] = 64'h0000xxxxxxxxxxxx;
      expv[22] = 64'h0000xxxxxxxxxxxx;
      expv[23] = 64'h0000xxxxxxxxxxxx;
      expv[24] = 64'h0000xxxxxxxxxxxx;
      expv[25] = 64'h0000xxxxxxxxxxxx;
      expv[26] = 64'h0000xxxxxxxxxxxx;
      expv[27] = 64'h0000xxxxxxxxxxxx;
      expv[28] = 64'h0000xxxxxxxxxxxx;
      expv[29] = 64'h0000xxxxxxxxxxxx;
      expv[30] = 64'h0000xxxxxxxxxxxx;
      expv[31] = 64'h0000xxxxxxxxxxxx;
      expv[32] = 64'h0000xxxxxxxxxxxx;
      expv[33] = 64'h0000xxxxxxxxxxxx;
      expv[34] = 64'h0000xxxxxxxxxxxx;
      expv[35] = 64'h0000xxxxxxxxxxxx;
      expv[36] = 64'h0000xxxxxxxxxxxx;
      expv[37] = 64'h0000xxxxxxxxxxxx;
      expv[38] = 64'h0000xxxxxxxxxxxx;
      expv[39] = 64'h0000xxxxxxxxxxxx;
      expv[40] = 64'h0000xxxxxxxxxxxx;
      expv[41] = 64'h0000xxxxxxxxxxxx;
      expv[42] = 64'h0000xxxxxxxxxxxx;
      expv[43] = 64'h0000xxxxxxxxxxxx;
      expv[44] = 64'h0000xxxxxxxxxxxx;
      expv[45] = 64'h0000xxxxxxxxxxxx;
      expv[46] = 64'h0000xxxxxxxxxxxx;
      expv[47] = 64'h0000xxxxxxxxxxxx;
      expv[48] = 64'h0000xxxxxxxxxxxx;
      expv[49] = 64'h0000xxxxxxxxxxxx;
      expv[50] = 64'h0000xxxxxxxxxxxx;
      expv[51] = 64'h0000xxxxxxxxxxxx;
      expv[52] = 64'h0000xxxxxxxxxxxx;
      expv[53] = 64'h0000xxxxxxxxxxxx;
      expv[54] = 64'h0000xxxxxxxxxxxx;
      expv[55] = 64'h0000xxxxxxxxxxxx;
      expv[56] = 64'h0000xxxxxxxxxxxx;
      expv[57] = 64'h0000xxxxxxxxxxxx;
      expv[58] = 64'h0000xxxxxxxxxxxx;
      expv[59] = 64'h0000xxxxxxxxxxxx;
      expv[60] = 64'h0000xxxxxxxxxxxx;
      expv[61] = 64'h0000xxxxxxxxxxxx;
      expv[62] = 64'h0000xxxxxxxxxxxx;
      expv[63] = 64'h0000xxxxxxxxxxxx;
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
