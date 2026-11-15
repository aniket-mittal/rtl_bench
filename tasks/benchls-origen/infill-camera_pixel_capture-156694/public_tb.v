// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_156694 dut (
    .CLK(clk),
    .RES(in_vec[40:40]),
    .D(in_vec[39:32]),
    .HREF(in_vec[31:31]),
    .VSYNC(in_vec[30:30]),
    .x_in(in_vec[29:15]),
    .y_in(in_vec[14:0]),
    .PIXEL(out_vec[38:31]),
    .SAMP_RDY(out_vec[30:30]),
    .x_out(out_vec[29:15]),
    .y_out(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h07a071e6925;
    stim[1] = 41'h025ef2056ea;
    stim[2] = 41'h15966255844;
    stim[3] = 41'h11ee533ef47;
    stim[4] = 41'h1aa6d14cbc9;
    stim[5] = 41'h15004a9f850;
    stim[6] = 41'h1798c31a03a;
    stim[7] = 41'h18348ac8cc0;
    stim[8] = 41'h1a708f71034;
    stim[9] = 41'h19f6bb8be57;
    stim[10] = 41'h1f3e7486416;
    stim[11] = 41'h1554c27e2fe;
    stim[12] = 41'h16e25814c00;
    stim[13] = 41'h16d2cdd9274;
    stim[14] = 41'h1eee206727b;
    stim[15] = 41'h144ea3f87f4;
    stim[16] = 41'h1210c174969;
    stim[17] = 41'h144d87d2c37;
    stim[18] = 41'h1e9287c7226;
    stim[19] = 41'h1e577c9b2a9;
    stim[20] = 41'h16a5fc5094a;
    stim[21] = 41'h1947e49099c;
    stim[22] = 41'h1aaf37c2228;
    stim[23] = 41'h1bb574e7437;
    stim[24] = 41'h1c8cba82dd8;
    stim[25] = 41'h126742ffa28;
    stim[26] = 41'h125f3ee0e98;
    stim[27] = 41'h1587d160174;
    stim[28] = 41'h1112114a065;
    stim[29] = 41'h14df3f3edae;
    stim[30] = 41'h1daa9f8c162;
    stim[31] = 41'h1d890f916cf;
    stim[32] = 41'h1de143e09f3;
    stim[33] = 41'h15131ef180b;
    stim[34] = 41'h16f162e526b;
    stim[35] = 41'h17f2e49780c;
    stim[36] = 41'h136b382b807;
    stim[37] = 41'h1301400dfd8;
    stim[38] = 41'h1fc56a6b1f3;
    stim[39] = 41'h1b7ce12cf2f;
    stim[40] = 41'h1181d3edb21;
    stim[41] = 41'h1083e5fa017;
    stim[42] = 41'h17e4bfe7be4;
    stim[43] = 41'h1d2acde2949;
    stim[44] = 41'h14f515ec171;
    stim[45] = 41'h1c8cee39d3b;
    stim[46] = 41'h17ddaa6293c;
    stim[47] = 41'h162e3632b37;
    stim[48] = 41'h1ef8660d182;
    stim[49] = 41'h16c39efc982;
    stim[50] = 41'h11c05c7dd18;
    stim[51] = 41'h154776f4738;
    stim[52] = 41'h1b678f52956;
    stim[53] = 41'h1dd2f9e8ff8;
    stim[54] = 41'h112027f26e2;
    stim[55] = 41'h1ae8d5d9f92;
    stim[56] = 41'h14a45e1c3e9;
    stim[57] = 41'h18482a27bec;
    stim[58] = 41'h16adbb6c627;
    stim[59] = 41'h13dda5a54b9;
    stim[60] = 41'h140ba210fd7;
    stim[61] = 41'h11c0fe45202;
    stim[62] = 41'h1d35bfebdc2;
    stim[63] = 41'h129be9033a8;
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
      expv[0] = 39'hxxx0000000;
      expv[1] = 39'hxxx0000000;
      expv[2] = 39'hxxx0000000;
      expv[3] = 39'hxxx0000000;
      expv[4] = 39'hxxx0000000;
      expv[5] = 39'hxxx0000000;
      expv[6] = 39'hxxx0000001;
      expv[7] = 39'hxxx0000001;
      expv[8] = 39'hxxx0000000;
      expv[9] = 39'hxxx0000001;
      expv[10] = 39'hxxx0000000;
      expv[11] = 39'hxxx0000000;
      expv[12] = 39'hxxx0000000;
      expv[13] = 39'hxxx0000001;
      expv[14] = 39'hxxx0000002;
      expv[15] = 39'hxxx0000000;
      expv[16] = 39'hxxx0000000;
      expv[17] = 39'hxxx0000001;
      expv[18] = 39'hxxx0000000;
      expv[19] = 39'hxxx0000001;
      expv[20] = 39'hxxx0000000;
      expv[21] = 39'hxxx0000000;
      expv[22] = 39'hxxx0000000;
      expv[23] = 39'hxxx0000000;
      expv[24] = 39'hxxx0000000;
      expv[25] = 39'hxxx0000000;
      expv[26] = 39'hxxx0000000;
      expv[27] = 39'hxxx0000000;
      expv[28] = 39'hxxx0000000;
      expv[29] = 39'hxxx0000001;
      expv[30] = 39'hxxx0000000;
      expv[31] = 39'hxxx0000000;
      expv[32] = 39'h0340008000;
      expv[33] = 39'h0340000001;
      expv[34] = 39'h0340000002;
      expv[35] = 39'h0340000003;
      expv[36] = 39'h0340000004;
      expv[37] = 39'h0340000004;
      expv[38] = 39'h0340000005;
      expv[39] = 39'h0340000000;
      expv[40] = 39'h0340000000;
      expv[41] = 39'h0340000001;
      expv[42] = 39'h0340000002;
      expv[43] = 39'h0340000000;
      expv[44] = 39'h0340000000;
      expv[45] = 39'h0340000000;
      expv[46] = 39'h0340000000;
      expv[47] = 39'h0340000000;
      expv[48] = 39'h0340000000;
      expv[49] = 39'h0340000000;
      expv[50] = 39'h0340000001;
      expv[51] = 39'h0340000002;
      expv[52] = 39'h0340000000;
      expv[53] = 39'h0340000000;
      expv[54] = 39'h0340000001;
      expv[55] = 39'h0340000002;
      expv[56] = 39'h0340000002;
      expv[57] = 39'h0340000000;
      expv[58] = 39'h0340000000;
      expv[59] = 39'h0340000000;
      expv[60] = 39'h0340000000;
      expv[61] = 39'h0340000000;
      expv[62] = 39'h0340000001;
      expv[63] = 39'h0340000000;
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
