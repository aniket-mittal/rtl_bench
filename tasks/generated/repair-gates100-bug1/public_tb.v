// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h800a741178c9c1a810a7958ed;
    stim[1] = 100'h3b8ca1b782fa8cfb9e1af56be;
    stim[2] = 100'hd0af53d54372ad74866d4c867;
    stim[3] = 100'h28a0e6e888137d076b893bce8;
    stim[4] = 100'h82693a45bb48e761c4bb96464;
    stim[5] = 100'hb868e701e8a4b169a545535c4;
    stim[6] = 100'hdc89858090dd9ad9b0f76853b;
    stim[7] = 100'had25d3a81c71e67ff5e40056f;
    stim[8] = 100'hdc2b7c0e60f13cab78ca110ac;
    stim[9] = 100'h2822689f78b61ed077be76e98;
    stim[10] = 100'h5ab656e4446ac1fa798e81c7c;
    stim[11] = 100'h16b5ac1c4a8ababed93efe96d;
    stim[12] = 100'he19369627a8e4cd9643ca22ec;
    stim[13] = 100'h8f144b0df6b4809794d09fcec;
    stim[14] = 100'h0cea603f0cdb24bd82b03db9c;
    stim[15] = 100'hb2e378c4e23f98dc3f6497637;
    stim[16] = 100'haf4570d4fa954a98b63777b2b;
    stim[17] = 100'h1fe7e5faf32ef162d4188fda7;
    stim[18] = 100'h340237aa5f80e853e346d78ac;
    stim[19] = 100'h46fd55a9a1af09c55f018e2ef;
    stim[20] = 100'h6ebe73ddf4f2e4c1561309ca0;
    stim[21] = 100'h465a9d50fe6c5d9ba59c7f129;
    stim[22] = 100'h30e6ff7d90f8b1d2d2ef36bb1;
    stim[23] = 100'h9ad5126bab3fb0dd300c2642e;
    stim[24] = 100'h0656e498f7e3146e40adf2453;
    stim[25] = 100'h2f0a539c7b50a155bf7a6077d;
    stim[26] = 100'hfcadc59a113899e0d7883f064;
    stim[27] = 100'hca75431d0753b7064a1040c90;
    stim[28] = 100'h9219f013bcab1c9b4800fe6ae;
    stim[29] = 100'h192b263a8cec6c5788d923422;
    stim[30] = 100'h0dceb649f6943b702978561e3;
    stim[31] = 100'hb5b7e7a09b0f421c7237d23d8;
    stim[32] = 100'ha32cd86905f882d8172d0be5f;
    stim[33] = 100'h8589d0b498aafbfb60b5e8cb1;
    stim[34] = 100'h420f993501af8e43e65ba6710;
    stim[35] = 100'h7241355741b15e922cd668334;
    stim[36] = 100'hf28813bd5dfbbd582d8a83f14;
    stim[37] = 100'h67f4431a21b49b87f6b2d807b;
    stim[38] = 100'h2a13370453e088a61a09938b9;
    stim[39] = 100'he22201d4ce7af549f769663cc;
    stim[40] = 100'h627d443f6cdfb711d3fbf21eb;
    stim[41] = 100'hebeb44e3943df424ad455cdd6;
    stim[42] = 100'h387609d5e561842637b155076;
    stim[43] = 100'h2142a2fbb1902692c7ca84f68;
    stim[44] = 100'h527e550176db5de640aa48e98;
    stim[45] = 100'h75e3edf12f860b19fee285059;
    stim[46] = 100'h8f1e424dcbc91492641023edf;
    stim[47] = 100'hee90a52f7400a3df32de0c238;
    stim[48] = 100'he46bc845c9c7abf5b4cc43a32;
    stim[49] = 100'hd30df407f152539982f06075d;
    stim[50] = 100'h3e034b719f7411f412fef1001;
    stim[51] = 100'h94b22a18f00f534574aeb8a86;
    stim[52] = 100'he9b808f61a24893f25d9d3249;
    stim[53] = 100'hd5c4e0d522f6ad22d12dd4bc7;
    stim[54] = 100'haaa4b1a4737da29c71617ed9a;
    stim[55] = 100'he83a1547a1a908b8e962b53eb;
    stim[56] = 100'h7a75f0aa79dda0d5ad674b9f6;
    stim[57] = 100'h49161b48e88c66b9fefbc66ce;
    stim[58] = 100'hcca10935d6f90c5c91a788e17;
    stim[59] = 100'h2391e529c0306f947cc362d0d;
    stim[60] = 100'he8e1641f617bcae27aaeced55;
    stim[61] = 100'h73db285e1b8a5a9ce9316b97e;
    stim[62] = 100'hab4f2a39e2e39646eb887eb18;
    stim[63] = 100'h502cab887b8da91b4fd8cc90f;
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
      expv[0] = 3'h6;
      expv[1] = 3'h7;
      expv[2] = 3'h7;
      expv[3] = 3'h6;
      expv[4] = 3'h7;
      expv[5] = 3'h7;
      expv[6] = 3'h7;
      expv[7] = 3'h7;
      expv[8] = 3'h7;
      expv[9] = 3'h6;
      expv[10] = 3'h6;
      expv[11] = 3'h6;
      expv[12] = 3'h6;
      expv[13] = 3'h7;
      expv[14] = 3'h6;
      expv[15] = 3'h7;
      expv[16] = 3'h7;
      expv[17] = 3'h7;
      expv[18] = 3'h7;
      expv[19] = 3'h6;
      expv[20] = 3'h6;
      expv[21] = 3'h6;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'h6;
      expv[25] = 3'h7;
      expv[26] = 3'h6;
      expv[27] = 3'h6;
      expv[28] = 3'h7;
      expv[29] = 3'h6;
      expv[30] = 3'h6;
      expv[31] = 3'h6;
      expv[32] = 3'h6;
      expv[33] = 3'h7;
      expv[34] = 3'h6;
      expv[35] = 3'h7;
      expv[36] = 3'h7;
      expv[37] = 3'h7;
      expv[38] = 3'h6;
      expv[39] = 3'h7;
      expv[40] = 3'h6;
      expv[41] = 3'h6;
      expv[42] = 3'h6;
      expv[43] = 3'h6;
      expv[44] = 3'h6;
      expv[45] = 3'h7;
      expv[46] = 3'h6;
      expv[47] = 3'h7;
      expv[48] = 3'h7;
      expv[49] = 3'h6;
      expv[50] = 3'h7;
      expv[51] = 3'h7;
      expv[52] = 3'h7;
      expv[53] = 3'h7;
      expv[54] = 3'h6;
      expv[55] = 3'h6;
      expv[56] = 3'h6;
      expv[57] = 3'h7;
      expv[58] = 3'h7;
      expv[59] = 3'h7;
      expv[60] = 3'h7;
      expv[61] = 3'h6;
      expv[62] = 3'h6;
      expv[63] = 3'h7;
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
