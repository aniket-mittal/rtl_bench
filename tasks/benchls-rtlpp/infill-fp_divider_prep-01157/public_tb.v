// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01157 dut (
    .clk_i(clk),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[86:77]),
    .dvdnd_50_o(out_vec[76:27]),
    .dvsor_27_o(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h88fd72a24aad4855;
    stim[1] = 64'hcb1c48774baba538;
    stim[2] = 64'hae797f1784eb8950;
    stim[3] = 64'h3d678d5899e7f8e2;
    stim[4] = 64'h07b47c60d8c27917;
    stim[5] = 64'h5112b8ed2e4d7fcb;
    stim[6] = 64'h5e07638b0a4f68f0;
    stim[7] = 64'h6290e2109cdc92fa;
    stim[8] = 64'h929d6a5180d1ae27;
    stim[9] = 64'hc248887a2c2c90d6;
    stim[10] = 64'hfb3078d0a8fd8b3e;
    stim[11] = 64'h5baf600eca94845e;
    stim[12] = 64'hbbd5ad50104bba9c;
    stim[13] = 64'h23864ac9255eb672;
    stim[14] = 64'h08dfd84a70be4513;
    stim[15] = 64'ha9e6de1adc2b6916;
    stim[16] = 64'hd5ef5dcfb7d539e2;
    stim[17] = 64'h4556847d975bfed2;
    stim[18] = 64'hc31a3d4cd711ae0c;
    stim[19] = 64'hc3b6860059ef082d;
    stim[20] = 64'hed3d5165123935c0;
    stim[21] = 64'ha903eef22403f7eb;
    stim[22] = 64'h6253b7cea238c336;
    stim[23] = 64'h9d1810d8658af36f;
    stim[24] = 64'h88adbb3308b68b92;
    stim[25] = 64'hacea600f1abb8bd3;
    stim[26] = 64'h7573c8c90ebdc75f;
    stim[27] = 64'hf4054091de587ac0;
    stim[28] = 64'h2e0d9696f1e7f19b;
    stim[29] = 64'hbc556f34edfb9185;
    stim[30] = 64'h6bcc25f7b7b606ed;
    stim[31] = 64'h08b4b2d4742376dc;
    stim[32] = 64'h5488fdf17701deb6;
    stim[33] = 64'h4a7002c497ac1df4;
    stim[34] = 64'h3c217fbdd0fc480b;
    stim[35] = 64'hf3ddde878eebca16;
    stim[36] = 64'hf586ec77cec91d1d;
    stim[37] = 64'h817203fd7ffc9b4f;
    stim[38] = 64'habe737f960c75d1b;
    stim[39] = 64'h3d3af96981d77915;
    stim[40] = 64'h95f25088fbe8fca3;
    stim[41] = 64'h89dad322b338f796;
    stim[42] = 64'hb816fefef6e3e269;
    stim[43] = 64'habca058bda5ce75a;
    stim[44] = 64'hbd590ea33bb882ab;
    stim[45] = 64'he58b2f06b83bcb2f;
    stim[46] = 64'h9abe7d1775f98877;
    stim[47] = 64'h33893392b648880e;
    stim[48] = 64'he71050106e4f9ab0;
    stim[49] = 64'h8d3a8ec0ad96e02d;
    stim[50] = 64'hbf6b29f2b6371dea;
    stim[51] = 64'h93fc73cf6b49e137;
    stim[52] = 64'h7a49e13b66845c65;
    stim[53] = 64'hda0e7fc48b00457b;
    stim[54] = 64'h71d2a7f3dbc22111;
    stim[55] = 64'h9d286ad0db34dd66;
    stim[56] = 64'hf3829b04a305a9ca;
    stim[57] = 64'hd0eec27dc1739c5d;
    stim[58] = 64'h6f2d91c4b6976dfb;
    stim[59] = 64'h3b0ca493ecdc6330;
    stim[60] = 64'he75438989e60a9fb;
    stim[61] = 64'h6280ff8c9513adba;
    stim[62] = 64'hae1884b5baefb3da;
    stim[63] = 64'ha5bc53b11c3a7528;
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
      expv[0] = 87'hxxxf5ca8800000015a90aa;
      expv[1] = 87'hxxx7121dc0000001574a70;
      expv[2] = 87'hxxxe5fc5c0000001d712a0;
      expv[3] = 87'h7f79e35600000001cff1c4;
      expv[4] = 87'h0fcd1f180000000184f22e;
      expv[5] = 87'h1a44ae3b400000019aff96;
      expv[6] = 87'h18c1d8e2c00000019ed1e0;
      expv[7] = 87'h7ba4388400000001b925f4;
      expv[8] = 87'h18a75a9440000001a35c4e;
      expv[9] = 87'h24f2221e800000015921ac;
      expv[10] = 87'h216c1e3400000001fb167c;
      expv[11] = 87'h146bd803800000012908bc;
      expv[12] = 87'h15756b5400000001977538;
      expv[13] = 87'h248192b240000001bd6ce4;
      expv[14] = 87'h1437f612800000017c8a26;
      expv[15] = 87'h1ad9b7868000000156d22c;
      expv[16] = 87'h0f9bd773c0000001aa73c4;
      expv[17] = 87'h75f5a11f40000001b7fda4;
      expv[18] = 87'h03468f5300000001235c18;
      expv[19] = 87'h176da18000000001de105a;
      expv[20] = 87'h1b6f545940000001726b80;
      expv[21] = 87'h0ae0fbbc8000000107efd6;
      expv[22] = 87'h0a74edf38000000171866c;
      expv[23] = 87'h26a604360000000115e6de;
      expv[24] = 87'h112b6eccc00000016d1724;
      expv[25] = 87'h1ffa9803c00000017717a6;
      expv[26] = 87'h7ddcf232400000017b8ebe;
      expv[27] = 87'h0fe1502440000001b0f580;
      expv[28] = 87'h146365a580000001cfe336;
      expv[29] = 87'h29955bcd00000001f7230a;
      expv[30] = 87'h1573097dc00000016c0dda;
      expv[31] = 87'h7f0d2cb50000000146edb8;
      expv[32] = 87'h03823f7c4000000103bd6c;
      expv[33] = 87'h1cfc00b100000001583be8;
      expv[34] = 87'h75085fef40000001f89016;
      expv[35] = 87'h075777a1c0000001d7942c;
      expv[36] = 87'h1c81bb1dc0000001923a3a;
      expv[37] = 87'h0adc80ff40000001f9369e;
      expv[38] = 87'h2939cdfe400000018eba36;
      expv[39] = 87'h19aebe5a40000001aef22a;
      expv[40] = 87'h705c942200000001d1f946;
      expv[41] = 87'h02b6b4c88000000171ef2c;
      expv[42] = 87'h1ec5bfbf80000001c7c4d2;
      expv[43] = 87'h76728162c0000001b9ceb4;
      expv[44] = 87'h059643a8c0000001710556;
      expv[45] = 87'h0042cbc18000000177965e;
      expv[46] = 87'h044f9f45c0000001f310ee;
      expv[47] = 87'h10424ce48000000191101c;
      expv[48] = 87'h1b441404000000019f3560;
      expv[49] = 87'h792ea3b0000000012dc05a;
      expv[50] = 87'h0f5aca7c800000016e3bd4;
      expv[51] = 87'h0e3f1cf3c000000193c26e;
      expv[52] = 87'h07d2784ec000000108b8ca;
      expv[53] = 87'h12239ff100000001008af6;
      expv[54] = 87'h7a14a9fcc0000001844222;
      expv[55] = 87'h14ca1ab40000000169bacc;
      expv[56] = 87'h23a0a6c1000000010b5394;
      expv[57] = 87'h157bb09f40000001e738ba;
      expv[58] = 87'h006b6471000000012edbf6;
      expv[59] = 87'h24032924c0000001b8c660;
      expv[60] = 87'h13d50e2600000001c153f6;
      expv[61] = 87'h1e003fe300000001275b74;
      expv[62] = 87'h0386212d40000001df67b4;
      expv[63] = 87'h222f14ec4000000174ea50;
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
