// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_101606 dut (
    .Opcode(in_vec[6:0]),
    .ALUSrc(out_vec[12:12]),
    .MemtoReg(out_vec[11:11]),
    .RegWrite(out_vec[10:10]),
    .MemRead(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .Branch(out_vec[7:7]),
    .ALUOp(out_vec[6:5]),
    .JALR(out_vec[4:4]),
    .Jump(out_vec[3:3]),
    .PCtoReg(out_vec[2:2]),
    .PCregsrc(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h08;
    stim[1] = 7'h0e;
    stim[2] = 7'h5f;
    stim[3] = 7'h6e;
    stim[4] = 7'h26;
    stim[5] = 7'h1d;
    stim[6] = 7'h74;
    stim[7] = 7'h1b;
    stim[8] = 7'h04;
    stim[9] = 7'h04;
    stim[10] = 7'h50;
    stim[11] = 7'h5d;
    stim[12] = 7'h06;
    stim[13] = 7'h50;
    stim[14] = 7'h01;
    stim[15] = 7'h5d;
    stim[16] = 7'h58;
    stim[17] = 7'h28;
    stim[18] = 7'h30;
    stim[19] = 7'h10;
    stim[20] = 7'h24;
    stim[21] = 7'h44;
    stim[22] = 7'h7b;
    stim[23] = 7'h6a;
    stim[24] = 7'h09;
    stim[25] = 7'h1d;
    stim[26] = 7'h76;
    stim[27] = 7'h37;
    stim[28] = 7'h19;
    stim[29] = 7'h1e;
    stim[30] = 7'h1c;
    stim[31] = 7'h4c;
    stim[32] = 7'h02;
    stim[33] = 7'h46;
    stim[34] = 7'h33;
    stim[35] = 7'h0c;
    stim[36] = 7'h67;
    stim[37] = 7'h54;
    stim[38] = 7'h66;
    stim[39] = 7'h75;
    stim[40] = 7'h5d;
    stim[41] = 7'h0a;
    stim[42] = 7'h3a;
    stim[43] = 7'h14;
    stim[44] = 7'h3e;
    stim[45] = 7'h2b;
    stim[46] = 7'h7f;
    stim[47] = 7'h5f;
    stim[48] = 7'h08;
    stim[49] = 7'h32;
    stim[50] = 7'h14;
    stim[51] = 7'h62;
    stim[52] = 7'h2e;
    stim[53] = 7'h48;
    stim[54] = 7'h54;
    stim[55] = 7'h75;
    stim[56] = 7'h50;
    stim[57] = 7'h16;
    stim[58] = 7'h52;
    stim[59] = 7'h10;
    stim[60] = 7'h00;
    stim[61] = 7'h74;
    stim[62] = 7'h5f;
    stim[63] = 7'h0e;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0407;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0440;
      expv[35] = 13'h0000;
      expv[36] = 13'h141d;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
