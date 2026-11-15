// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01490 dut (
    .color_depth_i(in_vec[35:34]),
    .mem_i(in_vec[33:2]),
    .mem_lsb_i(in_vec[1:0]),
    .color_o(out_vec[35:4]),
    .sel_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h84a938388;
    stim[1] = 36'h0704b2091;
    stim[2] = 36'h4e60f0aab;
    stim[3] = 36'h98c6a0c7e;
    stim[4] = 36'h9543ebb3b;
    stim[5] = 36'h74fd8eaf7;
    stim[6] = 36'h34abb4498;
    stim[7] = 36'h2fda719d9;
    stim[8] = 36'h6c5313677;
    stim[9] = 36'h4f0c5e099;
    stim[10] = 36'h90deba064;
    stim[11] = 36'h57d39455a;
    stim[12] = 36'h8064d01cd;
    stim[13] = 36'h11adacdd1;
    stim[14] = 36'haffe1ed56;
    stim[15] = 36'h7c3ca09fc;
    stim[16] = 36'h72dbb9c78;
    stim[17] = 36'he2d12d8e9;
    stim[18] = 36'hf197b3176;
    stim[19] = 36'h90043748f;
    stim[20] = 36'h986d75533;
    stim[21] = 36'h259044010;
    stim[22] = 36'h9862c42b2;
    stim[23] = 36'hb0bfeb82f;
    stim[24] = 36'h6eca4dec3;
    stim[25] = 36'h783b7baea;
    stim[26] = 36'h466e7953c;
    stim[27] = 36'hfac8cae28;
    stim[28] = 36'h21c23850a;
    stim[29] = 36'h9fefb48c7;
    stim[30] = 36'h0cec95abe;
    stim[31] = 36'h4905b978d;
    stim[32] = 36'h2a2ef8188;
    stim[33] = 36'h120a55775;
    stim[34] = 36'h884f914b0;
    stim[35] = 36'h6ccbcc8aa;
    stim[36] = 36'h35ba11128;
    stim[37] = 36'hec8a48f16;
    stim[38] = 36'h67dd0a06a;
    stim[39] = 36'hc33543248;
    stim[40] = 36'h58bc1fdf4;
    stim[41] = 36'h81df030a4;
    stim[42] = 36'h3d8b10a82;
    stim[43] = 36'h4a00beb32;
    stim[44] = 36'h0fba61d63;
    stim[45] = 36'hb328f70e0;
    stim[46] = 36'h207e316ee;
    stim[47] = 36'h0028fb7ff;
    stim[48] = 36'h05f71084e;
    stim[49] = 36'hff3ded594;
    stim[50] = 36'hbc6061907;
    stim[51] = 36'h33c7a69eb;
    stim[52] = 36'h8552ae37d;
    stim[53] = 36'hc8788b2ec;
    stim[54] = 36'h454905f0d;
    stim[55] = 36'h1cd95892f;
    stim[56] = 36'h656c82346;
    stim[57] = 36'hf4e99dd29;
    stim[58] = 36'hae2788c5e;
    stim[59] = 36'h92e7b6012;
    stim[60] = 36'h106076424;
    stim[61] = 36'h19d95842d;
    stim[62] = 36'hfbfe94792;
    stim[63] = 36'hf9db159be;
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
      expv[0] = 36'h12a4e0e2f;
      expv[1] = 36'h000000121;
      expv[2] = 36'h0000c2aa3;
      expv[3] = 36'h631a831ff;
      expv[4] = 36'h550faecef;
      expv[5] = 36'h00003abd3;
      expv[6] = 36'h000000d21;
      expv[7] = 36'h000000691;
      expv[8] = 36'h00004d9d3;
      expv[9] = 36'h000078263;
      expv[10] = 36'h437ae819f;
      expv[11] = 36'h00005f4e3;
      expv[12] = 36'h01934073f;
      expv[13] = 36'h000000b61;
      expv[14] = 36'hbff87b55f;
      expv[15] = 36'h0000f0f23;
      expv[16] = 36'h0000cb6e3;
      expv[17] = 36'h8b44b63af;
      expv[18] = 36'hc65ecc5df;
      expv[19] = 36'h4010dd23f;
      expv[20] = 36'h61b5d54cf;
      expv[21] = 36'h000000961;
      expv[22] = 36'h618b10acf;
      expv[23] = 36'hc2ffae0bf;
      expv[24] = 36'h000037b03;
      expv[25] = 36'h0000e0ed3;
      expv[26] = 36'h000019b93;
      expv[27] = 36'heb232b8af;
      expv[28] = 36'h000000e11;
      expv[29] = 36'h7fbed231f;
      expv[30] = 36'h000000561;
      expv[31] = 36'h0000e5e33;
      expv[32] = 36'h000000a81;
      expv[33] = 36'h000000291;
      expv[34] = 36'h213e452cf;
      expv[35] = 36'h0000b32f3;
      expv[36] = 36'h000000d61;
      expv[37] = 36'hb22923c5f;
      expv[38] = 36'h00009f743;
      expv[39] = 36'h0cd50c92f;
      expv[40] = 36'h000062f03;
      expv[41] = 36'h077c0c29f;
      expv[42] = 36'h000000421;
      expv[43] = 36'h000028023;
      expv[44] = 36'h000000581;
      expv[45] = 36'hcca3dc38f;
      expv[46] = 36'h000000c51;
      expv[47] = 36'h000000ff1;
      expv[48] = 36'h000000421;
      expv[49] = 36'hfcf7b565f;
      expv[50] = 36'hf1818641f;
      expv[51] = 36'h0000007a1;
      expv[52] = 36'h154ab8dff;
      expv[53] = 36'h21e22cbbf;
      expv[54] = 36'h000017c33;
      expv[55] = 36'h0000004b1;
      expv[56] = 36'h000095b23;
      expv[57] = 36'hd3a6774af;
      expv[58] = 36'hb89e2317f;
      expv[59] = 36'h4b9ed804f;
      expv[60] = 36'h000000411;
      expv[61] = 36'h000000651;
      expv[62] = 36'heffa51e4f;
      expv[63] = 36'he76c566ff;
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
