// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130143 dut (
    .div(in_vec[63:32]),
    .dvsr(in_vec[31:0]),
    .q(out_vec[63:32]),
    .r(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hda51f59dedb20cee;
    stim[1] = 64'h782aa26678592539;
    stim[2] = 64'h53263b1e48a9162d;
    stim[3] = 64'hfaab178c484a3069;
    stim[4] = 64'h93e93c4b1e28ee6e;
    stim[5] = 64'h5cdf4ee28ea4626a;
    stim[6] = 64'hbaee5f5c45c93819;
    stim[7] = 64'h157e1a297776a91e;
    stim[8] = 64'ha715c9edb8130b65;
    stim[9] = 64'hba5742bae17acba9;
    stim[10] = 64'h5504a0b5f4b3bd06;
    stim[11] = 64'h6a80298c2e8bec63;
    stim[12] = 64'h580660e391ae31d1;
    stim[13] = 64'hed235d722b156bd0;
    stim[14] = 64'h705d11bc8d0e279a;
    stim[15] = 64'h6988a726e3cf11c0;
    stim[16] = 64'h7891bb892218c4e3;
    stim[17] = 64'hc1c94c13d0b4cfb2;
    stim[18] = 64'hb009a78fd6d7be3f;
    stim[19] = 64'h69d797f7e3aa2422;
    stim[20] = 64'h172ca877958e6045;
    stim[21] = 64'hf9e80386a6f7a193;
    stim[22] = 64'h9568cbae8fbf7b68;
    stim[23] = 64'hb456bb50135294db;
    stim[24] = 64'h3205dfb03b246032;
    stim[25] = 64'h9bc6d59cc683c5e0;
    stim[26] = 64'h7e24ab33c4c37cd0;
    stim[27] = 64'hb98467e72376a418;
    stim[28] = 64'h628aca86acf59cab;
    stim[29] = 64'h7faa2b95febd4f15;
    stim[30] = 64'he27266a5978ca8e6;
    stim[31] = 64'h7730b0b62c918e94;
    stim[32] = 64'h169077129d4ee263;
    stim[33] = 64'h798ad42ab6a5a70b;
    stim[34] = 64'hdc693c3303310bb2;
    stim[35] = 64'hbcf2de0de3d0cd0c;
    stim[36] = 64'h375ca6f5347a99f7;
    stim[37] = 64'h172e5fe890170a51;
    stim[38] = 64'hfabbc9d280a31db5;
    stim[39] = 64'hc61fdb81c9946ab1;
    stim[40] = 64'h4e701263fb4d6cb4;
    stim[41] = 64'h47556b1cc7b48de6;
    stim[42] = 64'h9db72e79a90439a4;
    stim[43] = 64'hf0eec82f6fc00bf2;
    stim[44] = 64'he9e290acf32048ba;
    stim[45] = 64'h87116fcbcc13b93e;
    stim[46] = 64'h235bb6115c8568e4;
    stim[47] = 64'hf68604b36146dc16;
    stim[48] = 64'hfe4fa8abf09b4454;
    stim[49] = 64'he0a2dfd9e89b5672;
    stim[50] = 64'hfce9228f740e5ee8;
    stim[51] = 64'hff4009899c4b1b72;
    stim[52] = 64'h0106fa07005f8bbd;
    stim[53] = 64'h58c579fdc963061f;
    stim[54] = 64'hb155cad9fce77349;
    stim[55] = 64'h5c33a9d40eeb4cf5;
    stim[56] = 64'hc65a40c36c6d066a;
    stim[57] = 64'hfbeacd6c739e241b;
    stim[58] = 64'hbe42214a18e52389;
    stim[59] = 64'hc78a42b3f53f688b;
    stim[60] = 64'h31fc5c4e7fd86aec;
    stim[61] = 64'hf71eee17fdb85fa1;
    stim[62] = 64'h5be847e2243202ae;
    stim[63] = 64'h81cf44d864f3535d;
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
      expv[0] = 64'h00000000da51f59d;
      expv[1] = 64'h00000000782aa266;
      expv[2] = 64'h000000010a7d24f1;
      expv[3] = 64'h0000000321cc8651;
      expv[4] = 64'h000000041b458293;
      expv[5] = 64'h000000005cdf4ee2;
      expv[6] = 64'h000000022f5bef2a;
      expv[7] = 64'h00000000157e1a29;
      expv[8] = 64'h00000000a715c9ed;
      expv[9] = 64'h00000000ba5742ba;
      expv[10] = 64'h000000005504a0b5;
      expv[11] = 64'h000000020d6850c6;
      expv[12] = 64'h00000000580660e3;
      expv[13] = 64'h0000000515b84262;
      expv[14] = 64'h00000000705d11bc;
      expv[15] = 64'h000000006988a726;
      expv[16] = 64'h0000000312476ce0;
      expv[17] = 64'h00000000c1c94c13;
      expv[18] = 64'h00000000b009a78f;
      expv[19] = 64'h0000000069d797f7;
      expv[20] = 64'h00000000172ca877;
      expv[21] = 64'h0000000152f061f3;
      expv[22] = 64'h0000000105a95046;
      expv[23] = 64'h00000009066f7f9d;
      expv[24] = 64'h000000003205dfb0;
      expv[25] = 64'h000000009bc6d59c;
      expv[26] = 64'h000000007e24ab33;
      expv[27] = 64'h000000050833336f;
      expv[28] = 64'h00000000628aca86;
      expv[29] = 64'h000000007faa2b95;
      expv[30] = 64'h000000014ae5bdbf;
      expv[31] = 64'h000000021e0d938e;
      expv[32] = 64'h0000000016907712;
      expv[33] = 64'h00000000798ad42a;
      expv[34] = 64'h0000004500311539;
      expv[35] = 64'h00000000bcf2de0d;
      expv[36] = 64'h0000000102e20cfe;
      expv[37] = 64'h00000000172e5fe8;
      expv[38] = 64'h000000017a18ac1d;
      expv[39] = 64'h00000000c61fdb81;
      expv[40] = 64'h000000004e701263;
      expv[41] = 64'h0000000047556b1c;
      expv[42] = 64'h000000009db72e79;
      expv[43] = 64'h00000002116eb04b;
      expv[44] = 64'h00000000e9e290ac;
      expv[45] = 64'h0000000087116fcb;
      expv[46] = 64'h00000000235bb611;
      expv[47] = 64'h0000000233f84c87;
      expv[48] = 64'h000000010db46457;
      expv[49] = 64'h00000000e0a2dfd9;
      expv[50] = 64'h0000000214cc64bf;
      expv[51] = 64'h0000000162f4ee17;
      expv[52] = 64'h000000020047e28d;
      expv[53] = 64'h0000000058c579fd;
      expv[54] = 64'h00000000b155cad9;
      expv[55] = 64'h0000000602afdc16;
      expv[56] = 64'h0000000159ed3a59;
      expv[57] = 64'h0000000214ae8536;
      expv[58] = 64'h000000070ffe288b;
      expv[59] = 64'h00000000c78a42b3;
      expv[60] = 64'h0000000031fc5c4e;
      expv[61] = 64'h00000000f71eee17;
      expv[62] = 64'h0000000213844286;
      expv[63] = 64'h000000011cdbf17b;
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
