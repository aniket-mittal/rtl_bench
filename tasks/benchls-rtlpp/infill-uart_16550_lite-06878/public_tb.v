// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06878 dut (
    .clk(clk),
    .reset(in_vec[14:14]),
    .adr(in_vec[13:13]),
    .cs(in_vec[12:12]),
    .we(in_vec[11:11]),
    .din(in_vec[10:3]),
    .txc(in_vec[2:2]),
    .rxc(in_vec[1:1]),
    .rxd(in_vec[0:0]),
    .dout(out_vec[16:9]),
    .txd(out_vec[8:8]),
    .status(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h692c;
    stim[1] = 15'h6e19;
    stim[2] = 15'h3dfd;
    stim[3] = 15'h3ef3;
    stim[4] = 15'h3135;
    stim[5] = 15'h12a9;
    stim[6] = 15'h0348;
    stim[7] = 15'h0a4e;
    stim[8] = 15'h3f5a;
    stim[9] = 15'h397e;
    stim[10] = 15'h31d8;
    stim[11] = 15'h26ea;
    stim[12] = 15'h2105;
    stim[13] = 15'h129e;
    stim[14] = 15'h2a47;
    stim[15] = 15'h1707;
    stim[16] = 15'h0c74;
    stim[17] = 15'h20cb;
    stim[18] = 15'h3b0f;
    stim[19] = 15'h33f8;
    stim[20] = 15'h116c;
    stim[21] = 15'h165b;
    stim[22] = 15'h2888;
    stim[23] = 15'h0549;
    stim[24] = 15'h3458;
    stim[25] = 15'h1f55;
    stim[26] = 15'h3f3a;
    stim[27] = 15'h298e;
    stim[28] = 15'h172b;
    stim[29] = 15'h10ca;
    stim[30] = 15'h061f;
    stim[31] = 15'h35a1;
    stim[32] = 15'h0a99;
    stim[33] = 15'h11c6;
    stim[34] = 15'h1cb5;
    stim[35] = 15'h270d;
    stim[36] = 15'h2272;
    stim[37] = 15'h0d0f;
    stim[38] = 15'h0ffb;
    stim[39] = 15'h0b57;
    stim[40] = 15'h147b;
    stim[41] = 15'h022b;
    stim[42] = 15'h3506;
    stim[43] = 15'h2066;
    stim[44] = 15'h1fab;
    stim[45] = 15'h3ddc;
    stim[46] = 15'h3446;
    stim[47] = 15'h401c;
    stim[48] = 15'h2f0d;
    stim[49] = 15'h0e7f;
    stim[50] = 15'h3535;
    stim[51] = 15'h0d69;
    stim[52] = 15'h1e37;
    stim[53] = 15'h0db8;
    stim[54] = 15'h2a58;
    stim[55] = 15'h0e6a;
    stim[56] = 15'h3882;
    stim[57] = 15'h0287;
    stim[58] = 15'h0a8a;
    stim[59] = 15'h239f;
    stim[60] = 15'h0ffa;
    stim[61] = 15'h1621;
    stim[62] = 15'h1e9c;
    stim[63] = 15'h3a17;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00301;
      expv[2] = 17'h00301;
      expv[3] = 17'h00301;
      expv[4] = 17'h00301;
      expv[5] = 17'h00101;
      expv[6] = 17'h00101;
      expv[7] = 17'h00101;
      expv[8] = 17'h00301;
      expv[9] = 17'h00301;
      expv[10] = 17'h00301;
      expv[11] = 17'h00301;
      expv[12] = 17'h00301;
      expv[13] = 17'h00101;
      expv[14] = 17'h00301;
      expv[15] = 17'h00101;
      expv[16] = 17'h00101;
      expv[17] = 17'h00301;
      expv[18] = 17'h00301;
      expv[19] = 17'h00301;
      expv[20] = 17'h00101;
      expv[21] = 17'h00101;
      expv[22] = 17'h00301;
      expv[23] = 17'h00101;
      expv[24] = 17'h00301;
      expv[25] = 17'h00101;
      expv[26] = 17'h00100;
      expv[27] = 17'h00100;
      expv[28] = 17'h00101;
      expv[29] = 17'h00101;
      expv[30] = 17'h00101;
      expv[31] = 17'h00201;
      expv[32] = 17'h00001;
      expv[33] = 17'h00001;
      expv[34] = 17'h00001;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00301;
      expv[49] = 17'h00101;
      expv[50] = 17'h00301;
      expv[51] = 17'h00101;
      expv[52] = 17'h00101;
      expv[53] = 17'h00101;
      expv[54] = 17'h00301;
      expv[55] = 17'h00101;
      expv[56] = 17'h00301;
      expv[57] = 17'h00101;
      expv[58] = 17'h00101;
      expv[59] = 17'h00301;
      expv[60] = 17'h00101;
      expv[61] = 17'h00101;
      expv[62] = 17'h00101;
      expv[63] = 17'h00100;
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
