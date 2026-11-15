// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fifomem dut (
    .wclk(clk),
    .wclken(in_vec[19:19]),
    .waddr(in_vec[18:15]),
    .wdata(in_vec[14:7]),
    .wfull(in_vec[6:6]),
    .rclk(in_vec[5:5]),
    .rclken(in_vec[4:4]),
    .raddr(in_vec[3:0]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h9da07;
    stim[1] = 20'h68f68;
    stim[2] = 20'h77eeb;
    stim[3] = 20'hf5133;
    stim[4] = 20'h4e140;
    stim[5] = 20'h9c661;
    stim[6] = 20'h426e2;
    stim[7] = 20'h4f46b;
    stim[8] = 20'h31a9d;
    stim[9] = 20'h23d5f;
    stim[10] = 20'h116d7;
    stim[11] = 20'hc0cbe;
    stim[12] = 20'h7c379;
    stim[13] = 20'h5141d;
    stim[14] = 20'h3f6d1;
    stim[15] = 20'hac5b4;
    stim[16] = 20'h7d754;
    stim[17] = 20'h91825;
    stim[18] = 20'h69a0c;
    stim[19] = 20'hb384b;
    stim[20] = 20'h9e2d1;
    stim[21] = 20'h19fca;
    stim[22] = 20'hcd6f6;
    stim[23] = 20'h67bcb;
    stim[24] = 20'h0571f;
    stim[25] = 20'hc3789;
    stim[26] = 20'he8b60;
    stim[27] = 20'he2c8f;
    stim[28] = 20'h5401d;
    stim[29] = 20'h54aea;
    stim[30] = 20'h86346;
    stim[31] = 20'h5b03e;
    stim[32] = 20'hce11e;
    stim[33] = 20'h189a1;
    stim[34] = 20'hb8a7b;
    stim[35] = 20'h6d9c0;
    stim[36] = 20'h431d3;
    stim[37] = 20'h41a05;
    stim[38] = 20'h00cb7;
    stim[39] = 20'h280b3;
    stim[40] = 20'h3e213;
    stim[41] = 20'h7086f;
    stim[42] = 20'ha12a1;
    stim[43] = 20'hd25eb;
    stim[44] = 20'h30740;
    stim[45] = 20'h591f7;
    stim[46] = 20'h85a23;
    stim[47] = 20'h4ab9d;
    stim[48] = 20'h09e9a;
    stim[49] = 20'h6c9ee;
    stim[50] = 20'h92a60;
    stim[51] = 20'h650a0;
    stim[52] = 20'hcd4aa;
    stim[53] = 20'hf0127;
    stim[54] = 20'h02ebc;
    stim[55] = 20'hdb36f;
    stim[56] = 20'h7a49b;
    stim[57] = 20'he9567;
    stim[58] = 20'h91370;
    stim[59] = 20'hc8494;
    stim[60] = 20'h394a6;
    stim[61] = 20'hee1bf;
    stim[62] = 20'h87c10;
    stim[63] = 20'h4045f;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hb4;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'ha2;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'h8b;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'ha2;
      expv[32] = 8'ha2;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hb4;
      expv[37] = 8'h8b;
      expv[38] = 8'hxx;
      expv[39] = 8'hb4;
      expv[40] = 8'hb4;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hxx;
      expv[44] = 8'hxx;
      expv[45] = 8'hxx;
      expv[46] = 8'hb4;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'ha2;
      expv[50] = 8'hb4;
      expv[51] = 8'hb4;
      expv[52] = 8'hxx;
      expv[53] = 8'hxx;
      expv[54] = 8'h59;
      expv[55] = 8'hxx;
      expv[56] = 8'hxx;
      expv[57] = 8'hxx;
      expv[58] = 8'hb4;
      expv[59] = 8'h25;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hb4;
      expv[63] = 8'hxx;
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
