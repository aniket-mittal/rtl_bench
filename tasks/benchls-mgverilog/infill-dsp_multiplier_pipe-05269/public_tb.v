// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05269 dut (
    .clk(clk),
    .ce(in_vec[57:57]),
    .a(in_vec[56:28]),
    .b(in_vec[27:0]),
    .p(out_vec[46:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h295ada8e6305d4b;
    stim[1] = 58'h2005e4b8e26f3c0;
    stim[2] = 58'h3afd079e7b558c7;
    stim[3] = 58'h27f32f7a3eb2db5;
    stim[4] = 58'h03c9be11cc2b250;
    stim[5] = 58'h0863276c27e6d9f;
    stim[6] = 58'h22dec03a1d016ce;
    stim[7] = 58'h30f7b35fc275dc1;
    stim[8] = 58'h11a5d924316f15b;
    stim[9] = 58'h2ef6b2022020095;
    stim[10] = 58'h1471690c5f44446;
    stim[11] = 58'h33481c0fe091408;
    stim[12] = 58'h3860b90e5469b92;
    stim[13] = 58'h2c2771dea22716e;
    stim[14] = 58'h05cad3e7bc08b67;
    stim[15] = 58'h1ac33fb021c16c7;
    stim[16] = 58'h1f81b49f9d6c982;
    stim[17] = 58'h1b44fe55dea4e69;
    stim[18] = 58'h22ba2da4f192a60;
    stim[19] = 58'h29e844848dbda31;
    stim[20] = 58'h0f25a85d9c4c145;
    stim[21] = 58'h17f4c23414d8384;
    stim[22] = 58'h037a7c2adc02977;
    stim[23] = 58'h055e7cf74b5e782;
    stim[24] = 58'h24fdbcb557e5649;
    stim[25] = 58'h24c248c88f460af;
    stim[26] = 58'h24aacd8de21488f;
    stim[27] = 58'h17ad6c48e165746;
    stim[28] = 58'h1bd9e59e6aa5a44;
    stim[29] = 58'h24e9bf394bb2af2;
    stim[30] = 58'h18e43c0e7089e5b;
    stim[31] = 58'h25a5154034b2382;
    stim[32] = 58'h2c3fbd94701e7cf;
    stim[33] = 58'h326a7b5ce3c7832;
    stim[34] = 58'h3ff6f0e6c3cec46;
    stim[35] = 58'h32a9e8cbea8765c;
    stim[36] = 58'h3a64ad18321f0ad;
    stim[37] = 58'h0f1ebf1b890686d;
    stim[38] = 58'h2fd3cd3723578f5;
    stim[39] = 58'h013e849be8f77c0;
    stim[40] = 58'h1bce0027d0af193;
    stim[41] = 58'h12ebd3b4d6baa4e;
    stim[42] = 58'h0c3a8040c0cce0e;
    stim[43] = 58'h27938e5745c9ae7;
    stim[44] = 58'h0792f98512ed516;
    stim[45] = 58'h00f837347839a2d;
    stim[46] = 58'h16918bd8b21cb59;
    stim[47] = 58'h12db4d2b44f9778;
    stim[48] = 58'h2043409fac771bd;
    stim[49] = 58'h36ccef224e7fcde;
    stim[50] = 58'h02ccda66a8d2d14;
    stim[51] = 58'h3fdafdbfd9bbe67;
    stim[52] = 58'h3ff8ed3b4600109;
    stim[53] = 58'h14a49f286870164;
    stim[54] = 58'h0a130321b6290b8;
    stim[55] = 58'h0f1cb41bd125826;
    stim[56] = 58'h084b9651853439d;
    stim[57] = 58'h360a50cdcbcc459;
    stim[58] = 58'h394f912d83713a7;
    stim[59] = 58'h04f80410bc7e227;
    stim[60] = 58'h0f159aefc4a022d;
    stim[61] = 58'h14ea79df58a6c08;
    stim[62] = 58'h2dd9a8a291fe33e;
    stim[63] = 58'h277c0d17095af96;
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
      expv[0] = 47'hxxxxxxxxxxxx;
      expv[1] = 47'hxxxxxxxxxxxx;
      expv[2] = 47'h65910da39d9a;
      expv[3] = 47'h53679fd63200;
      expv[4] = 47'h5e5eca053bd2;
      expv[5] = 47'h5e5eca053bd2;
      expv[6] = 47'h5e5eca053bd2;
      expv[7] = 47'h273661470342;
      expv[8] = 47'h33fddce3aaac;
      expv[9] = 47'h33fddce3aaac;
      expv[10] = 47'h4ca36e60bd9f;
      expv[11] = 47'h4ca36e60bd9f;
      expv[12] = 47'h0b5a1d999b2a;
      expv[13] = 47'h7e130af90c78;
      expv[14] = 47'h496e170903fc;
      expv[15] = 47'h496e170903fc;
      expv[16] = 47'h496e170903fc;
      expv[17] = 47'h496e170903fc;
      expv[18] = 47'h496e170903fc;
      expv[19] = 47'h2d126db1eb64;
      expv[20] = 47'h2d4ea2520580;
      expv[21] = 47'h2d4ea2520580;
      expv[22] = 47'h2d4ea2520580;
      expv[23] = 47'h2d4ea2520580;
      expv[24] = 47'h2d4ea2520580;
      expv[25] = 47'h44486cb98544;
      expv[26] = 47'h6b4113d59d9d;
      expv[27] = 47'h1d3fbabac0b8;
      expv[28] = 47'h1d3fbabac0b8;
      expv[29] = 47'h1d3fbabac0b8;
      expv[30] = 47'h7294da6579c3;
      expv[31] = 47'h7294da6579c3;
      expv[32] = 47'h3e8e90f91de2;
      expv[33] = 47'h1765697c8a80;
      expv[34] = 47'h5586352ed6ac;
      expv[35] = 47'h1d53342f37f8;
      expv[36] = 47'h1122e181e6e4;
      expv[37] = 47'h041165953af4;
      expv[38] = 47'h041165953af4;
      expv[39] = 47'h6fbc30677938;
      expv[40] = 47'h6fbc30677938;
      expv[41] = 47'h6fbc30677938;
      expv[42] = 47'h6fbc30677938;
      expv[43] = 47'h6fbc30677938;
      expv[44] = 47'h75ee58482da3;
      expv[45] = 47'h75ee58482da3;
      expv[46] = 47'h75ee58482da3;
      expv[47] = 47'h75ee58482da3;
      expv[48] = 47'h75ee58482da3;
      expv[49] = 47'h0bd61d09c681;
      expv[50] = 47'h54eb52c5e463;
      expv[51] = 47'h54eb52c5e463;
      expv[52] = 47'h5d9210cad77c;
      expv[53] = 47'h085ecf14d9d9;
      expv[54] = 47'h085ecf14d9d9;
      expv[55] = 47'h085ecf14d9d9;
      expv[56] = 47'h085ecf14d9d9;
      expv[57] = 47'h085ecf14d9d9;
      expv[58] = 47'h610ddacd9213;
      expv[59] = 47'h23b961ff0b45;
      expv[60] = 47'h23b961ff0b45;
      expv[61] = 47'h23b961ff0b45;
      expv[62] = 47'h23b961ff0b45;
      expv[63] = 47'h0c1e23590b5b;
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
