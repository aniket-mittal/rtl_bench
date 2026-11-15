// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04298 dut (
    .addr(in_vec[31:0]),
    .mod(out_vec[39:32]),
    .eff_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h158905ff;
    stim[1] = 32'h728cd68d;
    stim[2] = 32'h0746905e;
    stim[3] = 32'hac45a1c6;
    stim[4] = 32'hbee78bce;
    stim[5] = 32'hc84da11a;
    stim[6] = 32'h913cceeb;
    stim[7] = 32'h3c813dd8;
    stim[8] = 32'hdd4dce1d;
    stim[9] = 32'hfdfb8289;
    stim[10] = 32'h0712b9b6;
    stim[11] = 32'hdbf0a059;
    stim[12] = 32'he216da50;
    stim[13] = 32'h10f98146;
    stim[14] = 32'h1f2cf5e6;
    stim[15] = 32'h9b6b6222;
    stim[16] = 32'hd6d4894d;
    stim[17] = 32'h77f040d8;
    stim[18] = 32'h9e18f6a4;
    stim[19] = 32'h75cc6b43;
    stim[20] = 32'h8d9539f2;
    stim[21] = 32'hd8d77369;
    stim[22] = 32'h98ff7e2c;
    stim[23] = 32'h07b38c7a;
    stim[24] = 32'hb90ae229;
    stim[25] = 32'hefc8ec78;
    stim[26] = 32'ha41725cf;
    stim[27] = 32'he5474db4;
    stim[28] = 32'h7f454f5b;
    stim[29] = 32'h60e62387;
    stim[30] = 32'hfb8d6f2e;
    stim[31] = 32'h1a987912;
    stim[32] = 32'h47208092;
    stim[33] = 32'h0024352e;
    stim[34] = 32'haf0ccd91;
    stim[35] = 32'hf2308593;
    stim[36] = 32'h80a4da62;
    stim[37] = 32'h9c46e689;
    stim[38] = 32'h70dea266;
    stim[39] = 32'h222eaaf5;
    stim[40] = 32'h2b580efe;
    stim[41] = 32'h4b4169ac;
    stim[42] = 32'h5feeb0f9;
    stim[43] = 32'h9a2f6cb9;
    stim[44] = 32'h5549e405;
    stim[45] = 32'hee27ccb9;
    stim[46] = 32'h20bda79e;
    stim[47] = 32'hc920751d;
    stim[48] = 32'h593c2155;
    stim[49] = 32'h8604f4be;
    stim[50] = 32'h9254ef8e;
    stim[51] = 32'h5e1d2e15;
    stim[52] = 32'hb9572c32;
    stim[53] = 32'hb329d821;
    stim[54] = 32'hc778a1f3;
    stim[55] = 32'hfeee4df3;
    stim[56] = 32'hae71cf00;
    stim[57] = 32'haec76505;
    stim[58] = 32'hda60d782;
    stim[59] = 32'h11f03d20;
    stim[60] = 32'h6ba7b3d5;
    stim[61] = 32'hd35ca630;
    stim[62] = 32'h250a95e4;
    stim[63] = 32'h8cd81011;
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
      expv[0] = 40'h00000905ff;
      expv[1] = 40'h00000cd68d;
      expv[2] = 40'h000006905e;
      expv[3] = 40'h000005a1c6;
      expv[4] = 40'h0000078bce;
      expv[5] = 40'h00000da11a;
      expv[6] = 40'h00000cceeb;
      expv[7] = 40'h0000013dd8;
      expv[8] = 40'h00000dce1d;
      expv[9] = 40'h00000b8289;
      expv[10] = 40'h000002b9b6;
      expv[11] = 40'h000000a059;
      expv[12] = 40'h000006da50;
      expv[13] = 40'h0100f98146;
      expv[14] = 40'h00000cf5e6;
      expv[15] = 40'h00000b6222;
      expv[16] = 40'h000004894d;
      expv[17] = 40'h00000040d8;
      expv[18] = 40'h000008f6a4;
      expv[19] = 40'h00000c6b43;
      expv[20] = 40'h00000539f2;
      expv[21] = 40'h0000077369;
      expv[22] = 40'h00000f7e2c;
      expv[23] = 40'h0000038c7a;
      expv[24] = 40'h00000ae229;
      expv[25] = 40'h000008ec78;
      expv[26] = 40'h00000725cf;
      expv[27] = 40'h0000074db4;
      expv[28] = 40'h0000054f5b;
      expv[29] = 40'h0000062387;
      expv[30] = 40'h00000d6f2e;
      expv[31] = 40'h0000087912;
      expv[32] = 40'h0000008092;
      expv[33] = 40'h000004352e;
      expv[34] = 40'h00000ccd91;
      expv[35] = 40'h0000008593;
      expv[36] = 40'h000004da62;
      expv[37] = 40'h000006e689;
      expv[38] = 40'h00000ea266;
      expv[39] = 40'h00000eaaf5;
      expv[40] = 40'h0000080efe;
      expv[41] = 40'h00000169ac;
      expv[42] = 40'h00000eb0f9;
      expv[43] = 40'h00000f6cb9;
      expv[44] = 40'h000009e405;
      expv[45] = 40'h000007ccb9;
      expv[46] = 40'h00000da79e;
      expv[47] = 40'h000000751d;
      expv[48] = 40'h00000c2155;
      expv[49] = 40'h000004f4be;
      expv[50] = 40'h000004ef8e;
      expv[51] = 40'h00000d2e15;
      expv[52] = 40'h0000072c32;
      expv[53] = 40'h000009d821;
      expv[54] = 40'h000008a1f3;
      expv[55] = 40'h00000e4df3;
      expv[56] = 40'h000001cf00;
      expv[57] = 40'h0000076505;
      expv[58] = 40'h000000d782;
      expv[59] = 40'h0000003d20;
      expv[60] = 40'h000007b3d5;
      expv[61] = 40'h00000ca630;
      expv[62] = 40'h00000a95e4;
      expv[63] = 40'h0000081011;
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
