// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137952 dut (
    .clk(clk),
    .rst(in_vec[22:22]),
    .a(in_vec[21:14]),
    .b(in_vec[13:6]),
    .add_sub(in_vec[5:5]),
    .shift_in(in_vec[4:1]),
    .control(in_vec[0:0]),
    .final_out(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h6eba16;
    stim[1] = 23'h4001b1;
    stim[2] = 23'h1e4ab9;
    stim[3] = 23'h05d62d;
    stim[4] = 23'h10d354;
    stim[5] = 23'h3c2a34;
    stim[6] = 23'h0355b3;
    stim[7] = 23'h367f6f;
    stim[8] = 23'h267d65;
    stim[9] = 23'h310b80;
    stim[10] = 23'h1d6c6f;
    stim[11] = 23'h3028a9;
    stim[12] = 23'h1d51d2;
    stim[13] = 23'h3d104d;
    stim[14] = 23'h048c76;
    stim[15] = 23'h1c1f2f;
    stim[16] = 23'h1d60b3;
    stim[17] = 23'h276cb2;
    stim[18] = 23'h0c5e6b;
    stim[19] = 23'h0ab5d0;
    stim[20] = 23'h0e4a10;
    stim[21] = 23'h087a4d;
    stim[22] = 23'h2903d4;
    stim[23] = 23'h2d3f29;
    stim[24] = 23'h05a057;
    stim[25] = 23'h046056;
    stim[26] = 23'h2b7d70;
    stim[27] = 23'h264b26;
    stim[28] = 23'h21b3f5;
    stim[29] = 23'h2813c2;
    stim[30] = 23'h3bbb34;
    stim[31] = 23'h3557a0;
    stim[32] = 23'h3d8ece;
    stim[33] = 23'h0f18a7;
    stim[34] = 23'h258ee7;
    stim[35] = 23'h2849a0;
    stim[36] = 23'h34e44b;
    stim[37] = 23'h14e4bb;
    stim[38] = 23'h107f9f;
    stim[39] = 23'h3a7e66;
    stim[40] = 23'h3a9ec1;
    stim[41] = 23'h14ac34;
    stim[42] = 23'h361f80;
    stim[43] = 23'h251307;
    stim[44] = 23'h110285;
    stim[45] = 23'h3bacce;
    stim[46] = 23'h36720b;
    stim[47] = 23'h24d7b3;
    stim[48] = 23'h249dea;
    stim[49] = 23'h2aadfd;
    stim[50] = 23'h26a9c7;
    stim[51] = 23'h18b404;
    stim[52] = 23'h2748a6;
    stim[53] = 23'h225acd;
    stim[54] = 23'h2ae77e;
    stim[55] = 23'h3f6b85;
    stim[56] = 23'h39d002;
    stim[57] = 23'h3752e9;
    stim[58] = 23'h1c5b78;
    stim[59] = 23'h19c413;
    stim[60] = 23'h093182;
    stim[61] = 23'h1ebab6;
    stim[62] = 23'h2fe304;
    stim[63] = 23'h02396c;
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
      expv[0] = 9'h1f9;
      expv[1] = 9'h001;
      expv[2] = 9'h009;
      expv[3] = 9'h0af;
      expv[4] = 9'h06a;
      expv[5] = 9'h1f1;
      expv[6] = 9'h19b;
      expv[7] = 9'h071;
      expv[8] = 9'h1da;
      expv[9] = 9'h18e;
      expv[10] = 9'h0a4;
      expv[11] = 9'h12e;
      expv[12] = 9'h15f;
      expv[13] = 9'h03a;
      expv[14] = 9'h0ac;
      expv[15] = 9'h051;
      expv[16] = 9'h0ef;
      expv[17] = 9'h0f4;
      expv[18] = 9'h159;
      expv[19] = 9'h0a9;
      expv[20] = 9'h152;
      expv[21] = 9'h01d;
      expv[22] = 9'h133;
      expv[23] = 9'h09d;
      expv[24] = 9'h1b7;
      expv[25] = 9'h18e;
      expv[26] = 9'h18f;
      expv[27] = 9'h19c;
      expv[28] = 9'h0ca;
      expv[29] = 9'h153;
      expv[30] = 9'h04c;
      expv[31] = 9'h1da;
      expv[32] = 9'h125;
      expv[33] = 9'h0c1;
      expv[34] = 9'h0a4;
      expv[35] = 9'h0d1;
      expv[36] = 9'h0d1;
      expv[37] = 9'h04d;
      expv[38] = 9'h0f4;
      expv[39] = 9'h13d;
      expv[40] = 9'h1e2;
      expv[41] = 9'h06a;
      expv[42] = 9'h102;
      expv[43] = 9'h060;
      expv[44] = 9'h04c;
      expv[45] = 9'h02c;
      expv[46] = 9'h045;
      expv[47] = 9'h014;
      expv[48] = 9'h0e7;
      expv[49] = 9'h116;
      expv[50] = 9'h167;
      expv[51] = 9'h1ef;
      expv[52] = 9'h18c;
      expv[53] = 9'h0cb;
      expv[54] = 9'h00f;
      expv[55] = 9'h14c;
      expv[56] = 9'h04d;
      expv[57] = 9'h0af;
      expv[58] = 9'h11f;
      expv[59] = 9'h0e1;
      expv[60] = 9'h055;
      expv[61] = 9'h157;
      expv[62] = 9'h160;
      expv[63] = 9'h027;
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
