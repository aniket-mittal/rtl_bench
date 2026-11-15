// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097092 dut (
    .opcode(in_vec[11:5]),
    .reset(in_vec[4:4]),
    .invert(in_vec[3:3]),
    .funct(in_vec[2:0]),
    .im_sel(out_vec[16:15]),
    .jump(out_vec[14:14]),
    .branch(out_vec[13:13]),
    .Alusrc1(out_vec[12:12]),
    .Alusrc2(out_vec[11:11]),
    .regWrite(out_vec[10:10]),
    .MemRead(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .jal(out_vec[7:7]),
    .csr(out_vec[6:6]),
    .wr_sel(out_vec[5:4]),
    .ALUop(out_vec[3:1]),
    .fence(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h991;
    stim[1] = 12'he37;
    stim[2] = 12'h44b;
    stim[3] = 12'hf69;
    stim[4] = 12'hac6;
    stim[5] = 12'h462;
    stim[6] = 12'h747;
    stim[7] = 12'hd69;
    stim[8] = 12'h700;
    stim[9] = 12'h1e4;
    stim[10] = 12'h043;
    stim[11] = 12'h1a4;
    stim[12] = 12'hcec;
    stim[13] = 12'heaf;
    stim[14] = 12'hfea;
    stim[15] = 12'h143;
    stim[16] = 12'hc26;
    stim[17] = 12'hc0e;
    stim[18] = 12'h008;
    stim[19] = 12'hc40;
    stim[20] = 12'h1cc;
    stim[21] = 12'h64b;
    stim[22] = 12'h8e8;
    stim[23] = 12'hff7;
    stim[24] = 12'h847;
    stim[25] = 12'hccc;
    stim[26] = 12'hf47;
    stim[27] = 12'hd4a;
    stim[28] = 12'h84b;
    stim[29] = 12'ha05;
    stim[30] = 12'h3c4;
    stim[31] = 12'h2a3;
    stim[32] = 12'h8ae;
    stim[33] = 12'hfa2;
    stim[34] = 12'h3a6;
    stim[35] = 12'hc87;
    stim[36] = 12'ha29;
    stim[37] = 12'hd01;
    stim[38] = 12'h440;
    stim[39] = 12'h3af;
    stim[40] = 12'h325;
    stim[41] = 12'haae;
    stim[42] = 12'h200;
    stim[43] = 12'he27;
    stim[44] = 12'h767;
    stim[45] = 12'h2e3;
    stim[46] = 12'h58d;
    stim[47] = 12'h4ab;
    stim[48] = 12'h9e4;
    stim[49] = 12'h36f;
    stim[50] = 12'he4a;
    stim[51] = 12'h700;
    stim[52] = 12'h2e1;
    stim[53] = 12'hbed;
    stim[54] = 12'hd42;
    stim[55] = 12'hb4c;
    stim[56] = 12'hbe7;
    stim[57] = 12'h203;
    stim[58] = 12'h32e;
    stim[59] = 12'h8c9;
    stim[60] = 12'h146;
    stim[61] = 12'hea3;
    stim[62] = 12'ha66;
    stim[63] = 12'h204;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h08900;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00001;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h19c00;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h19c00;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
