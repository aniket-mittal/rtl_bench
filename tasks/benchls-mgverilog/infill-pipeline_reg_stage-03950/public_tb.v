// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03950 dut (
    .clk(clk),
    .dbusWire1(in_vec[97:66]),
    .DselectWire2(in_vec[65:34]),
    .bbusWire2(in_vec[33:2]),
    .lwSwFlag2(in_vec[1:0]),
    .dbusWire2(out_vec[97:66]),
    .DselectWire3(out_vec[65:34]),
    .bbusWire3(out_vec[33:2]),
    .lwSwFlag3(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h104f06f21c052de62ba815975;
    stim[1] = 98'h39d60cfcd5054998a8145b425;
    stim[2] = 98'h34d5081669e2e0f2ec4bc72ea;
    stim[3] = 98'h18d1d7a3e7b3cabab1a662cff;
    stim[4] = 98'h095a5557d49149ddf3b31525d;
    stim[5] = 98'h08af6a058c09364387fa7aca5;
    stim[6] = 98'h29ef09b2871e4fc8d78cb710e;
    stim[7] = 98'h0110f67a3cfdf749b56e2997f;
    stim[8] = 98'h0f266551747831d8708270d75;
    stim[9] = 98'h30615494853f34aadc913923b;
    stim[10] = 98'h1b368625ca6334d74df9bdd6f;
    stim[11] = 98'h0c242d648906f749215f12e51;
    stim[12] = 98'h20fa3da7ce4a9fc64fc69003b;
    stim[13] = 98'h16991d24a31909eeb3d129ab4;
    stim[14] = 98'h3a8f9ac157f8e14e846bbeb85;
    stim[15] = 98'h24ddc87cde8139f444f715069;
    stim[16] = 98'h0436e6b63253ffc3e5ccc9801;
    stim[17] = 98'h136f4f6fb03f9f30aff0c7252;
    stim[18] = 98'h21ea6ca43ea2f6c959ca992c7;
    stim[19] = 98'h27c74a4bdb421a380fa6f7dc0;
    stim[20] = 98'h08af507a4728276828e4963a8;
    stim[21] = 98'h0374695379ac275351143d7c2;
    stim[22] = 98'h124b3376616d1d417c477ef81;
    stim[23] = 98'h1c0874093ecf350bf749356e0;
    stim[24] = 98'h2794f6b640abbf6461c7e3b80;
    stim[25] = 98'h330183028db0d1deddee6e0fa;
    stim[26] = 98'h08e7669d87444d6f7bbf4e0c2;
    stim[27] = 98'h233c8d605ea54e7f744e4ddcc;
    stim[28] = 98'h3dabfcd809f0bdac069731ea6;
    stim[29] = 98'h13c98b0b52bb775292a0fe751;
    stim[30] = 98'h3726e92947c94df5174f4d229;
    stim[31] = 98'h2e2e7ea90b116218fccb12037;
    stim[32] = 98'h25425b5a14e39ce09f0a2f31a;
    stim[33] = 98'h360b60070b81d397ff249f18f;
    stim[34] = 98'h3b2eea8f56ca986f630ec1abe;
    stim[35] = 98'h02f38d64e1c50789c55ca046b;
    stim[36] = 98'h0b4b20bd64dc47a27eb1ae5bc;
    stim[37] = 98'h2f32590a40b248c169fd6d918;
    stim[38] = 98'h296392c0d1cc062d816096271;
    stim[39] = 98'h25b8e65e4b80d1235faca33ec;
    stim[40] = 98'h3182870822ede52b4e3435a64;
    stim[41] = 98'h25927a0e2511874988bcf7964;
    stim[42] = 98'h2d9f22cbdd5a504161ab426a8;
    stim[43] = 98'h30174612720703115d0d12dd6;
    stim[44] = 98'h298d4112de47ffc498ea3c617;
    stim[45] = 98'h307da05619eab4efe78e20bb9;
    stim[46] = 98'h3cdd16b614f9b47eb0cde6fbe;
    stim[47] = 98'h03229e78357c69c40147aae9b;
    stim[48] = 98'h0cb2ae1e12ded4aceedb27cbd;
    stim[49] = 98'h3ee7703dffe861414ed06b3ce;
    stim[50] = 98'h1fa7d477cb813fb18461ab23d;
    stim[51] = 98'h1e95bfcd087a02fe1d89f5dc9;
    stim[52] = 98'h1204a7b2488ff6d14c0d11058;
    stim[53] = 98'h2cfdd14d17d2ba2d0e2c6411f;
    stim[54] = 98'h206835ea8521ec702843319ce;
    stim[55] = 98'h3d767ae93661e2a6d297929d4;
    stim[56] = 98'h3fef094978349c18e1a0ee2b9;
    stim[57] = 98'h2a79f13d7da86348da9be9fdf;
    stim[58] = 98'h177b46f9df5e0e64505560ba6;
    stim[59] = 98'h0168bacac08fd1d9dd73072ce;
    stim[60] = 98'h1b79d67a2cfcb72868e5964bb;
    stim[61] = 98'h255fe68e6afb83e3d58eb2bde;
    stim[62] = 98'h1d71cb81a5d508f990124a11a;
    stim[63] = 98'h39054b02138267dd8c0994d8f;
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
      expv[0] = 98'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 98'h104f06f21c052de62ba815975;
      expv[2] = 98'h39d60cfcd5054998a8145b425;
      expv[3] = 98'h34d5081669e2e0f2ec4bc72ea;
      expv[4] = 98'h18d1d7a3e7b3cabab1a662cff;
      expv[5] = 98'h095a5557d49149ddf3b31525d;
      expv[6] = 98'h08af6a058c09364387fa7aca5;
      expv[7] = 98'h29ef09b2871e4fc8d78cb710e;
      expv[8] = 98'h0110f67a3cfdf749b56e2997f;
      expv[9] = 98'h0f266551747831d8708270d75;
      expv[10] = 98'h30615494853f34aadc913923b;
      expv[11] = 98'h1b368625ca6334d74df9bdd6f;
      expv[12] = 98'h0c242d648906f749215f12e51;
      expv[13] = 98'h20fa3da7ce4a9fc64fc69003b;
      expv[14] = 98'h16991d24a31909eeb3d129ab4;
      expv[15] = 98'h3a8f9ac157f8e14e846bbeb85;
      expv[16] = 98'h24ddc87cde8139f444f715069;
      expv[17] = 98'h0436e6b63253ffc3e5ccc9801;
      expv[18] = 98'h136f4f6fb03f9f30aff0c7252;
      expv[19] = 98'h21ea6ca43ea2f6c959ca992c7;
      expv[20] = 98'h27c74a4bdb421a380fa6f7dc0;
      expv[21] = 98'h08af507a4728276828e4963a8;
      expv[22] = 98'h0374695379ac275351143d7c2;
      expv[23] = 98'h124b3376616d1d417c477ef81;
      expv[24] = 98'h1c0874093ecf350bf749356e0;
      expv[25] = 98'h2794f6b640abbf6461c7e3b80;
      expv[26] = 98'h330183028db0d1deddee6e0fa;
      expv[27] = 98'h08e7669d87444d6f7bbf4e0c2;
      expv[28] = 98'h233c8d605ea54e7f744e4ddcc;
      expv[29] = 98'h3dabfcd809f0bdac069731ea6;
      expv[30] = 98'h13c98b0b52bb775292a0fe751;
      expv[31] = 98'h3726e92947c94df5174f4d229;
      expv[32] = 98'h2e2e7ea90b116218fccb12037;
      expv[33] = 98'h25425b5a14e39ce09f0a2f31a;
      expv[34] = 98'h360b60070b81d397ff249f18f;
      expv[35] = 98'h3b2eea8f56ca986f630ec1abe;
      expv[36] = 98'h02f38d64e1c50789c55ca046b;
      expv[37] = 98'h0b4b20bd64dc47a27eb1ae5bc;
      expv[38] = 98'h2f32590a40b248c169fd6d918;
      expv[39] = 98'h296392c0d1cc062d816096271;
      expv[40] = 98'h25b8e65e4b80d1235faca33ec;
      expv[41] = 98'h3182870822ede52b4e3435a64;
      expv[42] = 98'h25927a0e2511874988bcf7964;
      expv[43] = 98'h2d9f22cbdd5a504161ab426a8;
      expv[44] = 98'h30174612720703115d0d12dd6;
      expv[45] = 98'h298d4112de47ffc498ea3c617;
      expv[46] = 98'h307da05619eab4efe78e20bb9;
      expv[47] = 98'h3cdd16b614f9b47eb0cde6fbe;
      expv[48] = 98'h03229e78357c69c40147aae9b;
      expv[49] = 98'h0cb2ae1e12ded4aceedb27cbd;
      expv[50] = 98'h3ee7703dffe861414ed06b3ce;
      expv[51] = 98'h1fa7d477cb813fb18461ab23d;
      expv[52] = 98'h1e95bfcd087a02fe1d89f5dc9;
      expv[53] = 98'h1204a7b2488ff6d14c0d11058;
      expv[54] = 98'h2cfdd14d17d2ba2d0e2c6411f;
      expv[55] = 98'h206835ea8521ec702843319ce;
      expv[56] = 98'h3d767ae93661e2a6d297929d4;
      expv[57] = 98'h3fef094978349c18e1a0ee2b9;
      expv[58] = 98'h2a79f13d7da86348da9be9fdf;
      expv[59] = 98'h177b46f9df5e0e64505560ba6;
      expv[60] = 98'h0168bacac08fd1d9dd73072ce;
      expv[61] = 98'h1b79d67a2cfcb72868e5964bb;
      expv[62] = 98'h255fe68e6afb83e3d58eb2bde;
      expv[63] = 98'h1d71cb81a5d508f990124a11a;
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
