// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153738 dut (
    .OP_code(in_vec[11:6]),
    .FUNC_code(in_vec[5:0]),
    .ALU_op(out_vec[11:8]),
    .RegWrite(out_vec[7:7]),
    .ALUSrc(out_vec[6:6]),
    .RegDest(out_vec[5:5]),
    .MemtoReg(out_vec[4:4]),
    .MemRead(out_vec[3:3]),
    .MemWrite(out_vec[2:2]),
    .signal_Branch(out_vec[1:1]),
    .Jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h2e9;
    stim[1] = 12'h79a;
    stim[2] = 12'h0e7;
    stim[3] = 12'ha04;
    stim[4] = 12'h9c5;
    stim[5] = 12'h524;
    stim[6] = 12'hc67;
    stim[7] = 12'h262;
    stim[8] = 12'h470;
    stim[9] = 12'h091;
    stim[10] = 12'hbfd;
    stim[11] = 12'h875;
    stim[12] = 12'hffa;
    stim[13] = 12'h9e3;
    stim[14] = 12'heba;
    stim[15] = 12'hcbd;
    stim[16] = 12'h0a0;
    stim[17] = 12'ha15;
    stim[18] = 12'h4c8;
    stim[19] = 12'hc16;
    stim[20] = 12'h2f3;
    stim[21] = 12'h923;
    stim[22] = 12'haf0;
    stim[23] = 12'hc75;
    stim[24] = 12'h436;
    stim[25] = 12'h4e0;
    stim[26] = 12'h9f8;
    stim[27] = 12'hc80;
    stim[28] = 12'h050;
    stim[29] = 12'h819;
    stim[30] = 12'h456;
    stim[31] = 12'hb84;
    stim[32] = 12'hb06;
    stim[33] = 12'h833;
    stim[34] = 12'h213;
    stim[35] = 12'h903;
    stim[36] = 12'h973;
    stim[37] = 12'h984;
    stim[38] = 12'h718;
    stim[39] = 12'h2b3;
    stim[40] = 12'hd55;
    stim[41] = 12'h7a9;
    stim[42] = 12'h0fe;
    stim[43] = 12'h933;
    stim[44] = 12'ha0a;
    stim[45] = 12'he92;
    stim[46] = 12'h000;
    stim[47] = 12'h1e2;
    stim[48] = 12'hbbe;
    stim[49] = 12'h62f;
    stim[50] = 12'hc94;
    stim[51] = 12'he43;
    stim[52] = 12'hb10;
    stim[53] = 12'h54b;
    stim[54] = 12'hab9;
    stim[55] = 12'h651;
    stim[56] = 12'hf99;
    stim[57] = 12'h2c6;
    stim[58] = 12'h2b1;
    stim[59] = 12'ha2a;
    stim[60] = 12'hd1d;
    stim[61] = 12'hdcf;
    stim[62] = 12'hc70;
    stim[63] = 12'h339;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h0x1;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h0x1;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h2x4;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h2c0;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h0a0;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
