// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10063 dut (
    .clk(clk),
    .redin(in_vec[7:5]),
    .greenin(in_vec[4:2]),
    .bluein(in_vec[1:0]),
    .hc(out_vec[29:20]),
    .vc(out_vec[19:10]),
    .hsync(out_vec[9:9]),
    .vsync(out_vec[8:8]),
    .red(out_vec[7:5]),
    .green(out_vec[4:2]),
    .blue(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h05;
    stim[1] = 8'hf7;
    stim[2] = 8'ha1;
    stim[3] = 8'hf6;
    stim[4] = 8'hf1;
    stim[5] = 8'h70;
    stim[6] = 8'h18;
    stim[7] = 8'hf7;
    stim[8] = 8'h0f;
    stim[9] = 8'h45;
    stim[10] = 8'hda;
    stim[11] = 8'h86;
    stim[12] = 8'h4c;
    stim[13] = 8'h63;
    stim[14] = 8'h65;
    stim[15] = 8'hc5;
    stim[16] = 8'h73;
    stim[17] = 8'h17;
    stim[18] = 8'hc5;
    stim[19] = 8'hdc;
    stim[20] = 8'h57;
    stim[21] = 8'hbb;
    stim[22] = 8'h51;
    stim[23] = 8'h77;
    stim[24] = 8'he2;
    stim[25] = 8'hd3;
    stim[26] = 8'he7;
    stim[27] = 8'hdb;
    stim[28] = 8'he3;
    stim[29] = 8'h30;
    stim[30] = 8'hb6;
    stim[31] = 8'hc5;
    stim[32] = 8'h6c;
    stim[33] = 8'h20;
    stim[34] = 8'hae;
    stim[35] = 8'h1b;
    stim[36] = 8'hb0;
    stim[37] = 8'hee;
    stim[38] = 8'he6;
    stim[39] = 8'h70;
    stim[40] = 8'h9c;
    stim[41] = 8'h0f;
    stim[42] = 8'h0f;
    stim[43] = 8'hae;
    stim[44] = 8'he2;
    stim[45] = 8'hb6;
    stim[46] = 8'h91;
    stim[47] = 8'h29;
    stim[48] = 8'h5e;
    stim[49] = 8'h58;
    stim[50] = 8'h69;
    stim[51] = 8'h51;
    stim[52] = 8'he9;
    stim[53] = 8'h18;
    stim[54] = 8'h11;
    stim[55] = 8'h8c;
    stim[56] = 8'h80;
    stim[57] = 8'hb1;
    stim[58] = 8'hb6;
    stim[59] = 8'h9d;
    stim[60] = 8'hc2;
    stim[61] = 8'h22;
    stim[62] = 8'h14;
    stim[63] = 8'hfb;
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
      expv[0] = 30'hxxxxxx00;
      expv[1] = 30'h00000000;
      expv[2] = 30'h00100000;
      expv[3] = 30'h00200000;
      expv[4] = 30'h00300000;
      expv[5] = 30'h00400000;
      expv[6] = 30'h00500000;
      expv[7] = 30'h00600000;
      expv[8] = 30'h00700000;
      expv[9] = 30'h00800000;
      expv[10] = 30'h00900000;
      expv[11] = 30'h00a00000;
      expv[12] = 30'h00b00000;
      expv[13] = 30'h00c00000;
      expv[14] = 30'h00d00000;
      expv[15] = 30'h00e00000;
      expv[16] = 30'h00f00000;
      expv[17] = 30'h01000000;
      expv[18] = 30'h01100000;
      expv[19] = 30'h01200000;
      expv[20] = 30'h01300000;
      expv[21] = 30'h01400000;
      expv[22] = 30'h01500000;
      expv[23] = 30'h01600000;
      expv[24] = 30'h01700000;
      expv[25] = 30'h01800000;
      expv[26] = 30'h01900000;
      expv[27] = 30'h01a00000;
      expv[28] = 30'h01b00000;
      expv[29] = 30'h01c00000;
      expv[30] = 30'h01d00000;
      expv[31] = 30'h01e00000;
      expv[32] = 30'h01f00000;
      expv[33] = 30'h02000000;
      expv[34] = 30'h02100000;
      expv[35] = 30'h02200000;
      expv[36] = 30'h02300000;
      expv[37] = 30'h02400000;
      expv[38] = 30'h02500000;
      expv[39] = 30'h02600000;
      expv[40] = 30'h02700000;
      expv[41] = 30'h02800000;
      expv[42] = 30'h02900000;
      expv[43] = 30'h02a00000;
      expv[44] = 30'h02b00000;
      expv[45] = 30'h02c00000;
      expv[46] = 30'h02d00000;
      expv[47] = 30'h02e00000;
      expv[48] = 30'h02f00000;
      expv[49] = 30'h03000000;
      expv[50] = 30'h03100000;
      expv[51] = 30'h03200000;
      expv[52] = 30'h03300000;
      expv[53] = 30'h03400000;
      expv[54] = 30'h03500000;
      expv[55] = 30'h03600000;
      expv[56] = 30'h03700000;
      expv[57] = 30'h03800000;
      expv[58] = 30'h03900000;
      expv[59] = 30'h03a00000;
      expv[60] = 30'h03b00000;
      expv[61] = 30'h03c00000;
      expv[62] = 30'h03d00000;
      expv[63] = 30'h03e00000;
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
