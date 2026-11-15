// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_101193 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .enable(in_vec[18:18]),
    .counter(in_vec[17:16]),
    .data_in(in_vec[15:0]),
    .data_out0(out_vec[63:48]),
    .data_out1(out_vec[47:32]),
    .data_out2(out_vec[31:16]),
    .data_out3(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hb0467;
    stim[1] = 20'hf4729;
    stim[2] = 20'h17bd6;
    stim[3] = 20'h3bf24;
    stim[4] = 20'h0da66;
    stim[5] = 20'h7baf5;
    stim[6] = 20'h24e49;
    stim[7] = 20'h33667;
    stim[8] = 20'h254db;
    stim[9] = 20'h71e48;
    stim[10] = 20'h3ed63;
    stim[11] = 20'h0190d;
    stim[12] = 20'h789be;
    stim[13] = 20'h18f02;
    stim[14] = 20'h42e7e;
    stim[15] = 20'h4b2ef;
    stim[16] = 20'h7ee9d;
    stim[17] = 20'h61989;
    stim[18] = 20'h4cd8b;
    stim[19] = 20'h7cf79;
    stim[20] = 20'h49eb7;
    stim[21] = 20'h4c803;
    stim[22] = 20'h0f11f;
    stim[23] = 20'h0d350;
    stim[24] = 20'h68ab2;
    stim[25] = 20'h328f0;
    stim[26] = 20'h00849;
    stim[27] = 20'h6308c;
    stim[28] = 20'h45d31;
    stim[29] = 20'h24aff;
    stim[30] = 20'h6a125;
    stim[31] = 20'h71206;
    stim[32] = 20'h7665d;
    stim[33] = 20'h0b1d2;
    stim[34] = 20'h72aa1;
    stim[35] = 20'h23d7a;
    stim[36] = 20'h77132;
    stim[37] = 20'h68347;
    stim[38] = 20'h0ef91;
    stim[39] = 20'h0c22c;
    stim[40] = 20'h77345;
    stim[41] = 20'h17de2;
    stim[42] = 20'h2fa78;
    stim[43] = 20'h761e6;
    stim[44] = 20'h20597;
    stim[45] = 20'h7f3f9;
    stim[46] = 20'h09a0c;
    stim[47] = 20'h272fa;
    stim[48] = 20'h0a998;
    stim[49] = 20'h4f9c9;
    stim[50] = 20'h1e0fd;
    stim[51] = 20'h5159d;
    stim[52] = 20'h63467;
    stim[53] = 20'h1fae4;
    stim[54] = 20'h4ace0;
    stim[55] = 20'h2512b;
    stim[56] = 20'h5d3b7;
    stim[57] = 20'h020ff;
    stim[58] = 20'h766f3;
    stim[59] = 20'h63b64;
    stim[60] = 20'h0e1e1;
    stim[61] = 20'h74456;
    stim[62] = 20'h673f1;
    stim[63] = 20'h292c7;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
