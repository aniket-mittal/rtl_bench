// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_013298 dut (
    .data_i(in_vec[32:1]),
    .sel_i(in_vec[0:0]),
    .data_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h07d5882c4;
    stim[1] = 33'h0431525d5;
    stim[2] = 33'h19eb1bb43;
    stim[3] = 33'h0d2297d8f;
    stim[4] = 33'h04a9211ab;
    stim[5] = 33'h1be234412;
    stim[6] = 33'h053cd4e33;
    stim[7] = 33'h17e8eb272;
    stim[8] = 33'h1790d3aba;
    stim[9] = 33'h1981db9d4;
    stim[10] = 33'h11e61ca39;
    stim[11] = 33'h0b91c5baf;
    stim[12] = 33'h1a87e54be;
    stim[13] = 33'h195a9183e;
    stim[14] = 33'h1bc028045;
    stim[15] = 33'h084362df1;
    stim[16] = 33'h05a59f7a3;
    stim[17] = 33'h1c71047c7;
    stim[18] = 33'h0067e5b03;
    stim[19] = 33'h1cab4c230;
    stim[20] = 33'h1c44fddda;
    stim[21] = 33'h1df990c0c;
    stim[22] = 33'h176ec0679;
    stim[23] = 33'h0b944fe5a;
    stim[24] = 33'h0f8e3e87e;
    stim[25] = 33'h07d2e79f6;
    stim[26] = 33'h19d9763fd;
    stim[27] = 33'h190b28451;
    stim[28] = 33'h100e05d96;
    stim[29] = 33'h09e588de0;
    stim[30] = 33'h056cb5e59;
    stim[31] = 33'h1100a6779;
    stim[32] = 33'h10189fcc1;
    stim[33] = 33'h07050a1de;
    stim[34] = 33'h16031f426;
    stim[35] = 33'h10fcc4065;
    stim[36] = 33'h017b06fe6;
    stim[37] = 33'h0e9c0351a;
    stim[38] = 33'h1ca70fa08;
    stim[39] = 33'h0e7ad7af7;
    stim[40] = 33'h095a1c4ec;
    stim[41] = 33'h10196320d;
    stim[42] = 33'h06bf45b66;
    stim[43] = 33'h1061ceff0;
    stim[44] = 33'h0383a2c81;
    stim[45] = 33'h00f51c7a3;
    stim[46] = 33'h1d8f37f84;
    stim[47] = 33'h01b6749dc;
    stim[48] = 33'h17f9050e1;
    stim[49] = 33'h0b9c4ff9f;
    stim[50] = 33'h1a80abd6c;
    stim[51] = 33'h14474b7d7;
    stim[52] = 33'h0923dd773;
    stim[53] = 33'h1190e6b26;
    stim[54] = 33'h07f67b4a6;
    stim[55] = 33'h093cb406d;
    stim[56] = 33'h0cfe035af;
    stim[57] = 33'h158cd746d;
    stim[58] = 33'h1ef76e992;
    stim[59] = 33'h0c7642cd7;
    stim[60] = 33'h042760262;
    stim[61] = 33'h036e25021;
    stim[62] = 33'h1bf5d41d1;
    stim[63] = 33'h1cea7e035;
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
      expv[0] = 32'h3eac4162;
      expv[1] = 32'h218a92ea;
      expv[2] = 32'hcf58dda1;
      expv[3] = 32'h6914bec7;
      expv[4] = 32'h254908d5;
      expv[5] = 32'hdf11a209;
      expv[6] = 32'h29e6a719;
      expv[7] = 32'hbf475939;
      expv[8] = 32'hbc869d5d;
      expv[9] = 32'hcc0edcea;
      expv[10] = 32'h8f30e51c;
      expv[11] = 32'h5c8e2dd7;
      expv[12] = 32'hd43f2a5f;
      expv[13] = 32'hcad48c1f;
      expv[14] = 32'hde014022;
      expv[15] = 32'h421b16f8;
      expv[16] = 32'h2d2cfbd1;
      expv[17] = 32'he38823e3;
      expv[18] = 32'h033f2d81;
      expv[19] = 32'he55a6118;
      expv[20] = 32'he227eeed;
      expv[21] = 32'hefcc8606;
      expv[22] = 32'hbb76033c;
      expv[23] = 32'h5ca27f2d;
      expv[24] = 32'h7c71f43f;
      expv[25] = 32'h3e973cfb;
      expv[26] = 32'hcecbb1fe;
      expv[27] = 32'hc8594228;
      expv[28] = 32'h80702ecb;
      expv[29] = 32'h4f2c46f0;
      expv[30] = 32'h2b65af2c;
      expv[31] = 32'h880533bc;
      expv[32] = 32'h80c4fe60;
      expv[33] = 32'h382850ef;
      expv[34] = 32'hb018fa13;
      expv[35] = 32'h87e62032;
      expv[36] = 32'h0bd837f3;
      expv[37] = 32'h74e01a8d;
      expv[38] = 32'he5387d04;
      expv[39] = 32'h73d6bd7b;
      expv[40] = 32'h4ad0e276;
      expv[41] = 32'h80cb1906;
      expv[42] = 32'h35fa2db3;
      expv[43] = 32'h830e77f8;
      expv[44] = 32'h1c1d1640;
      expv[45] = 32'h07a8e3d1;
      expv[46] = 32'hec79bfc2;
      expv[47] = 32'h0db3a4ee;
      expv[48] = 32'hbfc82870;
      expv[49] = 32'h5ce27fcf;
      expv[50] = 32'hd4055eb6;
      expv[51] = 32'ha23a5beb;
      expv[52] = 32'h491eebb9;
      expv[53] = 32'h8c873593;
      expv[54] = 32'h3fb3da53;
      expv[55] = 32'h49e5a036;
      expv[56] = 32'h67f01ad7;
      expv[57] = 32'hac66ba36;
      expv[58] = 32'hf7bb74c9;
      expv[59] = 32'h63b2166b;
      expv[60] = 32'h213b0131;
      expv[61] = 32'h1b712810;
      expv[62] = 32'hdfaea0e8;
      expv[63] = 32'he753f01a;
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
