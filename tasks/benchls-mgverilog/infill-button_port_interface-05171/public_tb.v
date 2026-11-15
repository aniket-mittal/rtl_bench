// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05171 dut (
    .clock(clk),
    .reset(in_vec[32:32]),
    .int_ack(in_vec[31:31]),
    .A(in_vec[30:15]),
    .Di(in_vec[14:7]),
    .rd_n(in_vec[6:6]),
    .wr_n(in_vec[5:5]),
    .cs(in_vec[4:4]),
    .button_data(in_vec[3:0]),
    .int_req(out_vec[10:10]),
    .Do(out_vec[9:2]),
    .button_sel(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h12bfe10c9;
    stim[1] = 33'h178a643d5;
    stim[2] = 33'h0077be322;
    stim[3] = 33'h048cac826;
    stim[4] = 33'h092d77c20;
    stim[5] = 33'h0e21b92b8;
    stim[6] = 33'h062de0057;
    stim[7] = 33'h06e5ec152;
    stim[8] = 33'h0fed10f89;
    stim[9] = 33'h03f59e8ac;
    stim[10] = 33'h06bbb655a;
    stim[11] = 33'h009568920;
    stim[12] = 33'h0cf8e84c9;
    stim[13] = 33'h0c6e4013f;
    stim[14] = 33'h024cab3e0;
    stim[15] = 33'h02650c13d;
    stim[16] = 33'h089b97acd;
    stim[17] = 33'h04c5a625d;
    stim[18] = 33'h084bfb8ad;
    stim[19] = 33'h08af82638;
    stim[20] = 33'h0675a090c;
    stim[21] = 33'h003c492ae;
    stim[22] = 33'h01889306d;
    stim[23] = 33'h01c7677d9;
    stim[24] = 33'h0fcf79ee7;
    stim[25] = 33'h09aa2d4bd;
    stim[26] = 33'h06cbe4590;
    stim[27] = 33'h0a5e515b3;
    stim[28] = 33'h0c9f83000;
    stim[29] = 33'h0341f554c;
    stim[30] = 33'h025b789ee;
    stim[31] = 33'h0d88f28b1;
    stim[32] = 33'h078197948;
    stim[33] = 33'h05fd61027;
    stim[34] = 33'h03b1dc3a7;
    stim[35] = 33'h0098af1e1;
    stim[36] = 33'h0759a7c98;
    stim[37] = 33'h066d2bae0;
    stim[38] = 33'h0d5486d71;
    stim[39] = 33'h034e5dc77;
    stim[40] = 33'h0250ed3a7;
    stim[41] = 33'h0d2f824f5;
    stim[42] = 33'h0001e55fb;
    stim[43] = 33'h02b341f87;
    stim[44] = 33'h06f999be5;
    stim[45] = 33'h0d42ac0fd;
    stim[46] = 33'h030ad6c89;
    stim[47] = 33'h04ce3893f;
    stim[48] = 33'h01fbf7345;
    stim[49] = 33'h0b23a1409;
    stim[50] = 33'h0a6d8441e;
    stim[51] = 33'h021b18229;
    stim[52] = 33'h00ff84c52;
    stim[53] = 33'h1e7734a39;
    stim[54] = 33'h033803c98;
    stim[55] = 33'h053ea1e8c;
    stim[56] = 33'h012f30842;
    stim[57] = 33'h0eaf30786;
    stim[58] = 33'h087544f52;
    stim[59] = 33'h00f1712f6;
    stim[60] = 33'h03c715d88;
    stim[61] = 33'h0b0afb7ce;
    stim[62] = 33'h0999d43f0;
    stim[63] = 33'h01333e003;
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
      expv[0] = 11'hxfx;
      expv[1] = 11'h3xx;
      expv[2] = 11'h3fx;
      expv[3] = 11'h3fx;
      expv[4] = 11'h3fx;
      expv[5] = 11'h3xx;
      expv[6] = 11'h3xx;
      expv[7] = 11'h3xx;
      expv[8] = 11'h3fx;
      expv[9] = 11'h3fx;
      expv[10] = 11'h3xx;
      expv[11] = 11'h3fx;
      expv[12] = 11'h3fx;
      expv[13] = 11'h3xx;
      expv[14] = 11'h3fx;
      expv[15] = 11'h3xx;
      expv[16] = 11'h3fx;
      expv[17] = 11'h3xx;
      expv[18] = 11'h3fx;
      expv[19] = 11'h3xx;
      expv[20] = 11'h3fx;
      expv[21] = 11'h3fx;
      expv[22] = 11'h3fx;
      expv[23] = 11'h3xx;
      expv[24] = 11'h3fx;
      expv[25] = 11'h3xx;
      expv[26] = 11'h3xx;
      expv[27] = 11'h3xx;
      expv[28] = 11'h3fx;
      expv[29] = 11'h3fx;
      expv[30] = 11'h3fx;
      expv[31] = 11'h3xx;
      expv[32] = 11'h3fx;
      expv[33] = 11'h3fx;
      expv[34] = 11'h3fx;
      expv[35] = 11'h3fx;
      expv[36] = 11'h3xx;
      expv[37] = 11'h3fx;
      expv[38] = 11'h3xx;
      expv[39] = 11'h3xx;
      expv[40] = 11'h3fx;
      expv[41] = 11'h3xx;
      expv[42] = 11'h3xx;
      expv[43] = 11'h3fx;
      expv[44] = 11'h3fx;
      expv[45] = 11'h3xx;
      expv[46] = 11'h3fx;
      expv[47] = 11'h3xx;
      expv[48] = 11'h3fx;
      expv[49] = 11'h3fx;
      expv[50] = 11'h3xx;
      expv[51] = 11'h3fx;
      expv[52] = 11'h3xx;
      expv[53] = 11'h3xx;
      expv[54] = 11'h3xx;
      expv[55] = 11'h3fx;
      expv[56] = 11'h3fx;
      expv[57] = 11'h3fx;
      expv[58] = 11'h3xx;
      expv[59] = 11'h3xx;
      expv[60] = 11'h3fx;
      expv[61] = 11'h3fx;
      expv[62] = 11'h3xx;
      expv[63] = 11'h3fx;
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
