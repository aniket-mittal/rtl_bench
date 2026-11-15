// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_180182 dut (
    .clock(clk),
    .dividend(in_vec[65:34]),
    .divisor(in_vec[33:2]),
    .start(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .q(out_vec[64:33]),
    .r(out_vec[32:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3061268b3efcacc3d;
    stim[1] = 66'h32502c9b1f7f12065;
    stim[2] = 66'h3ed63dbf40169cc4c;
    stim[3] = 66'h22e52fc965811f0c2;
    stim[4] = 66'h2295a7b40c61cb0f2;
    stim[5] = 66'h25ed5b19ae308895a;
    stim[6] = 66'h07424abfc1272e2fe;
    stim[7] = 66'h0ff7240fb798b41da;
    stim[8] = 66'h1eb65716441362ac4;
    stim[9] = 66'h0aff34889ad276656;
    stim[10] = 66'h063cf221dfa9b9196;
    stim[11] = 66'h1c8744e3a3477e21e;
    stim[12] = 66'h165f2f5f980bb842e;
    stim[13] = 66'h2e273eba3e5d552b2;
    stim[14] = 66'h38ec5ac5bc4ee2c80;
    stim[15] = 66'h214dec72226e203e4;
    stim[16] = 66'h329283d809018f8bc;
    stim[17] = 66'h0a2e2499719e186d6;
    stim[18] = 66'h27fcecbffadca431e;
    stim[19] = 66'h206b52ef015247d40;
    stim[20] = 66'h2750e043f062e6708;
    stim[21] = 66'h2e9ef429d8c32459a;
    stim[22] = 66'h2935ea32278dd1e80;
    stim[23] = 66'h10bb6dfdf19be33ae;
    stim[24] = 66'h1d8ef274f219e314e;
    stim[25] = 66'h29d7d23d5f6a9c6e4;
    stim[26] = 66'h19bd184b49a6217b0;
    stim[27] = 66'h0f4a1d07a104825a0;
    stim[28] = 66'h228a89327ff065620;
    stim[29] = 66'h0fd05930fae660892;
    stim[30] = 66'h0e3f0ea8518a2f7a0;
    stim[31] = 66'h2966f6d0df03c6608;
    stim[32] = 66'h1a7c76a8b8fbd8600;
    stim[33] = 66'h011ae6c659b735830;
    stim[34] = 66'h085ee072331d6ad44;
    stim[35] = 66'h185b2a5063ea729b2;
    stim[36] = 66'h3b887a762643d1c86;
    stim[37] = 66'h2139ef7924c911646;
    stim[38] = 66'h1ad8b7cc777c21cce;
    stim[39] = 66'h2b0e669205f153e16;
    stim[40] = 66'h1e7bc9b4de51c7228;
    stim[41] = 66'h37e2933a147069e65;
    stim[42] = 66'h2da21e568a4d5b5b6;
    stim[43] = 66'h3a1c4634370c868bc;
    stim[44] = 66'h0ff95281a5adb8da8;
    stim[45] = 66'h2acdebb8dbef1feb0;
    stim[46] = 66'h036362558d74e5dc4;
    stim[47] = 66'h02b6af2a2d239db3e;
    stim[48] = 66'h0530df7a0b329a456;
    stim[49] = 66'h32057de60fb2414c8;
    stim[50] = 66'h108543db3bd9e126e;
    stim[51] = 66'h32e16fdbd02a9c97a;
    stim[52] = 66'h01aa9cddd57191eee;
    stim[53] = 66'h0b579bd3d2dc9b2e2;
    stim[54] = 66'h0fba0be3a0caf2702;
    stim[55] = 66'h3c062acae1a2636d4;
    stim[56] = 66'h09b45f9cd413630ce;
    stim[57] = 66'h36148e61998b70e2e;
    stim[58] = 66'h22263a3cfffb24630;
    stim[59] = 66'h1f54c1dbb1dceeb62;
    stim[60] = 66'h2645a18b6cbae6338;
    stim[61] = 66'h00af9ee0b856d4d34;
    stim[62] = 66'h31ea5f669dff1db68;
    stim[63] = 66'h383c5905a0701cb72;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h117297e4a00000001;
      expv[5] = 65'h0eb52c26000000001;
      expv[6] = 65'h0d095273400000001;
      expv[7] = 65'h1c5edaa0200000001;
      expv[8] = 65'h07fb9207c00000001;
      expv[9] = 65'h0ff7240fxxxxxxxxx;
      expv[10] = 65'h057f9a44400000001;
      expv[11] = 65'h1ce186ef200000001;
      expv[12] = 65'h0e43a271c00000001;
      expv[13] = 65'h0b2f97afc00000001;
      expv[14] = 65'h08ec60a3000000001;
      expv[15] = 65'h11d8c1460433a5f15;
      expv[16] = 65'h1c4e7d7400d1556a9;
      expv[17] = 65'h189cfae81c9daf795;
      expv[18] = 65'h0517124ca00000001;
      expv[19] = 65'h13fe765fe00000001;
      expv[20] = 65'h18031340600000001;
      expv[21] = 65'h0ff9d97f4291ade73;
      expv[22] = 65'h08b085eb200000001;
      expv[23] = 65'h0e9ef429dd6e5218f;
      expv[24] = 65'h17a24901200000001;
      expv[25] = 65'h113886c5a00000001;
      expv[26] = 65'h1d8ef274d39e6dd35;
      expv[27] = 65'h04e21b16990cf18a7;
      expv[28] = 65'h163bc9d3056e83b73;
      expv[29] = 65'h13886c59e00000001;
      expv[30] = 65'h07e82c98600000001;
      expv[31] = 65'h102fa6cf3e7b75419;
      expv[32] = 65'h005f4d9e5d7330449;
      expv[33] = 65'h1f4164c39ef7bb031;
      expv[34] = 65'h017d3678e00000001;
      expv[35] = 65'h02fa6cf1a1848abe9;
      expv[36] = 65'h0c2d9528200000001;
      expv[37] = 65'h023bc2c5000000001;
      expv[38] = 65'h109cf7bc800000001;
      expv[39] = 65'h1293a419e00000001;
      expv[40] = 65'h0a78ccb7000000001;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h092ef0d4c00000001;
      expv[44] = 65'h0da21e569d07560f7;
      expv[45] = 65'h1b443cad0526adadb;
      expv[46] = 65'h097786a6222e03bd1;
      expv[47] = 65'h0d10f2b3a00000001;
      expv[48] = 65'h015b5795000000001;
      expv[49] = 65'h1d679043000000001;
      expv[50] = 65'h1acf20861d07560f7;
      expv[51] = 65'h17bd5e12800000001;
      expv[52] = 65'h068f4812200000001;
      expv[53] = 65'h00d54e6ee00000001;
      expv[54] = 65'h1a543216200000001;
      expv[55] = 65'h07dd05f1c00000001;
      expv[56] = 65'h0fba0be39a66b2dd7;
      expv[57] = 65'h1b25d031a00000001;
      expv[58] = 65'h04f5b8cf400000001;
      expv[59] = 65'h16148e61906579381;
      expv[60] = 65'h0faa60edc00000001;
      expv[61] = 65'h00ab3e24933a478eb;
      expv[62] = 65'h01567c49071188a51;
      expv[63] = 65'h1d53076e05b42fcc7;
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
