// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01292 dut (
    .clock(clk),
    .reset(in_vec[9:9]),
    .data_i(in_vec[8:1]),
    .writeEn(in_vec[0:0]),
    .data_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h335;
    stim[1] = 10'h32c;
    stim[2] = 10'h094;
    stim[3] = 10'h06a;
    stim[4] = 10'h0ab;
    stim[5] = 10'h187;
    stim[6] = 10'h015;
    stim[7] = 10'h08c;
    stim[8] = 10'h012;
    stim[9] = 10'h1dd;
    stim[10] = 10'h001;
    stim[11] = 10'h149;
    stim[12] = 10'h1c8;
    stim[13] = 10'h1cb;
    stim[14] = 10'h11e;
    stim[15] = 10'h0df;
    stim[16] = 10'h07f;
    stim[17] = 10'h171;
    stim[18] = 10'h079;
    stim[19] = 10'h101;
    stim[20] = 10'h0d8;
    stim[21] = 10'h1f4;
    stim[22] = 10'h089;
    stim[23] = 10'h0d2;
    stim[24] = 10'h081;
    stim[25] = 10'h122;
    stim[26] = 10'h133;
    stim[27] = 10'h025;
    stim[28] = 10'h0e9;
    stim[29] = 10'h0cf;
    stim[30] = 10'h0ff;
    stim[31] = 10'h0fa;
    stim[32] = 10'h189;
    stim[33] = 10'h1a6;
    stim[34] = 10'h014;
    stim[35] = 10'h02a;
    stim[36] = 10'h17f;
    stim[37] = 10'h072;
    stim[38] = 10'h164;
    stim[39] = 10'h0c3;
    stim[40] = 10'h009;
    stim[41] = 10'h035;
    stim[42] = 10'h00d;
    stim[43] = 10'h226;
    stim[44] = 10'h1fc;
    stim[45] = 10'h149;
    stim[46] = 10'h146;
    stim[47] = 10'h19e;
    stim[48] = 10'h127;
    stim[49] = 10'h06d;
    stim[50] = 10'h061;
    stim[51] = 10'h0d4;
    stim[52] = 10'h15f;
    stim[53] = 10'h1f8;
    stim[54] = 10'h1ef;
    stim[55] = 10'h103;
    stim[56] = 10'h03e;
    stim[57] = 10'h1b3;
    stim[58] = 10'h154;
    stim[59] = 10'h1ae;
    stim[60] = 10'h121;
    stim[61] = 10'h0dd;
    stim[62] = 10'h0ac;
    stim[63] = 10'h1d5;
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
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h55;
      expv[6] = 8'hc3;
      expv[7] = 8'h0a;
      expv[8] = 8'h0a;
      expv[9] = 8'h0a;
      expv[10] = 8'hee;
      expv[11] = 8'h00;
      expv[12] = 8'ha4;
      expv[13] = 8'ha4;
      expv[14] = 8'he5;
      expv[15] = 8'he5;
      expv[16] = 8'h6f;
      expv[17] = 8'h3f;
      expv[18] = 8'hb8;
      expv[19] = 8'h3c;
      expv[20] = 8'h80;
      expv[21] = 8'h80;
      expv[22] = 8'h80;
      expv[23] = 8'h44;
      expv[24] = 8'h44;
      expv[25] = 8'h40;
      expv[26] = 8'h40;
      expv[27] = 8'h99;
      expv[28] = 8'h12;
      expv[29] = 8'h74;
      expv[30] = 8'h67;
      expv[31] = 8'h7f;
      expv[32] = 8'h7f;
      expv[33] = 8'hc4;
      expv[34] = 8'hc4;
      expv[35] = 8'hc4;
      expv[36] = 8'hc4;
      expv[37] = 8'hbf;
      expv[38] = 8'hbf;
      expv[39] = 8'hbf;
      expv[40] = 8'h61;
      expv[41] = 8'h04;
      expv[42] = 8'h1a;
      expv[43] = 8'h06;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'ha4;
      expv[47] = 8'ha4;
      expv[48] = 8'ha4;
      expv[49] = 8'h93;
      expv[50] = 8'h36;
      expv[51] = 8'h30;
      expv[52] = 8'h30;
      expv[53] = 8'haf;
      expv[54] = 8'haf;
      expv[55] = 8'hf7;
      expv[56] = 8'h81;
      expv[57] = 8'h81;
      expv[58] = 8'hd9;
      expv[59] = 8'hd9;
      expv[60] = 8'hd9;
      expv[61] = 8'h90;
      expv[62] = 8'h6e;
      expv[63] = 8'h6e;
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
