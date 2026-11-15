// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142538 dut (
    .clk(clk),
    .rst_n(in_vec[38:38]),
    .clkps2(in_vec[37:37]),
    .dataps2(in_vec[36:36]),
    .a(in_vec[35:20]),
    .iorq_n(in_vec[19:19]),
    .rd_n(in_vec[18:18]),
    .zxuno_addr(in_vec[17:10]),
    .zxuno_regrd(in_vec[9:9]),
    .zxuno_regwr(in_vec[8:8]),
    .din(in_vec[7:0]),
    .kmouse_dout(out_vec[26:19]),
    .oe_n_kmouse(out_vec[18:18]),
    .mousedata_dout(out_vec[17:10]),
    .oe_n_mousedata(out_vec[9:9]),
    .mousestatus_dout(out_vec[8:1]),
    .oe_n_mousestatus(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h2d8a1f81be;
    stim[1] = 39'h052935c9c8;
    stim[2] = 39'h6499d9060b;
    stim[3] = 39'h663ebd98bc;
    stim[4] = 39'h4031372ca9;
    stim[5] = 39'h51ebb82359;
    stim[6] = 39'h7964f6f745;
    stim[7] = 39'h5dd28ea50f;
    stim[8] = 39'h657473399c;
    stim[9] = 39'h49cadc6b23;
    stim[10] = 39'h46dbd4c027;
    stim[11] = 39'h467c306e0a;
    stim[12] = 39'h7d865dfe0d;
    stim[13] = 39'h45dd958e6a;
    stim[14] = 39'h7f9da2d0ed;
    stim[15] = 39'h6860e23e8b;
    stim[16] = 39'h5e3f5506f9;
    stim[17] = 39'h6241db181c;
    stim[18] = 39'h7c74537271;
    stim[19] = 39'h72a5dfee48;
    stim[20] = 39'h6b90b58250;
    stim[21] = 39'h5f8ca68bf1;
    stim[22] = 39'h48d1bf1d8a;
    stim[23] = 39'h4e4c21e2ee;
    stim[24] = 39'h4d4533f8ba;
    stim[25] = 39'h6eaf41ffd2;
    stim[26] = 39'h7bd4331904;
    stim[27] = 39'h29ea4fedbc;
    stim[28] = 39'h5c61f7fb1f;
    stim[29] = 39'h4de2ba44bd;
    stim[30] = 39'h5f13b3286e;
    stim[31] = 39'h6526fc29bf;
    stim[32] = 39'h728a5bcc7b;
    stim[33] = 39'h56eba37af7;
    stim[34] = 39'h725493107a;
    stim[35] = 39'h4148c496fd;
    stim[36] = 39'h4d03fc8ae9;
    stim[37] = 39'h5320152377;
    stim[38] = 39'h5ad893e3ef;
    stim[39] = 39'h4e7cbf3be2;
    stim[40] = 39'h748750528d;
    stim[41] = 39'h5994567cb3;
    stim[42] = 39'h615ed6e47d;
    stim[43] = 39'h73afffb988;
    stim[44] = 39'h47bf44fdef;
    stim[45] = 39'h7a07f113f2;
    stim[46] = 39'h5e95a121ae;
    stim[47] = 39'h5d8f472fd8;
    stim[48] = 39'h79b29742e9;
    stim[49] = 39'h7b822168c7;
    stim[50] = 39'h68b200214b;
    stim[51] = 39'h53151034dd;
    stim[52] = 39'h61d2b60296;
    stim[53] = 39'h520a172025;
    stim[54] = 39'h65296d16b5;
    stim[55] = 39'h500265dd8e;
    stim[56] = 39'h711c495d14;
    stim[57] = 39'h5054ea99d7;
    stim[58] = 39'h4fbf31b781;
    stim[59] = 39'h7810760f3b;
    stim[60] = 39'h540b47b487;
    stim[61] = 39'h7e00f43669;
    stim[62] = 39'h6a7f870d03;
    stim[63] = 39'h6ec908ada2;
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
      expv[0] = 27'h0040201;
      expv[1] = 27'h0040201;
      expv[2] = 27'h0040201;
      expv[3] = 27'h0040201;
      expv[4] = 27'h0040201;
      expv[5] = 27'h0040201;
      expv[6] = 27'h0040201;
      expv[7] = 27'h0040201;
      expv[8] = 27'h0040201;
      expv[9] = 27'h0040201;
      expv[10] = 27'h0040201;
      expv[11] = 27'h0040201;
      expv[12] = 27'h0040201;
      expv[13] = 27'h0040201;
      expv[14] = 27'h0040201;
      expv[15] = 27'h0040201;
      expv[16] = 27'h0040201;
      expv[17] = 27'h0040201;
      expv[18] = 27'h0040201;
      expv[19] = 27'h0040201;
      expv[20] = 27'h0040201;
      expv[21] = 27'h0040201;
      expv[22] = 27'h0040201;
      expv[23] = 27'h0040201;
      expv[24] = 27'h0040200;
      expv[25] = 27'h00402xx;
      expv[26] = 27'h00402xx;
      expv[27] = 27'h0000201;
      expv[28] = 27'h0040201;
      expv[29] = 27'h0040201;
      expv[30] = 27'h0040201;
      expv[31] = 27'h0040201;
      expv[32] = 27'h0040201;
      expv[33] = 27'h0040201;
      expv[34] = 27'h0040201;
      expv[35] = 27'h0040201;
      expv[36] = 27'h0040201;
      expv[37] = 27'h0040201;
      expv[38] = 27'h0040201;
      expv[39] = 27'h0040201;
      expv[40] = 27'h0040201;
      expv[41] = 27'h0040201;
      expv[42] = 27'h0040201;
      expv[43] = 27'h0040201;
      expv[44] = 27'h0040201;
      expv[45] = 27'h0040201;
      expv[46] = 27'h0040201;
      expv[47] = 27'h0040201;
      expv[48] = 27'h0040201;
      expv[49] = 27'h0040201;
      expv[50] = 27'h0040201;
      expv[51] = 27'h0040201;
      expv[52] = 27'h0040201;
      expv[53] = 27'h0040201;
      expv[54] = 27'h0040201;
      expv[55] = 27'h0040201;
      expv[56] = 27'h0040201;
      expv[57] = 27'h0040201;
      expv[58] = 27'h0040201;
      expv[59] = 27'h0040201;
      expv[60] = 27'h0040201;
      expv[61] = 27'h0040201;
      expv[62] = 27'h0040201;
      expv[63] = 27'h0040201;
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
