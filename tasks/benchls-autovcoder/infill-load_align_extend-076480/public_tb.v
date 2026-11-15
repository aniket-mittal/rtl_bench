// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_076480 dut (
    .addrtail(in_vec[36:35]),
    .width(in_vec[34:33]),
    .zext(in_vec[32:32]),
    .inval(in_vec[31:0]),
    .outval(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h03155666a9;
    stim[1] = 37'h190c8eb5a3;
    stim[2] = 37'h1a2e7533c4;
    stim[3] = 37'h11fc7edb78;
    stim[4] = 37'h17030541c6;
    stim[5] = 37'h19f3bad835;
    stim[6] = 37'h1479b332a1;
    stim[7] = 37'h19e4570ab6;
    stim[8] = 37'h067e9e78c7;
    stim[9] = 37'h07e876370d;
    stim[10] = 37'h0bd58610e5;
    stim[11] = 37'h09fa3ddca9;
    stim[12] = 37'h135cd2e443;
    stim[13] = 37'h100faf75a2;
    stim[14] = 37'h0720eb2a17;
    stim[15] = 37'h0ca8fce42e;
    stim[16] = 37'h18f6079935;
    stim[17] = 37'h1f0fdb85e0;
    stim[18] = 37'h14ff3d90d5;
    stim[19] = 37'h0f5e5d3dfc;
    stim[20] = 37'h04affe5619;
    stim[21] = 37'h11f13fae28;
    stim[22] = 37'h01d448bb0e;
    stim[23] = 37'h1e187f1d5c;
    stim[24] = 37'h195149539c;
    stim[25] = 37'h0fba113b18;
    stim[26] = 37'h07ec26e4dd;
    stim[27] = 37'h0938d6dcc2;
    stim[28] = 37'h0735ee12c3;
    stim[29] = 37'h0964008e42;
    stim[30] = 37'h16dbcf96a3;
    stim[31] = 37'h06a8d75614;
    stim[32] = 37'h19f1f60ec2;
    stim[33] = 37'h12a93b8341;
    stim[34] = 37'h187c34d657;
    stim[35] = 37'h0e6cda72c2;
    stim[36] = 37'h0b1e9c7ab3;
    stim[37] = 37'h160d0f193f;
    stim[38] = 37'h04baf2e489;
    stim[39] = 37'h0f31f40339;
    stim[40] = 37'h10ca248fc0;
    stim[41] = 37'h1f9dff9e98;
    stim[42] = 37'h1793ff8699;
    stim[43] = 37'h0653c57023;
    stim[44] = 37'h1dad7f618d;
    stim[45] = 37'h1fcac50d5a;
    stim[46] = 37'h126876c1cc;
    stim[47] = 37'h1ec7a6f6ea;
    stim[48] = 37'h05235cf1af;
    stim[49] = 37'h05bfaea738;
    stim[50] = 37'h12185bb665;
    stim[51] = 37'h197ad645a3;
    stim[52] = 37'h077e81466b;
    stim[53] = 37'h180b72b16b;
    stim[54] = 37'h0c63aa1971;
    stim[55] = 37'h1741333864;
    stim[56] = 37'h09e945c914;
    stim[57] = 37'h1f41ae75a6;
    stim[58] = 37'h0e007873f0;
    stim[59] = 37'h1ea0f2b456;
    stim[60] = 37'h1c67cf7457;
    stim[61] = 37'h14d2c78915;
    stim[62] = 37'h1448e45e24;
    stim[63] = 37'h1360ac2d5d;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h000000a9;
      expv[1] = 32'h00000000;
      expv[2] = 32'h0000002e;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h7e9e78c7;
      expv[9] = 32'he876370d;
      expv[10] = 32'h00000010;
      expv[11] = 32'h00000000;
      expv[12] = 32'h000000d2;
      expv[13] = 32'h00000000;
      expv[14] = 32'h20eb2a17;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'hec26e4dd;
      expv[27] = 32'h00000000;
      expv[28] = 32'h35ee12c3;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'ha8d75614;
      expv[32] = 32'h00000000;
      expv[33] = 32'h0000003b;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h0000007a;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h53c57023;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000076;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h0000005b;
      expv[51] = 32'h00000000;
      expv[52] = 32'h7e81466b;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h000000ac;
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
