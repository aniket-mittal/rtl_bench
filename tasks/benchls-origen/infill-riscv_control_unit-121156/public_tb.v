// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_121156 dut (
    .Opcode(in_vec[6:0]),
    .ALUSrc(out_vec[10:10]),
    .MemtoReg(out_vec[9:9]),
    .RegWrite(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemWrite(out_vec[6:6]),
    .ALUOp(out_vec[5:4]),
    .Branch(out_vec[3:3]),
    .JalrSel(out_vec[2:2]),
    .RWSel(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h0f;
    stim[1] = 7'h28;
    stim[2] = 7'h1a;
    stim[3] = 7'h23;
    stim[4] = 7'h33;
    stim[5] = 7'h49;
    stim[6] = 7'h5c;
    stim[7] = 7'h6c;
    stim[8] = 7'h19;
    stim[9] = 7'h7e;
    stim[10] = 7'h31;
    stim[11] = 7'h55;
    stim[12] = 7'h20;
    stim[13] = 7'h7b;
    stim[14] = 7'h40;
    stim[15] = 7'h71;
    stim[16] = 7'h17;
    stim[17] = 7'h55;
    stim[18] = 7'h6e;
    stim[19] = 7'h4f;
    stim[20] = 7'h4a;
    stim[21] = 7'h56;
    stim[22] = 7'h0f;
    stim[23] = 7'h60;
    stim[24] = 7'h3d;
    stim[25] = 7'h0a;
    stim[26] = 7'h7d;
    stim[27] = 7'h7d;
    stim[28] = 7'h60;
    stim[29] = 7'h20;
    stim[30] = 7'h1b;
    stim[31] = 7'h5f;
    stim[32] = 7'h43;
    stim[33] = 7'h2b;
    stim[34] = 7'h13;
    stim[35] = 7'h35;
    stim[36] = 7'h7e;
    stim[37] = 7'h73;
    stim[38] = 7'h4e;
    stim[39] = 7'h7c;
    stim[40] = 7'h78;
    stim[41] = 7'h41;
    stim[42] = 7'h45;
    stim[43] = 7'h44;
    stim[44] = 7'h3b;
    stim[45] = 7'h7f;
    stim[46] = 7'h35;
    stim[47] = 7'h29;
    stim[48] = 7'h53;
    stim[49] = 7'h15;
    stim[50] = 7'h0e;
    stim[51] = 7'h5c;
    stim[52] = 7'h2e;
    stim[53] = 7'h42;
    stim[54] = 7'h07;
    stim[55] = 7'h73;
    stim[56] = 7'h23;
    stim[57] = 7'h67;
    stim[58] = 7'h66;
    stim[59] = 7'h50;
    stim[60] = 7'h11;
    stim[61] = 7'h58;
    stim[62] = 7'h62;
    stim[63] = 7'h4f;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h440;
      expv[4] = 11'h120;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h101;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h520;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h440;
      expv[57] = 11'h506;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
