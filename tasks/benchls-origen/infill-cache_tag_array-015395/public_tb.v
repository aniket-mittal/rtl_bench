// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015395 dut (
    .clk(clk),
    .rst(in_vec[56:56]),
    .en(in_vec[55:55]),
    .wen(in_vec[54:54]),
    .wdata(in_vec[53:33]),
    .addr(in_vec[32:1]),
    .op(in_vec[0:0]),
    .rdata(out_vec[23:3]),
    .hit(out_vec[2:2]),
    .valid(out_vec[1:1]),
    .work(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h1f2d0bc43aaab9d;
    stim[1] = 57'h1d5d1f751d15140;
    stim[2] = 57'h0208452fe306380;
    stim[3] = 57'h0857776fd9437a2;
    stim[4] = 57'h048300e702bd22d;
    stim[5] = 57'h05ce1daf73a1bcf;
    stim[6] = 57'h059f45763b48e47;
    stim[7] = 57'h07877cb3f7f049d;
    stim[8] = 57'h0922af7b2157535;
    stim[9] = 57'h0b90400d24e79cb;
    stim[10] = 57'h0c5f0abf272624d;
    stim[11] = 57'h062517b3493364b;
    stim[12] = 57'h0ba8d3879856a06;
    stim[13] = 57'h08cb8cc69eff0aa;
    stim[14] = 57'h14cffe2be0cd43d;
    stim[15] = 57'h02606d4b5fdf8d9;
    stim[16] = 57'h1c8b9ae5d9df83b;
    stim[17] = 57'h0cf641516f9074c;
    stim[18] = 57'h0831258292aca0d;
    stim[19] = 57'h04f56e39dd93fd7;
    stim[20] = 57'h0e7e02e88023797;
    stim[21] = 57'h074fea2ab81b140;
    stim[22] = 57'h0a8e2ac27c5dad9;
    stim[23] = 57'h022c21b3c1d20a1;
    stim[24] = 57'h029a7dd5146c2a9;
    stim[25] = 57'h0e64cbddca59fee;
    stim[26] = 57'h011b95b2f48411b;
    stim[27] = 57'h09153cf96844589;
    stim[28] = 57'h07daf9946e27121;
    stim[29] = 57'h0bd189eda41e20d;
    stim[30] = 57'h082605ad3b18d1a;
    stim[31] = 57'h0c45c1f919435b6;
    stim[32] = 57'h0e95d600f1be02e;
    stim[33] = 57'h08839a03ad7c12b;
    stim[34] = 57'h0bdcc77a3d41df5;
    stim[35] = 57'h0dad4099359e538;
    stim[36] = 57'h0a13b0a0b0017b2;
    stim[37] = 57'h0ef434ff328690a;
    stim[38] = 57'h00e0a6b9b6f677f;
    stim[39] = 57'h0135b8a48019eb9;
    stim[40] = 57'h030f318b2ce8687;
    stim[41] = 57'h0b8e20056d53bb2;
    stim[42] = 57'h0067a00d7bf9fdc;
    stim[43] = 57'h099bf0f72c1cbf4;
    stim[44] = 57'h02c920c6ee62b9b;
    stim[45] = 57'h041bf858f822204;
    stim[46] = 57'h01e57d790b8b8cf;
    stim[47] = 57'h042c8c70e3c2514;
    stim[48] = 57'h03d14be14aa76aa;
    stim[49] = 57'h0a72e30cd08c141;
    stim[50] = 57'h01b0dc678b631e0;
    stim[51] = 57'h0d6760821ad5d26;
    stim[52] = 57'h0e4750885a04a5a;
    stim[53] = 57'h0d28d3face90833;
    stim[54] = 57'h0a0829b4270510a;
    stim[55] = 57'h00cd16dbb11e7fc;
    stim[56] = 57'h0f8ab8be47eb65d;
    stim[57] = 57'h0087a5651065a06;
    stim[58] = 57'h065c1e3dbdd305a;
    stim[59] = 57'h07e745baf2db1a8;
    stim[60] = 57'h04ee670e712c25f;
    stim[61] = 57'h02da779e9012af7;
    stim[62] = 57'h0447c912aec6623;
    stim[63] = 57'h0d5edaba2c42319;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000000;
      expv[14] = 24'h000000;
      expv[15] = 24'h000000;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000000;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h000000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h000000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000000;
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
