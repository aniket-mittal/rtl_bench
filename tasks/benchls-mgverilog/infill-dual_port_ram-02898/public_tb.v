// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02898 dut (
    .clk(clk),
    .D(in_vec[24:9]),
    .WE(in_vec[8:8]),
    .AW(in_vec[7:4]),
    .AR(in_vec[3:0]),
    .QW(out_vec[31:16]),
    .QR(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h01af19e;
    stim[1] = 25'h03d39bc;
    stim[2] = 25'h1f7d4df;
    stim[3] = 25'h0ffdadc;
    stim[4] = 25'h1992500;
    stim[5] = 25'h0746140;
    stim[6] = 25'h067e106;
    stim[7] = 25'h0598ee2;
    stim[8] = 25'h0b7191e;
    stim[9] = 25'h108e0ec;
    stim[10] = 25'h0c00457;
    stim[11] = 25'h0701e15;
    stim[12] = 25'h1b7ffaa;
    stim[13] = 25'h0766e46;
    stim[14] = 25'h1f0ac5d;
    stim[15] = 25'h0a0eb7d;
    stim[16] = 25'h12fec0d;
    stim[17] = 25'h0bbe35e;
    stim[18] = 25'h0fe7ef1;
    stim[19] = 25'h030e748;
    stim[20] = 25'h0a37232;
    stim[21] = 25'h14c5864;
    stim[22] = 25'h1cc8877;
    stim[23] = 25'h0d90d61;
    stim[24] = 25'h02b40bf;
    stim[25] = 25'h1ffac21;
    stim[26] = 25'h1f7a25d;
    stim[27] = 25'h097d526;
    stim[28] = 25'h129fe45;
    stim[29] = 25'h0c76c77;
    stim[30] = 25'h13c46ef;
    stim[31] = 25'h036c1ea;
    stim[32] = 25'h0f72aa5;
    stim[33] = 25'h034e557;
    stim[34] = 25'h02b7aeb;
    stim[35] = 25'h18ac7d3;
    stim[36] = 25'h19dc90b;
    stim[37] = 25'h1316619;
    stim[38] = 25'h084fdb1;
    stim[39] = 25'h061baa9;
    stim[40] = 25'h0fae90f;
    stim[41] = 25'h1891c91;
    stim[42] = 25'h189d5c7;
    stim[43] = 25'h0f27a3f;
    stim[44] = 25'h17fa274;
    stim[45] = 25'h148281b;
    stim[46] = 25'h1921e2a;
    stim[47] = 25'h13fae88;
    stim[48] = 25'h14d2c52;
    stim[49] = 25'h1ab339c;
    stim[50] = 25'h081108b;
    stim[51] = 25'h087f31d;
    stim[52] = 25'h09cedcd;
    stim[53] = 25'h12f5a8e;
    stim[54] = 25'h0e5882f;
    stim[55] = 25'h0e314a2;
    stim[56] = 25'h1458754;
    stim[57] = 25'h08a6168;
    stim[58] = 25'h0b8496b;
    stim[59] = 25'h1546d5b;
    stim[60] = 25'h0c25168;
    stim[61] = 25'h17076d6;
    stim[62] = 25'h1c56525;
    stim[63] = 25'h1bf684a;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxcc92;
      expv[6] = 32'hcc92xxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'h5b8cxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'h3a30xxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'h33f0xxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxx5b8c;
      expv[19] = 32'h3a30xxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxx1873;
      expv[22] = 32'h50755075;
      expv[23] = 32'hxxxx5b8c;
      expv[24] = 32'h1e9cxxxx;
      expv[25] = 32'hxxxx5b8c;
      expv[26] = 32'h5df1xxxx;
      expv[27] = 32'hxxxx6c86;
      expv[28] = 32'h18735df1;
      expv[29] = 32'h50755075;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxdbff;
      expv[32] = 32'hdbff5df1;
      expv[33] = 32'h5df15075;
      expv[34] = 32'h1b601e9c;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'h33f01e9c;
      expv[37] = 32'h5b8c0d78;
      expv[38] = 32'h1e9c5b8c;
      expv[39] = 32'hdbff0d78;
      expv[40] = 32'hcee4xxxx;
      expv[41] = 32'h0d785b8c;
      expv[42] = 32'hxxxx5075;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'h50751873;
      expv[45] = 32'h5b8c427e;
      expv[46] = 32'h4beadbff;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'h1a724bea;
      expv[49] = 32'h0d78c4ea;
      expv[50] = 32'hxxxx427e;
      expv[51] = 32'h5b8cc563;
      expv[52] = 32'hc4eac563;
      expv[53] = 32'hxxxx1b60;
      expv[54] = 32'h4beaxxxx;
      expv[55] = 32'hdbff4bea;
      expv[56] = 32'h1a721873;
      expv[57] = 32'h6c86xxxx;
      expv[58] = 32'h4530427e;
      expv[59] = 32'ha2c3427e;
      expv[60] = 32'h5c24xxxx;
      expv[61] = 32'hc5636128;
      expv[62] = 32'h4beaaa36;
      expv[63] = 32'h1873dbff;
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
