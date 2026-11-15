// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00606 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .input_axis_tdata(in_vec[11:4]),
    .input_axis_tvalid(in_vec[3:3]),
    .input_axis_tlast(in_vec[2:2]),
    .input_axis_tuser(in_vec[1:1]),
    .output_axis_tready(in_vec[0:0]),
    .input_axis_tready(out_vec[13:13]),
    .output_axis_tdata(out_vec[12:5]),
    .output_axis_tvalid(out_vec[4:4]),
    .output_axis_tlast(out_vec[3:3]),
    .output_axis_tuser(out_vec[2:2]),
    .busy(out_vec[1:1]),
    .error_bad_fcs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1290;
    stim[1] = 13'h1ba0;
    stim[2] = 13'h0f12;
    stim[3] = 13'h0d9f;
    stim[4] = 13'h0f32;
    stim[5] = 13'h0427;
    stim[6] = 13'h0a77;
    stim[7] = 13'h0701;
    stim[8] = 13'h0ded;
    stim[9] = 13'h0655;
    stim[10] = 13'h0e11;
    stim[11] = 13'h0673;
    stim[12] = 13'h04d7;
    stim[13] = 13'h024e;
    stim[14] = 13'h033f;
    stim[15] = 13'h0a52;
    stim[16] = 13'h0109;
    stim[17] = 13'h0715;
    stim[18] = 13'h0984;
    stim[19] = 13'h0401;
    stim[20] = 13'h0058;
    stim[21] = 13'h072a;
    stim[22] = 13'h00ac;
    stim[23] = 13'h0b1d;
    stim[24] = 13'h0c9a;
    stim[25] = 13'h0a50;
    stim[26] = 13'h05c2;
    stim[27] = 13'h0203;
    stim[28] = 13'h079f;
    stim[29] = 13'h0b95;
    stim[30] = 13'h0bd7;
    stim[31] = 13'h037c;
    stim[32] = 13'h074a;
    stim[33] = 13'h083b;
    stim[34] = 13'h0d5d;
    stim[35] = 13'h004a;
    stim[36] = 13'h053d;
    stim[37] = 13'h0547;
    stim[38] = 13'h0113;
    stim[39] = 13'h03b2;
    stim[40] = 13'h0161;
    stim[41] = 13'h0b3d;
    stim[42] = 13'h0002;
    stim[43] = 13'h0aba;
    stim[44] = 13'h09ef;
    stim[45] = 13'h0ab3;
    stim[46] = 13'h010f;
    stim[47] = 13'h076b;
    stim[48] = 13'h06fa;
    stim[49] = 13'h0bb1;
    stim[50] = 13'h048b;
    stim[51] = 13'h0f7d;
    stim[52] = 13'h00f3;
    stim[53] = 13'h0e0b;
    stim[54] = 13'h04d5;
    stim[55] = 13'h0256;
    stim[56] = 13'h05aa;
    stim[57] = 13'h0ee5;
    stim[58] = 13'h03f3;
    stim[59] = 13'h0660;
    stim[60] = 13'h04f6;
    stim[61] = 13'h0848;
    stim[62] = 13'h00a6;
    stim[63] = 13'h09c6;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h2000;
      expv[4] = 14'h2000;
      expv[5] = 14'h2000;
      expv[6] = 14'h2000;
      expv[7] = 14'h2000;
      expv[8] = 14'h2000;
      expv[9] = 14'h2000;
      expv[10] = 14'h2000;
      expv[11] = 14'h2000;
      expv[12] = 14'h2000;
      expv[13] = 14'h2000;
      expv[14] = 14'h2000;
      expv[15] = 14'h2000;
      expv[16] = 14'h3b20;
      expv[17] = 14'h3b32;
      expv[18] = 14'h3bc2;
      expv[19] = 14'h3bc2;
      expv[20] = 14'h3bc2;
      expv[21] = 14'h3bd2;
      expv[22] = 14'h1bd2;
      expv[23] = 14'h1bd2;
      expv[24] = 14'h2492;
      expv[25] = 14'h0492;
      expv[26] = 14'h0492;
      expv[27] = 14'h0492;
      expv[28] = 14'h2672;
      expv[29] = 14'h221d;
      expv[30] = 14'h20a0;
      expv[31] = 14'h20a0;
      expv[32] = 14'h20a0;
      expv[33] = 14'h2e40;
      expv[34] = 14'h3920;
      expv[35] = 14'h2f20;
      expv[36] = 14'h26f2;
      expv[37] = 14'h2e9d;
      expv[38] = 14'h3060;
      expv[39] = 14'h3060;
      expv[40] = 14'h3060;
      expv[41] = 14'h3060;
      expv[42] = 14'h3060;
      expv[43] = 14'h3aa0;
      expv[44] = 14'h3aa0;
      expv[45] = 14'h2080;
      expv[46] = 14'h2a60;
      expv[47] = 14'h2a60;
      expv[48] = 14'h3672;
      expv[49] = 14'h1672;
      expv[50] = 14'h3572;
      expv[51] = 14'h33d2;
      expv[52] = 14'h221d;
      expv[53] = 14'h2ec0;
      expv[54] = 14'h2ec0;
      expv[55] = 14'h2de0;
      expv[56] = 14'h2de0;
      expv[57] = 14'h2de0;
      expv[58] = 14'h2900;
      expv[59] = 14'h2900;
      expv[60] = 14'h2900;
      expv[61] = 14'h2900;
      expv[62] = 14'h2900;
      expv[63] = 14'h3ee0;
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
