// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02569 dut (
    .clk(clk),
    .reset(in_vec[30:30]),
    .enable(in_vec[29:29]),
    .joint_mode(in_vec[28:28]),
    .page_cross(in_vec[27:27]),
    .joint_req(in_vec[26:26]),
    .prio_top(in_vec[25:25]),
    .prio_high(in_vec[24:24]),
    .prio_top_num(in_vec[23:21]),
    .prio_high_num(in_vec[20:18]),
    .hold(in_vec[17:17]),
    .ch_ready(in_vec[16:9]),
    .ch_active(in_vec[8:1]),
    .finish(in_vec[0:0]),
    .ch_go_out(out_vec[4:4]),
    .ch_num(out_vec[3:1]),
    .ch_last(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h738c1f08;
    stim[1] = 31'h7d365701;
    stim[2] = 31'h03428199;
    stim[3] = 31'h02ee84b8;
    stim[4] = 31'h3f710f61;
    stim[5] = 31'h234b7229;
    stim[6] = 31'h359f4c10;
    stim[7] = 31'h1f23a531;
    stim[8] = 31'h30c98ed0;
    stim[9] = 31'h13c7368c;
    stim[10] = 31'h19176abe;
    stim[11] = 31'h0fff56fb;
    stim[12] = 31'h3132ccc4;
    stim[13] = 31'h1b5bfa80;
    stim[14] = 31'h10dac34b;
    stim[15] = 31'h31c5a8ca;
    stim[16] = 31'h323874d4;
    stim[17] = 31'h2fb804e0;
    stim[18] = 31'h29e2e309;
    stim[19] = 31'h2568585b;
    stim[20] = 31'h0bbc7761;
    stim[21] = 31'h1b77f0d5;
    stim[22] = 31'h1055137d;
    stim[23] = 31'h0e2a44a6;
    stim[24] = 31'h214c42c9;
    stim[25] = 31'h1c48af0f;
    stim[26] = 31'h1a84f685;
    stim[27] = 31'h21d3fb20;
    stim[28] = 31'h12907aed;
    stim[29] = 31'h1ef81c6c;
    stim[30] = 31'h0f9a764d;
    stim[31] = 31'h19116f10;
    stim[32] = 31'h2d4f8e01;
    stim[33] = 31'h243ebad5;
    stim[34] = 31'h108310dd;
    stim[35] = 31'h18128c44;
    stim[36] = 31'h32412652;
    stim[37] = 31'h0ea3fbc9;
    stim[38] = 31'h33e23d82;
    stim[39] = 31'h211ffcdb;
    stim[40] = 31'h2e6344fd;
    stim[41] = 31'h0b0d6415;
    stim[42] = 31'h0ef0e8f4;
    stim[43] = 31'h26f61c2e;
    stim[44] = 31'h2cd37b2c;
    stim[45] = 31'h51023e76;
    stim[46] = 31'h6f17b552;
    stim[47] = 31'h06026f77;
    stim[48] = 31'h1256b881;
    stim[49] = 31'h21eab4d4;
    stim[50] = 31'h3a460ccf;
    stim[51] = 31'h0eadd720;
    stim[52] = 31'h207e4ada;
    stim[53] = 31'h67e3186c;
    stim[54] = 31'h06a0150a;
    stim[55] = 31'h069ab554;
    stim[56] = 31'h388b5c16;
    stim[57] = 31'h325b60b5;
    stim[58] = 31'h25a9fc97;
    stim[59] = 31'h379df8cf;
    stim[60] = 31'h236e87c9;
    stim[61] = 31'h13977e31;
    stim[62] = 31'h0da0ea8a;
    stim[63] = 31'h2e76293b;
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
      expv[0] = 5'h11;
      expv[1] = 5'h11;
      expv[2] = 5'h11;
      expv[3] = 5'h11;
      expv[4] = 5'h11;
      expv[5] = 5'h11;
      expv[6] = 5'h11;
      expv[7] = 5'h11;
      expv[8] = 5'h11;
      expv[9] = 5'h11;
      expv[10] = 5'h11;
      expv[11] = 5'h11;
      expv[12] = 5'h11;
      expv[13] = 5'h11;
      expv[14] = 5'h11;
      expv[15] = 5'h11;
      expv[16] = 5'h11;
      expv[17] = 5'h11;
      expv[18] = 5'h11;
      expv[19] = 5'h11;
      expv[20] = 5'h11;
      expv[21] = 5'h11;
      expv[22] = 5'h11;
      expv[23] = 5'h11;
      expv[24] = 5'h11;
      expv[25] = 5'h11;
      expv[26] = 5'h11;
      expv[27] = 5'h11;
      expv[28] = 5'h11;
      expv[29] = 5'h11;
      expv[30] = 5'h11;
      expv[31] = 5'h11;
      expv[32] = 5'h11;
      expv[33] = 5'h11;
      expv[34] = 5'h11;
      expv[35] = 5'h11;
      expv[36] = 5'h11;
      expv[37] = 5'h11;
      expv[38] = 5'h11;
      expv[39] = 5'h11;
      expv[40] = 5'h11;
      expv[41] = 5'h11;
      expv[42] = 5'h11;
      expv[43] = 5'h11;
      expv[44] = 5'h11;
      expv[45] = 5'h11;
      expv[46] = 5'h11;
      expv[47] = 5'h11;
      expv[48] = 5'h11;
      expv[49] = 5'h11;
      expv[50] = 5'h11;
      expv[51] = 5'h11;
      expv[52] = 5'h11;
      expv[53] = 5'h11;
      expv[54] = 5'h11;
      expv[55] = 5'h11;
      expv[56] = 5'h11;
      expv[57] = 5'h11;
      expv[58] = 5'h11;
      expv[59] = 5'h11;
      expv[60] = 5'h11;
      expv[61] = 5'h11;
      expv[62] = 5'h11;
      expv[63] = 5'h11;
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
