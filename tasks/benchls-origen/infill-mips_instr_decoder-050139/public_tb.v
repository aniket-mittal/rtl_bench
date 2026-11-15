// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050139 dut (
    .instr(in_vec[31:0]),
    .RegWrite(out_vec[17:17]),
    .Mem_to_Reg(out_vec[16:15]),
    .MemWrite(out_vec[14:14]),
    .ALUctr(out_vec[13:11]),
    .ALUsrc(out_vec[10:10]),
    .if_j(out_vec[9:9]),
    .if_jal(out_vec[8:8]),
    .if_jr(out_vec[7:7]),
    .RegDst(out_vec[6:5]),
    .Ext_op(out_vec[4:3]),
    .Branch_on_equal(out_vec[2:2]),
    .res(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h8f40c258;
    stim[1] = 32'h7243dd00;
    stim[2] = 32'he5a1240b;
    stim[3] = 32'hd5ecaa46;
    stim[4] = 32'h9d02c9a0;
    stim[5] = 32'h11cb049c;
    stim[6] = 32'h0113b695;
    stim[7] = 32'h8f26740f;
    stim[8] = 32'h1e043024;
    stim[9] = 32'h53a6d396;
    stim[10] = 32'h59dd9c7e;
    stim[11] = 32'hb224f75c;
    stim[12] = 32'h8a639476;
    stim[13] = 32'h95566858;
    stim[14] = 32'hfd047b19;
    stim[15] = 32'heaa90509;
    stim[16] = 32'h8997d96f;
    stim[17] = 32'hdd22e9e0;
    stim[18] = 32'h7325671f;
    stim[19] = 32'he912478e;
    stim[20] = 32'h6ac89ddf;
    stim[21] = 32'ha5613692;
    stim[22] = 32'h1f44a913;
    stim[23] = 32'h60ee0861;
    stim[24] = 32'h551236a5;
    stim[25] = 32'he7666232;
    stim[26] = 32'ha12ae1ae;
    stim[27] = 32'h77cea4d3;
    stim[28] = 32'h19d31778;
    stim[29] = 32'ha1d7be38;
    stim[30] = 32'hdc3553d5;
    stim[31] = 32'h6f4c6c79;
    stim[32] = 32'h231e300a;
    stim[33] = 32'h448ff41a;
    stim[34] = 32'h3adb08a1;
    stim[35] = 32'h25175bee;
    stim[36] = 32'hf819cc01;
    stim[37] = 32'h21bb7b64;
    stim[38] = 32'hb7020d8b;
    stim[39] = 32'hc7af6a1f;
    stim[40] = 32'hba33e6d2;
    stim[41] = 32'hafa35af0;
    stim[42] = 32'h2618bdb8;
    stim[43] = 32'h5539bc7e;
    stim[44] = 32'heba2fe2d;
    stim[45] = 32'hc4cba87d;
    stim[46] = 32'he3e042e8;
    stim[47] = 32'he96f9313;
    stim[48] = 32'h8ca10eef;
    stim[49] = 32'h6ee6c994;
    stim[50] = 32'h6165c748;
    stim[51] = 32'h6a352dd4;
    stim[52] = 32'hed513a5c;
    stim[53] = 32'hab4e3b54;
    stim[54] = 32'h0cf5d9be;
    stim[55] = 32'ha334c067;
    stim[56] = 32'h5dc9d0d2;
    stim[57] = 32'h9a805212;
    stim[58] = 32'h2ec20c6c;
    stim[59] = 32'habca941e;
    stim[60] = 32'hc2a5de9f;
    stim[61] = 32'h7d206ca6;
    stim[62] = 32'hcc9fe3f9;
    stim[63] = 32'h9f30f998;
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
      expv[0] = 18'h29401;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h03004;
      expv[6] = 18'h00000;
      expv[7] = 18'h29401;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00000;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h05400;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h29401;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h20142;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
