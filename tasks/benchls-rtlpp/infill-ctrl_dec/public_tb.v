// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ctrl_dec dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .ctrl(in_vec[16:1]),
    .sel(in_vec[0:0]),
    .ud_t(out_vec[8:8]),
    .ld_t(out_vec[7:7]),
    .ud_ce(out_vec[6:6]),
    .ld_ce(out_vec[5:5]),
    .addr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3fa06;
    stim[1] = 18'h2b755;
    stim[2] = 18'h106d4;
    stim[3] = 18'h13956;
    stim[4] = 18'h0abf5;
    stim[5] = 18'h030a1;
    stim[6] = 18'h0f171;
    stim[7] = 18'h141f2;
    stim[8] = 18'h032f2;
    stim[9] = 18'h1950c;
    stim[10] = 18'h1d5f4;
    stim[11] = 18'h00aae;
    stim[12] = 18'h1b605;
    stim[13] = 18'h09d28;
    stim[14] = 18'h09288;
    stim[15] = 18'h0e0ef;
    stim[16] = 18'h0ec0c;
    stim[17] = 18'h04b29;
    stim[18] = 18'h0d2b8;
    stim[19] = 18'h033f6;
    stim[20] = 18'h00eb7;
    stim[21] = 18'h09cae;
    stim[22] = 18'h0fd67;
    stim[23] = 18'h0689b;
    stim[24] = 18'h1221e;
    stim[25] = 18'h1f6d2;
    stim[26] = 18'h1bd6c;
    stim[27] = 18'h04c24;
    stim[28] = 18'h03c7b;
    stim[29] = 18'h105d9;
    stim[30] = 18'h03b20;
    stim[31] = 18'h07ffb;
    stim[32] = 18'h16beb;
    stim[33] = 18'h0d270;
    stim[34] = 18'h09a65;
    stim[35] = 18'h041b3;
    stim[36] = 18'h092e5;
    stim[37] = 18'h017c9;
    stim[38] = 18'h15ec1;
    stim[39] = 18'h1e071;
    stim[40] = 18'h1bbc1;
    stim[41] = 18'h178b0;
    stim[42] = 18'h136a4;
    stim[43] = 18'h0d368;
    stim[44] = 18'h0b97c;
    stim[45] = 18'h1b0a5;
    stim[46] = 18'h0968d;
    stim[47] = 18'h00dfc;
    stim[48] = 18'h180b3;
    stim[49] = 18'h05ac1;
    stim[50] = 18'h1b852;
    stim[51] = 18'h040b4;
    stim[52] = 18'h2fb36;
    stim[53] = 18'h03bc6;
    stim[54] = 18'h00ffd;
    stim[55] = 18'h14e7e;
    stim[56] = 18'h1ac32;
    stim[57] = 18'h0ac62;
    stim[58] = 18'h051d2;
    stim[59] = 18'h08f0e;
    stim[60] = 18'h14084;
    stim[61] = 18'h00626;
    stim[62] = 18'h034fb;
    stim[63] = 18'h1c12a;
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
      expv[0] = 9'h181;
      expv[1] = 9'h195;
      expv[2] = 9'h195;
      expv[3] = 9'h195;
      expv[4] = 9'h19d;
      expv[5] = 9'h0a8;
      expv[6] = 9'h0bc;
      expv[7] = 9'h19c;
      expv[8] = 9'h19c;
      expv[9] = 9'h183;
      expv[10] = 9'h19d;
      expv[11] = 9'h18b;
      expv[12] = 9'h181;
      expv[13] = 9'h18a;
      expv[14] = 9'h182;
      expv[15] = 9'h19b;
      expv[16] = 9'h183;
      expv[17] = 9'h18a;
      expv[18] = 9'h18e;
      expv[19] = 9'h19d;
      expv[20] = 9'h18d;
      expv[21] = 9'h18b;
      expv[22] = 9'h199;
      expv[23] = 9'h186;
      expv[24] = 9'h187;
      expv[25] = 9'h194;
      expv[26] = 9'h19b;
      expv[27] = 9'h189;
      expv[28] = 9'h19e;
      expv[29] = 9'h196;
      expv[30] = 9'h048;
      expv[31] = 9'h19e;
      expv[32] = 9'h1fa;
      expv[33] = 9'h0bc;
      expv[34] = 9'h0b9;
      expv[35] = 9'h0ac;
      expv[36] = 9'h019;
      expv[37] = 9'h012;
      expv[38] = 9'h170;
      expv[39] = 9'h17c;
      expv[40] = 9'h170;
      expv[41] = 9'h1ac;
      expv[42] = 9'h1a9;
      expv[43] = 9'h1ba;
      expv[44] = 9'h19f;
      expv[45] = 9'h189;
      expv[46] = 9'h183;
      expv[47] = 9'h19f;
      expv[48] = 9'h18c;
      expv[49] = 9'h190;
      expv[50] = 9'h194;
      expv[51] = 9'h18d;
      expv[52] = 9'h18d;
      expv[53] = 9'h191;
      expv[54] = 9'h19f;
      expv[55] = 9'h0ff;
      expv[56] = 9'h0ec;
      expv[57] = 9'h0f8;
      expv[58] = 9'h0f4;
      expv[59] = 9'h183;
      expv[60] = 9'h181;
      expv[61] = 9'h189;
      expv[62] = 9'h19e;
      expv[63] = 9'h18a;
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
