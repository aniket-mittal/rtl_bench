// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03301 dut (
    .clk_i(clk),
    .reset_i(in_vec[10:10]),
    .write_i(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .read_i(in_vec[0:0]),
    .data_out(out_vec[18:11]),
    .valid_o(out_vec[10:10]),
    .full_o(out_vec[9:9]),
    .empty_o(out_vec[8:8]),
    .data_count_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h445;
    stim[1] = 11'h4a7;
    stim[2] = 11'h02e;
    stim[3] = 11'h3a3;
    stim[4] = 11'h267;
    stim[5] = 11'h349;
    stim[6] = 11'h2a6;
    stim[7] = 11'h34b;
    stim[8] = 11'h191;
    stim[9] = 11'h322;
    stim[10] = 11'h343;
    stim[11] = 11'h2f0;
    stim[12] = 11'h082;
    stim[13] = 11'h292;
    stim[14] = 11'h2c9;
    stim[15] = 11'h18f;
    stim[16] = 11'h302;
    stim[17] = 11'h2a1;
    stim[18] = 11'h297;
    stim[19] = 11'h004;
    stim[20] = 11'h1ea;
    stim[21] = 11'h1b4;
    stim[22] = 11'h324;
    stim[23] = 11'h0c5;
    stim[24] = 11'h147;
    stim[25] = 11'h183;
    stim[26] = 11'h2d4;
    stim[27] = 11'h351;
    stim[28] = 11'h1fc;
    stim[29] = 11'h12a;
    stim[30] = 11'h14c;
    stim[31] = 11'h133;
    stim[32] = 11'h09f;
    stim[33] = 11'h774;
    stim[34] = 11'h256;
    stim[35] = 11'h167;
    stim[36] = 11'h1c5;
    stim[37] = 11'h064;
    stim[38] = 11'h2cb;
    stim[39] = 11'h0e8;
    stim[40] = 11'h151;
    stim[41] = 11'h20b;
    stim[42] = 11'h2a5;
    stim[43] = 11'h020;
    stim[44] = 11'h3bb;
    stim[45] = 11'h3cf;
    stim[46] = 11'h097;
    stim[47] = 11'h38b;
    stim[48] = 11'h06a;
    stim[49] = 11'h0da;
    stim[50] = 11'h260;
    stim[51] = 11'h0ff;
    stim[52] = 11'h0df;
    stim[53] = 11'h13a;
    stim[54] = 11'h3f7;
    stim[55] = 11'h284;
    stim[56] = 11'h19c;
    stim[57] = 11'h356;
    stim[58] = 11'h596;
    stim[59] = 11'h35d;
    stim[60] = 11'h2e3;
    stim[61] = 11'h34d;
    stim[62] = 11'h337;
    stim[63] = 11'h26a;
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
      expv[0] = 19'h00100;
      expv[1] = 19'h00100;
      expv[2] = 19'h00100;
      expv[3] = 19'h00100;
      expv[4] = 19'h00100;
      expv[5] = 19'h00100;
      expv[6] = 19'h00100;
      expv[7] = 19'h00001;
      expv[8] = 19'h68c01;
      expv[9] = 19'h19d00;
      expv[10] = 19'h19801;
      expv[11] = 19'h52401;
      expv[12] = 19'h52002;
      expv[13] = 19'h52002;
      expv[14] = 19'h52003;
      expv[15] = 19'h29c03;
      expv[16] = 19'h52c02;
      expv[17] = 19'h52803;
      expv[18] = 19'h48c03;
      expv[19] = 19'h50c03;
      expv[20] = 19'h50803;
      expv[21] = 19'h50803;
      expv[22] = 19'h50803;
      expv[23] = 19'h50804;
      expv[24] = 19'h3c403;
      expv[25] = 19'h24c02;
      expv[26] = 19'h32401;
      expv[27] = 19'h32002;
      expv[28] = 19'h40c02;
      expv[29] = 19'h40802;
      expv[30] = 19'h40802;
      expv[31] = 19'h40802;
      expv[32] = 19'h28401;
      expv[33] = 19'h25d00;
      expv[34] = 19'h00100;
      expv[35] = 19'h00001;
      expv[36] = 19'h15d00;
      expv[37] = 19'h15900;
      expv[38] = 19'h15900;
      expv[39] = 19'h15900;
      expv[40] = 19'h15900;
      expv[41] = 19'h15900;
      expv[42] = 19'h15900;
      expv[43] = 19'h15900;
      expv[44] = 19'h15900;
      expv[45] = 19'h15900;
      expv[46] = 19'h15900;
      expv[47] = 19'h15900;
      expv[48] = 19'h15900;
      expv[49] = 19'h15900;
      expv[50] = 19'h15900;
      expv[51] = 19'h15801;
      expv[52] = 19'h32d00;
      expv[53] = 19'h32900;
      expv[54] = 19'h32900;
      expv[55] = 19'h32900;
      expv[56] = 19'h32801;
      expv[57] = 19'h32801;
      expv[58] = 19'h32802;
      expv[59] = 19'h00100;
      expv[60] = 19'h00100;
      expv[61] = 19'h00100;
      expv[62] = 19'h00100;
      expv[63] = 19'h00100;
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
