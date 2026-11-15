// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_222788 dut (
    .A(in_vec[65:34]),
    .B(in_vec[33:2]),
    .op(in_vec[1:0]),
    .sum(out_vec[128:97]),
    .diff(out_vec[96:65]),
    .prod(out_vec[64:33]),
    .quot(out_vec[32:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h1bc382b807f15711e;
    stim[1] = 66'h032fd5652b89d1695;
    stim[2] = 66'h245c31c9d7d8d3efa;
    stim[3] = 66'h040a9a41aa9f8bba9;
    stim[4] = 66'h0df7bdcea6febee2d;
    stim[5] = 66'h12ecfb9aeaf85a902;
    stim[6] = 66'h1a5aec774558ab03d;
    stim[7] = 66'h1642e6ca01b43271c;
    stim[8] = 66'h0d32a4950f03e32d0;
    stim[9] = 66'h12a9cbebdcf447309;
    stim[10] = 66'h031dd787e70f292df;
    stim[11] = 66'h0ee14f43451f60e85;
    stim[12] = 66'h2173984d5a234a34d;
    stim[13] = 66'h1f01db5443ab55aab;
    stim[14] = 66'h2cbb36db7344a8c3a;
    stim[15] = 66'h31706adfdf64ceb42;
    stim[16] = 66'h30ca754728cacad90;
    stim[17] = 66'h2efd3cbd96a5d6d1a;
    stim[18] = 66'h2aa7529c2ec73222f;
    stim[19] = 66'h2d374356b5501e2c8;
    stim[20] = 66'h0c054ac87a03358dc;
    stim[21] = 66'h03fdd990d31085565;
    stim[22] = 66'h120c2ce3d9a22add1;
    stim[23] = 66'h1334dba05179a9ee1;
    stim[24] = 66'h01ab32436e6c63056;
    stim[25] = 66'h30bc029245b3b1f81;
    stim[26] = 66'h17878353de66ed125;
    stim[27] = 66'h2ef32e8a5547c607b;
    stim[28] = 66'h3c435c44f05cf4e90;
    stim[29] = 66'h0c54f119e7483118f;
    stim[30] = 66'h24b701f5fa6f75392;
    stim[31] = 66'h02e54dcd53f66adbc;
    stim[32] = 66'h114bfc63eb559634a;
    stim[33] = 66'h3543886f2f6b46b67;
    stim[34] = 66'h176b7d7f3f66aa022;
    stim[35] = 66'h0ad39de14a462e85b;
    stim[36] = 66'h3bcf1f5cec9e3b832;
    stim[37] = 66'h26b6d13d6f84cf854;
    stim[38] = 66'h263b0556d51de6d71;
    stim[39] = 66'h0df5ad59dcbb4290e;
    stim[40] = 66'h17e6ad6bf77c6a42a;
    stim[41] = 66'h1b3cc0499695e1298;
    stim[42] = 66'h33b5a777e35847582;
    stim[43] = 66'h33717402f24824c4d;
    stim[44] = 66'h33889b47b69a29c8f;
    stim[45] = 66'h106eff111ac9101c4;
    stim[46] = 66'h12977f4b546d6316a;
    stim[47] = 66'h1d5c69d092006966e;
    stim[48] = 66'h10f97d8a638a05834;
    stim[49] = 66'h184307894320109f3;
    stim[50] = 66'h2e610d3633125e640;
    stim[51] = 66'h3ed466cbc9fcba7cf;
    stim[52] = 66'h242312b9fbad41739;
    stim[53] = 66'h06322074f09c3165e;
    stim[54] = 66'h1f8ea48279b6d5300;
    stim[55] = 66'h219a289fcc983bc5b;
    stim[56] = 66'h385abeb9b91dd9bb2;
    stim[57] = 66'h366d9ebcdcf84a2ec;
    stim[58] = 66'h2b7ad2259403c46f2;
    stim[59] = 66'h180e0f891b55e1c20;
    stim[60] = 66'h3416cf5cd73932244;
    stim[61] = 66'h3324e4006649ec188;
    stim[62] = 66'h32d68ca0d986d0d66;
    stim[63] = 66'h21ab5f3660c5cf065;
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
      expv[0] = 129'h11da6ce4e9e915d32ae5b084000000007;
      expv[1] = 129'h175cd3672bd301fded5de18c800000001;
      expv[2] = 129'h1e1a82dca641aeed2787bafe400000003;
      expv[3] = 129'h175512fe0cb587438252e26f800000001;
      expv[4] = 129'h1a7b3e58b37c7f75efe3434fc00000001;
      expv[5] = 129'h1ef2ab1573fa50856e57dd18000000001;
      expv[6] = 129'h0fd9cbbd8a8120b9d80d3cfe600000009;
      expv[7] = 129'h0bfb8c9dea475a2c2aab008300000001b;
      expv[8] = 129'h0e1b43e11f1760b4052c1a62000000001;
      expv[9] = 129'h17cf098e3adac25dacd908d3c00000001;
      expv[10] = 129'h1516805ace07572d0a9c8485200000001;
      expv[11] = 129'h0a005815c4e0f72d8e0c4185a00000005;
      expv[12] = 129'h1dcb714103a8270c534f6cd5e00000003;
      expv[13] = 129'h1156987f6dab42d4e52c99b9400000011;
      expv[14] = 129'h0fffefcf7cbb470be9ea8cdec00000001;
      expv[15] = 129'h086a9cc9e905ce15e16463a6000000003;
      expv[16] = 129'h0ccaa01003ffd5371c5ade5e000000003;
      expv[17] = 129'h02d189c78c2bb2f6084e3c28800000005;
      expv[18] = 129'h0cb7425f7df0103caf39dd5a000000001;
      expv[19] = 129'h1143b0c19bf39295130eaf12800000001;
      expv[20] = 129'h0304402b09010a9d5e84bb42e00000001;
      expv[21] = 129'h0b872f739876aa1d43358189600000001;
      expv[22] = 129'h15d72be07c350103737f3c39800000001;
      expv[23] = 129'h125742c720dd98d9263e7277000000003;
      expv[24] = 129'h180bcaa4499f679f0e239342200000001;
      expv[25] = 129'h1b37da453584284d36d8b7dc000000011;
      expv[26] = 129'h1af738331c904b20cbb84af0e00000001;
      expv[27] = 129'h021d7a48ecd5b4416b6d1519c00000005;
      expv[28] = 129'h16502896e5f333adf3eb0325800000003;
      expv[29] = 129'h19ce9119528660009db479faa00000001;
      expv[30] = 129'h0f933b977523c65e6f6600ef800000001;
      expv[31] = 129'h0b6ddc5497777178db100adf600000001;
      expv[32] = 129'h1e50c94c32fb3317a0ace9e9c00000001;
      expv[33] = 129'h12576792a2ec20dc740e760b800000003;
      expv[34] = 129'h0b6913c08c0269be838ea1fc000000001;
      expv[35] = 129'h0a8ce6336046b7ade7a19cedc00000003;
      expv[36] = 129'h1436ad6fe79871ece6ebd96c800000003;
      expv[37] = 129'h0b1dd0615b9900dc185bdfc3200000001;
      expv[38] = 129'h1dac7616e88e8f3ff5e258b6800000003;
      expv[39] = 129'h155877f5589d356499d44ffea00000001;
      expv[40] = 129'h07b18bd730352194bf5753fac00000001;
      expv[41] = 129'h18e950b982536f9016428ad4800000003;
      expv[42] = 129'h0b86f767e82eb00ff09b8ed4000000003;
      expv[43] = 129'h12dccc63c094a79f1010983a200000003;
      expv[44] = 129'h151162883e7738bf70826fa3400000001;
      expv[45] = 129'h159c0796bad2f77a7d136b40800000001;
      expv[46] = 129'h13827130ff150e1a792a13ba400000001;
      expv[47] = 129'h17ae699ba5ae0034f27bf9dec00000003;
      expv[48] = 129'h1a41c186d6b7bc038d47a0c2a00000001;
      expv[49] = 129'h0db18c142a917b753e04847d80000000f;
      expv[50] = 129'h10b9b5cd1da75769011dfa30000000001;
      expv[51] = 129'h046890a45a6bd62796044293a0000000d;
      expv[52] = 129'h0fe82a16b43ae8a338b5b91c400000001;
      expv[53] = 129'h1b6728ed4acaf787938f7e4ea00000001;
      expv[54] = 129'h0ca2bcd932ebe7a93cf16f58000000001;
      expv[55] = 129'h17193232aa80f66d3f4a50fd400000005;
      expv[56] = 129'h18bc4c3a5f9e727f5cf01e01000000001;
      expv[57] = 129'h09b2f475ccbaaa47188298f0200000003;
      expv[58] = 129'h1fbf4b4a4bbb86db4f2ca885000000005;
      expv[59] = 129'h19b1f8a59e5c16e383985da4000000001;
      expv[60] = 129'h05a800c08e6ece9c4b4374c4600000005;
      expv[61] = 129'h0cb7680c666d7bf3e9949a0c400000003;
      expv[62] = 129'h062eaebb8ca7dde55a6c9b11600000003;
      expv[63] = 129'h0138971e4072c818025661a6200000003;
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
