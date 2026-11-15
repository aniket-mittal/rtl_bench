// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_093854 dut (
    .clk(clk),
    .start(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .rad(in_vec[7:0]),
    .busy(out_vec[17:17]),
    .valid(out_vec[16:16]),
    .root(out_vec[15:8]),
    .rem(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3ea;
    stim[1] = 10'h16a;
    stim[2] = 10'h2aa;
    stim[3] = 10'h068;
    stim[4] = 10'h010;
    stim[5] = 10'h260;
    stim[6] = 10'h2d1;
    stim[7] = 10'h22a;
    stim[8] = 10'h248;
    stim[9] = 10'h0f6;
    stim[10] = 10'h03c;
    stim[11] = 10'h025;
    stim[12] = 10'h0eb;
    stim[13] = 10'h267;
    stim[14] = 10'h0ed;
    stim[15] = 10'h029;
    stim[16] = 10'h0f4;
    stim[17] = 10'h0b5;
    stim[18] = 10'h0fe;
    stim[19] = 10'h264;
    stim[20] = 10'h08f;
    stim[21] = 10'h2eb;
    stim[22] = 10'h2ca;
    stim[23] = 10'h255;
    stim[24] = 10'h261;
    stim[25] = 10'h09e;
    stim[26] = 10'h2c5;
    stim[27] = 10'h01c;
    stim[28] = 10'h250;
    stim[29] = 10'h081;
    stim[30] = 10'h0fa;
    stim[31] = 10'h221;
    stim[32] = 10'h0dc;
    stim[33] = 10'h0bd;
    stim[34] = 10'h2dd;
    stim[35] = 10'h0ac;
    stim[36] = 10'h0a1;
    stim[37] = 10'h0b0;
    stim[38] = 10'h0e2;
    stim[39] = 10'h0af;
    stim[40] = 10'h204;
    stim[41] = 10'h04c;
    stim[42] = 10'h001;
    stim[43] = 10'h04a;
    stim[44] = 10'h2ed;
    stim[45] = 10'h042;
    stim[46] = 10'h21f;
    stim[47] = 10'h2fd;
    stim[48] = 10'h095;
    stim[49] = 10'h255;
    stim[50] = 10'h228;
    stim[51] = 10'h24e;
    stim[52] = 10'h2f4;
    stim[53] = 10'h0a5;
    stim[54] = 10'h042;
    stim[55] = 10'h008;
    stim[56] = 10'h0d4;
    stim[57] = 10'h079;
    stim[58] = 10'h08f;
    stim[59] = 10'h09d;
    stim[60] = 10'h021;
    stim[61] = 10'h297;
    stim[62] = 10'h098;
    stim[63] = 10'h299;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h2xxxx;
      expv[2] = 18'h2xxxx;
      expv[3] = 18'h2xxxx;
      expv[4] = 18'h2xxxx;
      expv[5] = 18'h2xxxx;
      expv[6] = 18'h2xxxx;
      expv[7] = 18'h2xxxx;
      expv[8] = 18'h2xxxx;
      expv[9] = 18'h2xxxx;
      expv[10] = 18'h2xxxx;
      expv[11] = 18'h2xxxx;
      expv[12] = 18'h2xxxx;
      expv[13] = 18'h10808;
      expv[14] = 18'h20808;
      expv[15] = 18'h20808;
      expv[16] = 18'h20808;
      expv[17] = 18'h20808;
      expv[18] = 18'h10a03;
      expv[19] = 18'h10a03;
      expv[20] = 18'h20a03;
      expv[21] = 18'h20a03;
      expv[22] = 18'h20a03;
      expv[23] = 18'h20a03;
      expv[24] = 18'h20a03;
      expv[25] = 18'h20a03;
      expv[26] = 18'h20a03;
      expv[27] = 18'h20a03;
      expv[28] = 18'h20a03;
      expv[29] = 18'h20a03;
      expv[30] = 18'h20a03;
      expv[31] = 18'h20a03;
      expv[32] = 18'h20a03;
      expv[33] = 18'h20a03;
      expv[34] = 18'h20a03;
      expv[35] = 18'h20a03;
      expv[36] = 18'h20a03;
      expv[37] = 18'h20a03;
      expv[38] = 18'h20a03;
      expv[39] = 18'h10e19;
      expv[40] = 18'h10e19;
      expv[41] = 18'h20e19;
      expv[42] = 18'h20e19;
      expv[43] = 18'h20e19;
      expv[44] = 18'h20e19;
      expv[45] = 18'h20e19;
      expv[46] = 18'h20e19;
      expv[47] = 18'h20e19;
      expv[48] = 18'h20e19;
      expv[49] = 18'h20e19;
      expv[50] = 18'h20e19;
      expv[51] = 18'h20e19;
      expv[52] = 18'h20e19;
      expv[53] = 18'h20e19;
      expv[54] = 18'h20e19;
      expv[55] = 18'h20e19;
      expv[56] = 18'h20e19;
      expv[57] = 18'h10f13;
      expv[58] = 18'h10f13;
      expv[59] = 18'h10f13;
      expv[60] = 18'h10f13;
      expv[61] = 18'h10f13;
      expv[62] = 18'h20f13;
      expv[63] = 18'h20f13;
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
