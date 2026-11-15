// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055885 dut (
    .instruction(in_vec[31:0]),
    .instr_type(out_vec[12:10]),
    .data_instr_type(out_vec[9:6]),
    .jmp_instr_type(out_vec[5:3]),
    .mem_instr_type(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hf6a39542;
    stim[1] = 32'h4280ebed;
    stim[2] = 32'h82a2abc7;
    stim[3] = 32'h3fea35da;
    stim[4] = 32'h637a975b;
    stim[5] = 32'h3e30295f;
    stim[6] = 32'h179a8614;
    stim[7] = 32'he4f80305;
    stim[8] = 32'h13ddeeb0;
    stim[9] = 32'hb2e8d027;
    stim[10] = 32'h239ef25b;
    stim[11] = 32'h0e7c1ce9;
    stim[12] = 32'hd21901ee;
    stim[13] = 32'h5b6b64a9;
    stim[14] = 32'h482447ca;
    stim[15] = 32'h7681939f;
    stim[16] = 32'h00499c07;
    stim[17] = 32'h99c423a5;
    stim[18] = 32'h99d9ba7a;
    stim[19] = 32'h4ee4c741;
    stim[20] = 32'h069966ae;
    stim[21] = 32'h1473ee2c;
    stim[22] = 32'hc9a02f72;
    stim[23] = 32'heefb508b;
    stim[24] = 32'hcf9a5542;
    stim[25] = 32'h40b32c82;
    stim[26] = 32'h07da1799;
    stim[27] = 32'h8b07e16a;
    stim[28] = 32'h2ca413b7;
    stim[29] = 32'had879e32;
    stim[30] = 32'h3a82ba5f;
    stim[31] = 32'he98dad56;
    stim[32] = 32'hccf0c4c3;
    stim[33] = 32'hc934a8f4;
    stim[34] = 32'he550c743;
    stim[35] = 32'hfd1014b0;
    stim[36] = 32'h36976027;
    stim[37] = 32'h8bc1c204;
    stim[38] = 32'h36536f97;
    stim[39] = 32'hc43caa28;
    stim[40] = 32'h5922f27f;
    stim[41] = 32'h51fb6e0e;
    stim[42] = 32'h48e9e2e1;
    stim[43] = 32'h85797191;
    stim[44] = 32'h58279af4;
    stim[45] = 32'he55b6153;
    stim[46] = 32'hd90c6a24;
    stim[47] = 32'he461a54e;
    stim[48] = 32'h2e8692a3;
    stim[49] = 32'h0e75acee;
    stim[50] = 32'hbfe49be1;
    stim[51] = 32'hf9c65799;
    stim[52] = 32'h24a1dc90;
    stim[53] = 32'hdf5161be;
    stim[54] = 32'hcb3a6c74;
    stim[55] = 32'h0bf72c24;
    stim[56] = 32'h903dd736;
    stim[57] = 32'h56a5ffa3;
    stim[58] = 32'h256b24a0;
    stim[59] = 32'h40546c99;
    stim[60] = 32'h135d9f08;
    stim[61] = 32'h0a02ce0f;
    stim[62] = 32'haa6e38d9;
    stim[63] = 32'h4abafa3d;
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
      expv[0] = 13'h0801;
      expv[1] = 13'h0440;
      expv[2] = 13'h0440;
      expv[3] = 13'h0000;
      expv[4] = 13'h0440;
      expv[5] = 13'h0000;
      expv[6] = 13'h0801;
      expv[7] = 13'h0802;
      expv[8] = 13'h0440;
      expv[9] = 13'h0440;
      expv[10] = 13'h0440;
      expv[11] = 13'h0000;
      expv[12] = 13'h0440;
      expv[13] = 13'h0c10;
      expv[14] = 13'h0c00;
      expv[15] = 13'h0801;
      expv[16] = 13'h0480;
      expv[17] = 13'h0c00;
      expv[18] = 13'h0c00;
      expv[19] = 13'h0000;
      expv[20] = 13'h0801;
      expv[21] = 13'h0802;
      expv[22] = 13'h0c00;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0480;
      expv[26] = 13'h0801;
      expv[27] = 13'h0c10;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0c08;
      expv[31] = 13'h0c00;
      expv[32] = 13'h0000;
      expv[33] = 13'h0c00;
      expv[34] = 13'h0802;
      expv[35] = 13'h0000;
      expv[36] = 13'h0801;
      expv[37] = 13'h0c10;
      expv[38] = 13'h0801;
      expv[39] = 13'h0802;
      expv[40] = 13'h0c00;
      expv[41] = 13'h0480;
      expv[42] = 13'h0c00;
      expv[43] = 13'h0802;
      expv[44] = 13'h0c00;
      expv[45] = 13'h0802;
      expv[46] = 13'h0c00;
      expv[47] = 13'h0802;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0c00;
      expv[52] = 13'h0802;
      expv[53] = 13'h0000;
      expv[54] = 13'h0c10;
      expv[55] = 13'h0c10;
      expv[56] = 13'h0400;
      expv[57] = 13'h0801;
      expv[58] = 13'h0802;
      expv[59] = 13'h0400;
      expv[60] = 13'h0440;
      expv[61] = 13'h0c08;
      expv[62] = 13'h0c08;
      expv[63] = 13'h0c08;
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
