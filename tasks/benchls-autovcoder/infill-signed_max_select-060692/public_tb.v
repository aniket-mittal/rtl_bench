// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_060692 dut (
    .a1(in_vec[58:30]),
    .a2(in_vec[29:1]),
    .en(in_vec[0:0]),
    .max_o(out_vec[28:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h3a12ce5b29da919;
    stim[1] = 59'h70f526443ca3553;
    stim[2] = 59'h2557efe2684351f;
    stim[3] = 59'h2ea8089f84503cd;
    stim[4] = 59'h154b6a2fad0f52b;
    stim[5] = 59'h1379097a76b7bba;
    stim[6] = 59'h34e4adfaed5679c;
    stim[7] = 59'h195b1e3e287b87e;
    stim[8] = 59'h4465823cb067e13;
    stim[9] = 59'h76c07bebb687bfb;
    stim[10] = 59'h22ef42d1489d3c0;
    stim[11] = 59'h4dd174ce31a37bc;
    stim[12] = 59'h0117864d23eeed2;
    stim[13] = 59'h5fdc0c5b31ab0d2;
    stim[14] = 59'h5ec8f2e4fb60f5f;
    stim[15] = 59'h44ea125fc8e3d6a;
    stim[16] = 59'h210a952ec3eb73f;
    stim[17] = 59'h3ed4310d9149727;
    stim[18] = 59'h2dfac9c8a9368a2;
    stim[19] = 59'h481c19c1ce2be6c;
    stim[20] = 59'h2f51f860df9e29c;
    stim[21] = 59'h1abaa79f586edd4;
    stim[22] = 59'h7a143dccc824d8f;
    stim[23] = 59'h16a964d33c6c207;
    stim[24] = 59'h566e943792d3574;
    stim[25] = 59'h67966b277b623ec;
    stim[26] = 59'h1b4a4d9b2ff730d;
    stim[27] = 59'h2a6ae46b1ffbae7;
    stim[28] = 59'h5a2850c5da0c164;
    stim[29] = 59'h6bb332fd2f35e5a;
    stim[30] = 59'h3b2791794d3154f;
    stim[31] = 59'h32451bf7789ea0c;
    stim[32] = 59'h60dc7f442e8f571;
    stim[33] = 59'h484a13bc547587a;
    stim[34] = 59'h0893865d6318a8b;
    stim[35] = 59'h659adcdc22850bf;
    stim[36] = 59'h6d1f1506de7741d;
    stim[37] = 59'h3560429eeb0714c;
    stim[38] = 59'h0155ce72abed91f;
    stim[39] = 59'h232e0ca956124e5;
    stim[40] = 59'h272fbc0bb561651;
    stim[41] = 59'h39eb95eb87750a1;
    stim[42] = 59'h06ca987b983f06d;
    stim[43] = 59'h7f9a5402bda68c4;
    stim[44] = 59'h28006339d1b5d0e;
    stim[45] = 59'h4482bd1afc1e775;
    stim[46] = 59'h30a81230b37ed9c;
    stim[47] = 59'h36d3c312e4163bc;
    stim[48] = 59'h5df7c9678c44b26;
    stim[49] = 59'h4326cedd28d9652;
    stim[50] = 59'h731c7a2bc778d29;
    stim[51] = 59'h02a05762dc87498;
    stim[52] = 59'h35d854587bc3879;
    stim[53] = 59'h4530d1fd041128b;
    stim[54] = 59'h2f716125e6421ac;
    stim[55] = 59'h4f196c0093d89e4;
    stim[56] = 59'h26c5f74292bd17d;
    stim[57] = 59'h0337e3e12f1a517;
    stim[58] = 59'h511f40b9ac6b4fd;
    stim[59] = 59'h1bb042ecd0e2455;
    stim[60] = 59'h3423ca5353d359d;
    stim[61] = 59'h5499ebfe3aa5e8b;
    stim[62] = 59'h21a98e7fec08469;
    stim[63] = 59'h64d319a95fa055f;
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
      expv[0] = 29'h0e84b396;
      expv[1] = 29'h01e51aa9;
      expv[2] = 29'h0955fbf8;
      expv[3] = 29'h0baa0227;
      expv[4] = 29'h0552da8b;
      expv[5] = 29'h04de425e;
      expv[6] = 29'h0d392b7e;
      expv[7] = 29'h0656c78f;
      expv[8] = 29'h05833f09;
      expv[9] = 29'h1db01efa;
      expv[10] = 29'h08bbd0b4;
      expv[11] = 29'h13745d33;
      expv[12] = 29'h0045e193;
      expv[13] = 29'h17f70316;
      expv[14] = 29'h07db07af;
      expv[15] = 29'h113a8497;
      expv[16] = 29'h0842a54b;
      expv[17] = 29'h0fb50c43;
      expv[18] = 29'h0b7eb272;
      expv[19] = 29'h12070670;
      expv[20] = 29'h0bd47e18;
      expv[21] = 29'h06aea9e7;
      expv[22] = 29'h064126c7;
      expv[23] = 29'h05aa5934;
      expv[24] = 29'h159ba50d;
      expv[25] = 29'h19e59ac9;
      expv[26] = 29'h06d29366;
      expv[27] = 29'h0a9ab91a;
      expv[28] = 29'h168a1431;
      expv[29] = 29'h1aecccbf;
      expv[30] = 29'h0ec9e45e;
      expv[31] = 29'h0c9146fd;
      expv[32] = 29'h01747ab8;
      expv[33] = 29'h121284ef;
      expv[34] = 29'h0b18c545;
      expv[35] = 29'h0114285f;
      expv[36] = 29'h16f3ba0e;
      expv[37] = 29'h0d5810a7;
      expv[38] = 29'h0055739c;
      expv[39] = 29'h0ab09272;
      expv[40] = 29'h09cbef02;
      expv[41] = 29'h0e7ae57a;
      expv[42] = 29'h01b2a61e;
      expv[43] = 29'h1fe69500;
      expv[44] = 29'h0a0018ce;
      expv[45] = 29'h1120af46;
      expv[46] = 29'h0c2a048c;
      expv[47] = 29'h0db4f0c4;
      expv[48] = 29'h177df259;
      expv[49] = 29'h10c9b3b7;
      expv[50] = 29'h1cc71e8a;
      expv[51] = 29'h00a815d8;
      expv[52] = 29'h0d761516;
      expv[53] = 29'h08208945;
      expv[54] = 29'h0bdc5849;
      expv[55] = 29'h13c65b00;
      expv[56] = 29'h09b17dd0;
      expv[57] = 29'h0978d28b;
      expv[58] = 29'h0d635a7e;
      expv[59] = 29'h06ec10bb;
      expv[60] = 29'h0d08f294;
      expv[61] = 29'h11d52f45;
      expv[62] = 29'h086a639f;
      expv[63] = 29'h0afd02af;
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
