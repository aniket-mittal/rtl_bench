// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_203129 dut (
    .clkin(clk),
    .st_conv(in_vec[2:2]),
    .comp_in(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .clkout(out_vec[26:26]),
    .sample(out_vec[25:25]),
    .result(out_vec[24:13]),
    .dac_value(out_vec[12:1]),
    .adc_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h3;
    stim[1] = 3'h5;
    stim[2] = 3'h2;
    stim[3] = 3'h0;
    stim[4] = 3'h4;
    stim[5] = 3'h2;
    stim[6] = 3'h0;
    stim[7] = 3'h4;
    stim[8] = 3'h2;
    stim[9] = 3'h3;
    stim[10] = 3'h0;
    stim[11] = 3'h0;
    stim[12] = 3'h0;
    stim[13] = 3'h0;
    stim[14] = 3'h4;
    stim[15] = 3'h6;
    stim[16] = 3'h6;
    stim[17] = 3'h2;
    stim[18] = 3'h6;
    stim[19] = 3'h0;
    stim[20] = 3'h4;
    stim[21] = 3'h2;
    stim[22] = 3'h0;
    stim[23] = 3'h6;
    stim[24] = 3'h6;
    stim[25] = 3'h0;
    stim[26] = 3'h2;
    stim[27] = 3'h4;
    stim[28] = 3'h6;
    stim[29] = 3'h6;
    stim[30] = 3'h2;
    stim[31] = 3'h6;
    stim[32] = 3'h0;
    stim[33] = 3'h4;
    stim[34] = 3'h4;
    stim[35] = 3'h6;
    stim[36] = 3'h4;
    stim[37] = 3'h4;
    stim[38] = 3'h0;
    stim[39] = 3'h0;
    stim[40] = 3'h2;
    stim[41] = 3'h4;
    stim[42] = 3'h2;
    stim[43] = 3'h0;
    stim[44] = 3'h6;
    stim[45] = 3'h4;
    stim[46] = 3'h4;
    stim[47] = 3'h6;
    stim[48] = 3'h2;
    stim[49] = 3'h2;
    stim[50] = 3'h0;
    stim[51] = 3'h0;
    stim[52] = 3'h0;
    stim[53] = 3'h2;
    stim[54] = 3'h6;
    stim[55] = 3'h6;
    stim[56] = 3'h0;
    stim[57] = 3'h4;
    stim[58] = 3'h0;
    stim[59] = 3'h0;
    stim[60] = 3'h6;
    stim[61] = 3'h4;
    stim[62] = 3'h0;
    stim[63] = 3'h6;
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
      expv[0] = 27'h0001000;
      expv[1] = 27'h0001000;
      expv[2] = 27'h0001000;
      expv[3] = 27'h0001000;
      expv[4] = 27'h0001000;
      expv[5] = 27'h0001000;
      expv[6] = 27'h2001000;
      expv[7] = 27'h0001800;
      expv[8] = 27'h0001400;
      expv[9] = 27'h0001000;
      expv[10] = 27'h0001000;
      expv[11] = 27'h0001000;
      expv[12] = 27'h0001000;
      expv[13] = 27'h0001000;
      expv[14] = 27'h0001000;
      expv[15] = 27'h0001000;
      expv[16] = 27'h2001000;
      expv[17] = 27'h1001800;
      expv[18] = 27'h1801400;
      expv[19] = 27'h1c01600;
      expv[20] = 27'h1c01300;
      expv[21] = 27'h1c01500;
      expv[22] = 27'h1c81700;
      expv[23] = 27'h1c81480;
      expv[24] = 27'h1ca1680;
      expv[25] = 27'h1cb14c0;
      expv[26] = 27'h1cb16c0;
      expv[27] = 27'h1cb54a0;
      expv[28] = 27'h1cb56a0;
      expv[29] = 27'h1cb54b0;
      expv[30] = 27'h1cb54b1;
      expv[31] = 27'h0001000;
      expv[32] = 27'h0001000;
      expv[33] = 27'h2001000;
      expv[34] = 27'h0001800;
      expv[35] = 27'h0001400;
      expv[36] = 27'h0401600;
      expv[37] = 27'h0401300;
      expv[38] = 27'h0401500;
      expv[39] = 27'h0401700;
      expv[40] = 27'h0401480;
      expv[41] = 27'h0421680;
      expv[42] = 27'h04214c0;
      expv[43] = 27'h04296c0;
      expv[44] = 27'h04294a0;
      expv[45] = 27'h042b6a0;
      expv[46] = 27'h042b4b0;
      expv[47] = 27'h042b4b1;
      expv[48] = 27'h042b4b1;
      expv[49] = 27'h0001000;
      expv[50] = 27'h0001000;
      expv[51] = 27'h0001000;
      expv[52] = 27'h0001000;
      expv[53] = 27'h0001000;
      expv[54] = 27'h0001000;
      expv[55] = 27'h0001000;
      expv[56] = 27'h2001000;
      expv[57] = 27'h0001800;
      expv[58] = 27'h0001400;
      expv[59] = 27'h0001600;
      expv[60] = 27'h0001300;
      expv[61] = 27'h0101500;
      expv[62] = 27'h0101700;
      expv[63] = 27'h0101480;
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
