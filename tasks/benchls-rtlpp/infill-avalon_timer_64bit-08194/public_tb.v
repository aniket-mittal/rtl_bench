// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08194 dut (
    .clk(clk),
    .address(in_vec[22:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h002235;
    stim[1] = 23'h2824dc;
    stim[2] = 23'h061c96;
    stim[3] = 23'h1e985f;
    stim[4] = 23'h07e90d;
    stim[5] = 23'h7af0be;
    stim[6] = 23'h7b53de;
    stim[7] = 23'h27b04b;
    stim[8] = 23'h3f75e3;
    stim[9] = 23'h3fc5f6;
    stim[10] = 23'h5bfa81;
    stim[11] = 23'h3643fb;
    stim[12] = 23'h778847;
    stim[13] = 23'h3f5653;
    stim[14] = 23'h1ae970;
    stim[15] = 23'h0bbabe;
    stim[16] = 23'h4a44c3;
    stim[17] = 23'h4b146f;
    stim[18] = 23'h53dbec;
    stim[19] = 23'h6764fe;
    stim[20] = 23'h6696ee;
    stim[21] = 23'h22b363;
    stim[22] = 23'h57b4ef;
    stim[23] = 23'h466268;
    stim[24] = 23'h76abec;
    stim[25] = 23'h32cb00;
    stim[26] = 23'h7370e0;
    stim[27] = 23'h57f78c;
    stim[28] = 23'h5ff9c9;
    stim[29] = 23'h26f0d0;
    stim[30] = 23'h2bb138;
    stim[31] = 23'h37528d;
    stim[32] = 23'h4be977;
    stim[33] = 23'h56c415;
    stim[34] = 23'h6f7ba6;
    stim[35] = 23'h464934;
    stim[36] = 23'h72db0e;
    stim[37] = 23'h2bd7a6;
    stim[38] = 23'h171879;
    stim[39] = 23'h3be569;
    stim[40] = 23'h7b1cb7;
    stim[41] = 23'h2bb5c4;
    stim[42] = 23'h0bcd78;
    stim[43] = 23'h03fcfd;
    stim[44] = 23'h0bd34c;
    stim[45] = 23'h773539;
    stim[46] = 23'h07e1fd;
    stim[47] = 23'h565f91;
    stim[48] = 23'h17b9f8;
    stim[49] = 23'h3e9fd3;
    stim[50] = 23'h6f01cb;
    stim[51] = 23'h1f96bd;
    stim[52] = 23'h365092;
    stim[53] = 23'h6f9595;
    stim[54] = 23'h5aed57;
    stim[55] = 23'h1677ad;
    stim[56] = 23'h1715e7;
    stim[57] = 23'h2b1358;
    stim[58] = 23'h36d451;
    stim[59] = 23'h1aef51;
    stim[60] = 23'h3a8979;
    stim[61] = 23'h070bc2;
    stim[62] = 23'h77bed5;
    stim[63] = 23'h2294c1;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h0985f;
      expv[15] = 17'h0985f;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h0c34f;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h0c34f;
      expv[40] = 17'h0985f;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h0c34f;
      expv[50] = 17'h0985f;
      expv[51] = 17'h00000;
      expv[52] = 17'h0985f;
      expv[53] = 17'h0c34f;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h0c34f;
      expv[57] = 17'h077ad;
      expv[58] = 17'h00000;
      expv[59] = 17'h0c34f;
      expv[60] = 17'h0985f;
      expv[61] = 17'h0985f;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
