// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  si570_i2c_init dut (
    .clk(clk),
    .rst(in_vec[3:3]),
    .cmd_ready(in_vec[2:2]),
    .data_out_ready(in_vec[1:1]),
    .start(in_vec[0:0]),
    .cmd_address(out_vec[23:17]),
    .cmd_start(out_vec[16:16]),
    .cmd_read(out_vec[15:15]),
    .cmd_write(out_vec[14:14]),
    .cmd_write_multiple(out_vec[13:13]),
    .cmd_stop(out_vec[12:12]),
    .cmd_valid(out_vec[11:11]),
    .data_out(out_vec[10:3]),
    .data_out_valid(out_vec[2:2]),
    .data_out_last(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'hd;
    stim[2] = 4'h3;
    stim[3] = 4'h3;
    stim[4] = 4'h3;
    stim[5] = 4'h6;
    stim[6] = 4'h6;
    stim[7] = 4'h1;
    stim[8] = 4'h6;
    stim[9] = 4'h5;
    stim[10] = 4'h1;
    stim[11] = 4'h7;
    stim[12] = 4'h5;
    stim[13] = 4'h5;
    stim[14] = 4'h3;
    stim[15] = 4'h3;
    stim[16] = 4'h2;
    stim[17] = 4'h1;
    stim[18] = 4'h7;
    stim[19] = 4'h1;
    stim[20] = 4'h6;
    stim[21] = 4'h4;
    stim[22] = 4'h4;
    stim[23] = 4'h6;
    stim[24] = 4'h1;
    stim[25] = 4'h0;
    stim[26] = 4'h3;
    stim[27] = 4'h1;
    stim[28] = 4'h6;
    stim[29] = 4'h2;
    stim[30] = 4'h3;
    stim[31] = 4'h3;
    stim[32] = 4'h6;
    stim[33] = 4'h3;
    stim[34] = 4'h3;
    stim[35] = 4'h7;
    stim[36] = 4'h7;
    stim[37] = 4'h2;
    stim[38] = 4'h3;
    stim[39] = 4'h6;
    stim[40] = 4'h1;
    stim[41] = 4'h2;
    stim[42] = 4'h5;
    stim[43] = 4'h3;
    stim[44] = 4'h1;
    stim[45] = 4'h3;
    stim[46] = 4'h1;
    stim[47] = 4'h7;
    stim[48] = 4'h7;
    stim[49] = 4'h3;
    stim[50] = 4'h1;
    stim[51] = 4'h4;
    stim[52] = 4'h2;
    stim[53] = 4'h6;
    stim[54] = 4'h6;
    stim[55] = 4'h7;
    stim[56] = 4'h4;
    stim[57] = 4'h5;
    stim[58] = 4'h2;
    stim[59] = 4'h7;
    stim[60] = 4'h6;
    stim[61] = 4'h0;
    stim[62] = 4'h7;
    stim[63] = 4'h5;
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
      expv[0] = 24'h000002;
      expv[1] = 24'h000002;
      expv[2] = 24'h000002;
      expv[3] = 24'h000002;
      expv[4] = 24'h010003;
      expv[5] = 24'h014c4f;
      expv[6] = 24'h00044b;
      expv[7] = 24'h004887;
      expv[8] = 24'h004887;
      expv[9] = 24'h000083;
      expv[10] = 24'h010083;
      expv[11] = 24'h01483f;
      expv[12] = 24'h00003b;
      expv[13] = 24'h004807;
      expv[14] = 24'h000007;
      expv[15] = 24'h000003;
      expv[16] = 24'h004a17;
      expv[17] = 24'h004a13;
      expv[18] = 24'h004a13;
      expv[19] = 24'h000213;
      expv[20] = 24'h004e8f;
      expv[21] = 24'h00068b;
      expv[22] = 24'h004f0f;
      expv[23] = 24'h00070f;
      expv[24] = 24'h00070b;
      expv[25] = 24'h00493f;
      expv[26] = 24'h00493f;
      expv[27] = 24'h00493b;
      expv[28] = 24'h00493b;
      expv[29] = 24'h00013b;
      expv[30] = 24'h004d7f;
      expv[31] = 24'h004d7b;
      expv[32] = 24'h004d7b;
      expv[33] = 24'h00057b;
      expv[34] = 24'h01057b;
      expv[35] = 24'h014c4f;
      expv[36] = 24'h00044b;
      expv[37] = 24'h004807;
      expv[38] = 24'h004803;
      expv[39] = 24'h004803;
      expv[40] = 24'h000003;
      expv[41] = 24'h010003;
      expv[42] = 24'h014c3f;
      expv[43] = 24'h00043f;
      expv[44] = 24'h00043b;
      expv[45] = 24'h004a07;
      expv[46] = 24'h004a03;
      expv[47] = 24'h004a03;
      expv[48] = 24'h000203;
      expv[49] = 24'h001a03;
      expv[50] = 24'h001a02;
      expv[51] = 24'h001a02;
      expv[52] = 24'h000202;
      expv[53] = 24'h000202;
      expv[54] = 24'h000202;
      expv[55] = 24'h000202;
      expv[56] = 24'h000202;
      expv[57] = 24'h010203;
      expv[58] = 24'h014c4f;
      expv[59] = 24'h014c4b;
      expv[60] = 24'h00044b;
      expv[61] = 24'h004887;
      expv[62] = 24'h004887;
      expv[63] = 24'h000083;
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
