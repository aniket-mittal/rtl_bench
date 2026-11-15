// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02636 dut (
    .B(in_vec[34:3]),
    .ctrl(in_vec[2:1]),
    .enable(in_vec[0:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h1e74b2683;
    stim[1] = 35'h388a18c8f;
    stim[2] = 35'h2ec320520;
    stim[3] = 35'h70f6c7746;
    stim[4] = 35'h04aa0b134;
    stim[5] = 35'h581444952;
    stim[6] = 35'h25e4aeecc;
    stim[7] = 35'h691f8ef75;
    stim[8] = 35'h201702e74;
    stim[9] = 35'h7baea1c21;
    stim[10] = 35'h6d92263dc;
    stim[11] = 35'h484dd89b9;
    stim[12] = 35'h0b32ba4b1;
    stim[13] = 35'h017d6041e;
    stim[14] = 35'h59b30225e;
    stim[15] = 35'h0ab0c0f31;
    stim[16] = 35'h2ab7681f5;
    stim[17] = 35'h69956f46f;
    stim[18] = 35'h2b2a10d1f;
    stim[19] = 35'h0f34d3281;
    stim[20] = 35'h245f892f3;
    stim[21] = 35'h1528cebb8;
    stim[22] = 35'h256085f4a;
    stim[23] = 35'h4a2005f54;
    stim[24] = 35'h77a87fe24;
    stim[25] = 35'h5778e3c26;
    stim[26] = 35'h26ed3a21c;
    stim[27] = 35'h4ec420e85;
    stim[28] = 35'h2497d0f54;
    stim[29] = 35'h5099c4b43;
    stim[30] = 35'h7d185c5d7;
    stim[31] = 35'h7205b9c64;
    stim[32] = 35'h20bfc4ae4;
    stim[33] = 35'h52b5d76b6;
    stim[34] = 35'h4c498536f;
    stim[35] = 35'h76d9d7be1;
    stim[36] = 35'h43fae743d;
    stim[37] = 35'h42f5521c0;
    stim[38] = 35'h4b921e618;
    stim[39] = 35'h62a7bf499;
    stim[40] = 35'h208129131;
    stim[41] = 35'h47977ef02;
    stim[42] = 35'h435e14223;
    stim[43] = 35'h062769c4f;
    stim[44] = 35'h5cc837206;
    stim[45] = 35'h30e98157b;
    stim[46] = 35'h372290e00;
    stim[47] = 35'h1464dce49;
    stim[48] = 35'h414f22b30;
    stim[49] = 35'h5037cb601;
    stim[50] = 35'h48447a95d;
    stim[51] = 35'h2f99973a0;
    stim[52] = 35'h1cad8e776;
    stim[53] = 35'h1cd590cd2;
    stim[54] = 35'h23b4aa70a;
    stim[55] = 35'h0cf06142e;
    stim[56] = 35'h2640ee0a6;
    stim[57] = 35'h35610aae9;
    stim[58] = 35'h202f50dcc;
    stim[59] = 35'h530d7593c;
    stim[60] = 35'h148f02c61;
    stim[61] = 35'h3e27400d7;
    stim[62] = 35'h0a156c85d;
    stim[63] = 35'h5ad1fa607;
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
      expv[0] = 32'h1e74b268;
      expv[1] = 32'h388a18c8;
      expv[2] = 32'h5d8640a4;
      expv[3] = 32'he1ed8ee8;
      expv[4] = 32'h09541626;
      expv[5] = 32'hb028892a;
      expv[6] = 32'h4bc95dd9;
      expv[7] = 32'hd23f1dee;
      expv[8] = 32'h402e05ce;
      expv[9] = 32'heeba8708;
      expv[10] = 32'hdb244c7b;
      expv[11] = 32'h2137626e;
      expv[12] = 32'h2ccae92c;
      expv[13] = 32'h02fac083;
      expv[14] = 32'hb366044b;
      expv[15] = 32'h2ac303cc;
      expv[16] = 32'h556ed03e;
      expv[17] = 32'he9956f46;
      expv[18] = 32'h2b2a10d1;
      expv[19] = 32'h3cd34ca0;
      expv[20] = 32'h245f892f;
      expv[21] = 32'h2a519d77;
      expv[22] = 32'h4ac10be9;
      expv[23] = 32'h94400bea;
      expv[24] = 32'hef50ffc4;
      expv[25] = 32'haef1c784;
      expv[26] = 32'h4dda7443;
      expv[27] = 32'h9d8841d0;
      expv[28] = 32'h492fa1ea;
      expv[29] = 32'h5099c4b4;
      expv[30] = 32'hfd185c5d;
      expv[31] = 32'he40b738c;
      expv[32] = 32'h417f895c;
      expv[33] = 32'ha56baed6;
      expv[34] = 32'hcc498536;
      expv[35] = 32'hdb675ef8;
      expv[36] = 32'h87f5ce87;
      expv[37] = 32'h85eaa438;
      expv[38] = 32'h97243cc3;
      expv[39] = 32'h8a9efd26;
      expv[40] = 32'h8204a44c;
      expv[41] = 32'h8f2efde0;
      expv[42] = 32'h435e1422;
      expv[43] = 32'h062769c4;
      expv[44] = 32'hb9906e40;
      expv[45] = 32'h30e98157;
      expv[46] = 32'h6e4521c0;
      expv[47] = 32'h51937392;
      expv[48] = 32'h829e4566;
      expv[49] = 32'h40df2d80;
      expv[50] = 32'h9088f52b;
      expv[51] = 32'h5f332e74;
      expv[52] = 32'h395b1cee;
      expv[53] = 32'h39ab219a;
      expv[54] = 32'h476954e1;
      expv[55] = 32'h19e0c285;
      expv[56] = 32'h4c81dc14;
      expv[57] = 32'hd5842aba;
      expv[58] = 32'h405ea1b9;
      expv[59] = 32'ha61aeb27;
      expv[60] = 32'h523c0b18;
      expv[61] = 32'h3e27400d;
      expv[62] = 32'h142ad90b;
      expv[63] = 32'hdad1fa60;
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
