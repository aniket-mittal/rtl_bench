// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04533 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .write_buffer(in_vec[2:2]),
    .reset_buffer(in_vec[1:1]),
    .en_16_x_baud(in_vec[0:0]),
    .serial_out(out_vec[2:2]),
    .buffer_full(out_vec[1:1]),
    .buffer_half_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7da;
    stim[1] = 11'h307;
    stim[2] = 11'h455;
    stim[3] = 11'h688;
    stim[4] = 11'h6a5;
    stim[5] = 11'h2c4;
    stim[6] = 11'h4a9;
    stim[7] = 11'h279;
    stim[8] = 11'h041;
    stim[9] = 11'h25d;
    stim[10] = 11'h6e8;
    stim[11] = 11'h5b8;
    stim[12] = 11'h2c0;
    stim[13] = 11'h194;
    stim[14] = 11'h3e0;
    stim[15] = 11'h588;
    stim[16] = 11'h26d;
    stim[17] = 11'h6c0;
    stim[18] = 11'h5fc;
    stim[19] = 11'h151;
    stim[20] = 11'h479;
    stim[21] = 11'h0e4;
    stim[22] = 11'h5ec;
    stim[23] = 11'h178;
    stim[24] = 11'h1a5;
    stim[25] = 11'h58d;
    stim[26] = 11'h790;
    stim[27] = 11'h29d;
    stim[28] = 11'h044;
    stim[29] = 11'h3fd;
    stim[30] = 11'h3d9;
    stim[31] = 11'h6f1;
    stim[32] = 11'h758;
    stim[33] = 11'h371;
    stim[34] = 11'h489;
    stim[35] = 11'h00c;
    stim[36] = 11'h29d;
    stim[37] = 11'h080;
    stim[38] = 11'h41f;
    stim[39] = 11'h251;
    stim[40] = 11'h081;
    stim[41] = 11'h564;
    stim[42] = 11'h501;
    stim[43] = 11'h788;
    stim[44] = 11'h3c1;
    stim[45] = 11'h185;
    stim[46] = 11'h1b1;
    stim[47] = 11'h3c0;
    stim[48] = 11'h281;
    stim[49] = 11'h6b4;
    stim[50] = 11'h710;
    stim[51] = 11'h1a5;
    stim[52] = 11'h765;
    stim[53] = 11'h178;
    stim[54] = 11'h749;
    stim[55] = 11'h4f0;
    stim[56] = 11'h219;
    stim[57] = 11'h2dd;
    stim[58] = 11'h3a1;
    stim[59] = 11'h075;
    stim[60] = 11'h48d;
    stim[61] = 11'h1dd;
    stim[62] = 11'h725;
    stim[63] = 11'h411;
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
      expv[0] = 3'hx;
      expv[1] = 3'hx;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'hx;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h4;
      expv[8] = 3'h0;
      expv[9] = 3'h4;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h4;
      expv[22] = 3'h5;
      expv[23] = 3'h5;
      expv[24] = 3'h5;
      expv[25] = 3'h1;
      expv[26] = 3'h1;
      expv[27] = 3'h1;
      expv[28] = 3'h1;
      expv[29] = 3'h1;
      expv[30] = 3'h1;
      expv[31] = 3'h5;
      expv[32] = 3'h1;
      expv[33] = 3'h1;
      expv[34] = 3'h5;
      expv[35] = 3'h1;
      expv[36] = 3'h1;
      expv[37] = 3'h5;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h4;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h4;
      expv[62] = 3'h5;
      expv[63] = 3'h1;
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
