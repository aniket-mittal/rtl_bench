// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_092587 dut (
    .WRb(clk),
    .RST(in_vec[20:20]),
    .A(in_vec[19:18]),
    .CSb(in_vec[17:17]),
    .RDb(in_vec[16:16]),
    .DIN(in_vec[15:8]),
    .PB(in_vec[7:0]),
    .PA(out_vec[23:16]),
    .PC(out_vec[15:8]),
    .DOUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h17aa11;
    stim[1] = 21'h1d365e;
    stim[2] = 21'h0dd330;
    stim[3] = 21'h04d5e6;
    stim[4] = 21'h003d7f;
    stim[5] = 21'h0b46b9;
    stim[6] = 21'h02a35a;
    stim[7] = 21'h098379;
    stim[8] = 21'h0fd6d9;
    stim[9] = 21'h0d59db;
    stim[10] = 21'h000e76;
    stim[11] = 21'h06b3d9;
    stim[12] = 21'h0d722f;
    stim[13] = 21'h01c0f8;
    stim[14] = 21'h019dc8;
    stim[15] = 21'h0ed9ca;
    stim[16] = 21'h0159b5;
    stim[17] = 21'h0c4ee5;
    stim[18] = 21'h038903;
    stim[19] = 21'h0cc09e;
    stim[20] = 21'h0a1160;
    stim[21] = 21'h02124c;
    stim[22] = 21'h088ccc;
    stim[23] = 21'h0c9c7c;
    stim[24] = 21'h055c41;
    stim[25] = 21'h07f6ac;
    stim[26] = 21'h0ecf7d;
    stim[27] = 21'h045fc5;
    stim[28] = 21'h06070c;
    stim[29] = 21'h042520;
    stim[30] = 21'h02871d;
    stim[31] = 21'h0e6e93;
    stim[32] = 21'h06e16a;
    stim[33] = 21'h094e59;
    stim[34] = 21'h0ee18a;
    stim[35] = 21'h0d3ee0;
    stim[36] = 21'h08f6d4;
    stim[37] = 21'h06ee5b;
    stim[38] = 21'h006f2c;
    stim[39] = 21'h00702c;
    stim[40] = 21'h0c8f79;
    stim[41] = 21'h0d51ca;
    stim[42] = 21'h0c4ccb;
    stim[43] = 21'h0ecefb;
    stim[44] = 21'h022802;
    stim[45] = 21'h063889;
    stim[46] = 21'h07d775;
    stim[47] = 21'h03302d;
    stim[48] = 21'h003ba2;
    stim[49] = 21'h08350a;
    stim[50] = 21'h0c3dae;
    stim[51] = 21'h054b3d;
    stim[52] = 21'h06def9;
    stim[53] = 21'h07c066;
    stim[54] = 21'h0f1327;
    stim[55] = 21'h07981f;
    stim[56] = 21'h0ca0f9;
    stim[57] = 21'h07e33e;
    stim[58] = 21'h0b5587;
    stim[59] = 21'h098996;
    stim[60] = 21'h075b91;
    stim[61] = 21'h00ebf1;
    stim[62] = 21'h0bda21;
    stim[63] = 21'h0c0bf0;
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
      expv[0] = 24'h000011;
      expv[1] = 24'h00009b;
      expv[2] = 24'h00009b;
      expv[3] = 24'h0000e6;
      expv[4] = 24'h000000;
      expv[5] = 24'h3d0000;
      expv[6] = 24'h3d003d;
      expv[7] = 24'h3d0000;
      expv[8] = 24'h3d83d3;
      expv[9] = 24'h3d83d3;
      expv[10] = 24'h3d933d;
      expv[11] = 24'h0e93d9;
      expv[12] = 24'h0e93d3;
      expv[13] = 24'h0e910e;
      expv[14] = 24'hc091c0;
      expv[15] = 24'h9d91d3;
      expv[16] = 24'h9d919d;
      expv[17] = 24'h5991d3;
      expv[18] = 24'h591159;
      expv[19] = 24'h5911d3;
      expv[20] = 24'h591111;
      expv[21] = 24'h591159;
      expv[22] = 24'h591111;
      expv[23] = 24'h598cc0;
      expv[24] = 24'h598c41;
      expv[25] = 24'h598cac;
      expv[26] = 24'h598c9c;
      expv[27] = 24'h598cc5;
      expv[28] = 24'h598c0c;
      expv[29] = 24'h598c20;
      expv[30] = 24'h598c59;
      expv[31] = 24'h598c9c;
      expv[32] = 24'h598c6a;
      expv[33] = 24'h598c8c;
      expv[34] = 24'h594e9c;
      expv[35] = 24'h594e9c;
      expv[36] = 24'h594e4e;
      expv[37] = 24'h59f65b;
      expv[38] = 24'h59f659;
      expv[39] = 24'h6ff66f;
      expv[40] = 24'h70f69c;
      expv[41] = 24'h70f68f;
      expv[42] = 24'h70f78f;
      expv[43] = 24'h70b78f;
      expv[44] = 24'h70b770;
      expv[45] = 24'h70b789;
      expv[46] = 24'h70b775;
      expv[47] = 24'h70b770;
      expv[48] = 24'h70b770;
      expv[49] = 24'h3bb7b7;
      expv[50] = 24'h3b358f;
      expv[51] = 24'h3b753d;
      expv[52] = 24'h3b75f9;
      expv[53] = 24'h3b7566;
      expv[54] = 24'h3b758f;
      expv[55] = 24'h3b751f;
      expv[56] = 24'h3b758f;
      expv[57] = 24'h3b753e;
      expv[58] = 24'h3b7575;
      expv[59] = 24'h3b7575;
      expv[60] = 24'h3b8991;
      expv[61] = 24'h3b893b;
      expv[62] = 24'heb8989;
      expv[63] = 24'heb89a0;
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
