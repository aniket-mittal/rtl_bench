// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04935 dut (
    .clk(clk),
    .I_in(in_vec[23:12]),
    .Q_in(in_vec[11:0]),
    .d_out(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hf50a3d;
    stim[1] = 24'hec3490;
    stim[2] = 24'h1cec23;
    stim[3] = 24'h3e2afe;
    stim[4] = 24'h7fe606;
    stim[5] = 24'h2c1658;
    stim[6] = 24'h131c54;
    stim[7] = 24'h606f36;
    stim[8] = 24'h50f310;
    stim[9] = 24'hcd97c7;
    stim[10] = 24'h535a83;
    stim[11] = 24'h295248;
    stim[12] = 24'h0e3928;
    stim[13] = 24'h4cddef;
    stim[14] = 24'hbf7a43;
    stim[15] = 24'h512195;
    stim[16] = 24'h40e96c;
    stim[17] = 24'h895558;
    stim[18] = 24'h57cff2;
    stim[19] = 24'h857ccb;
    stim[20] = 24'hbe0b86;
    stim[21] = 24'ha741f0;
    stim[22] = 24'h0bb843;
    stim[23] = 24'h306195;
    stim[24] = 24'hdf86ee;
    stim[25] = 24'hdcd9bc;
    stim[26] = 24'h7e973a;
    stim[27] = 24'h4ddc13;
    stim[28] = 24'h3ac07f;
    stim[29] = 24'he0e7f4;
    stim[30] = 24'hc29808;
    stim[31] = 24'h25415d;
    stim[32] = 24'h05259e;
    stim[33] = 24'h5ec4d4;
    stim[34] = 24'h91fca2;
    stim[35] = 24'hee90ef;
    stim[36] = 24'h92b563;
    stim[37] = 24'hcd1624;
    stim[38] = 24'h3d535d;
    stim[39] = 24'hdb4753;
    stim[40] = 24'h2c18c3;
    stim[41] = 24'hd02ced;
    stim[42] = 24'hf20f2b;
    stim[43] = 24'hfe16df;
    stim[44] = 24'hb32c22;
    stim[45] = 24'ha8b8ca;
    stim[46] = 24'h0ef0bf;
    stim[47] = 24'h349c74;
    stim[48] = 24'h793864;
    stim[49] = 24'he78b09;
    stim[50] = 24'hec0e58;
    stim[51] = 24'hdd8b91;
    stim[52] = 24'h1e5564;
    stim[53] = 24'h33bdf6;
    stim[54] = 24'hd9114a;
    stim[55] = 24'h38291c;
    stim[56] = 24'h69fa56;
    stim[57] = 24'h4e6143;
    stim[58] = 24'hb0b10e;
    stim[59] = 24'hb81c47;
    stim[60] = 24'hc35de5;
    stim[61] = 24'h383144;
    stim[62] = 24'hd69e02;
    stim[63] = 24'h7dc831;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'h5cd;
      expv[5] = 12'h4ba;
      expv[6] = 12'h443;
      expv[7] = 12'h656;
      expv[8] = 12'ha02;
      expv[9] = 12'h6ea;
      expv[10] = 12'h3dc;
      expv[11] = 12'h613;
      expv[12] = 12'h5e9;
      expv[13] = 12'h864;
      expv[14] = 12'h790;
      expv[15] = 12'h372;
      expv[16] = 12'h6e6;
      expv[17] = 12'h53a;
      expv[18] = 12'h703;
      expv[19] = 12'h54f;
      expv[20] = 12'h7ba;
      expv[21] = 12'h924;
      expv[22] = 12'h57c;
      expv[23] = 12'h84d;
      expv[24] = 12'h616;
      expv[25] = 12'h5e0;
      expv[26] = 12'h7c5;
      expv[27] = 12'h369;
      expv[28] = 12'h738;
      expv[29] = 12'h6a3;
      expv[30] = 12'hab6;
      expv[31] = 12'h640;
      expv[32] = 12'h3b4;
      expv[33] = 12'h830;
      expv[34] = 12'h8d8;
      expv[35] = 12'h2b2;
      expv[36] = 12'h5a0;
      expv[37] = 12'h7a4;
      expv[38] = 12'h7a8;
      expv[39] = 12'h16f;
      expv[40] = 12'h8b3;
      expv[41] = 12'h6ea;
      expv[42] = 12'h519;
      expv[43] = 12'h7ad;
      expv[44] = 12'h7be;
      expv[45] = 12'h44a;
      expv[46] = 12'h135;
      expv[47] = 12'h6df;
      expv[48] = 12'h62a;
      expv[49] = 12'h90b;
      expv[50] = 12'h131;
      expv[51] = 12'h4d5;
      expv[52] = 12'habc;
      expv[53] = 12'h532;
      expv[54] = 12'h213;
      expv[55] = 12'h4ee;
      expv[56] = 12'h5b6;
      expv[57] = 12'h3d1;
      expv[58] = 12'h2c1;
      expv[59] = 12'h7bb;
      expv[60] = 12'h8b6;
      expv[61] = 12'h50e;
      expv[62] = 12'h511;
      expv[63] = 12'h5d6;
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
