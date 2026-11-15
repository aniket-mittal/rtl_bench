// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_045035 dut (
    .opcode(in_vec[3:0]),
    .RegDst(out_vec[10:10]),
    .Jump(out_vec[9:9]),
    .Branch(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemToReg(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .ALUsrc(out_vec[4:4]),
    .RegWrite(out_vec[3:3]),
    .ALUop(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'h0;
    stim[2] = 4'h1;
    stim[3] = 4'hc;
    stim[4] = 4'h1;
    stim[5] = 4'ha;
    stim[6] = 4'h5;
    stim[7] = 4'hf;
    stim[8] = 4'he;
    stim[9] = 4'hd;
    stim[10] = 4'h4;
    stim[11] = 4'h9;
    stim[12] = 4'h5;
    stim[13] = 4'ha;
    stim[14] = 4'hb;
    stim[15] = 4'he;
    stim[16] = 4'ha;
    stim[17] = 4'h5;
    stim[18] = 4'he;
    stim[19] = 4'hf;
    stim[20] = 4'h7;
    stim[21] = 4'he;
    stim[22] = 4'h5;
    stim[23] = 4'h7;
    stim[24] = 4'h2;
    stim[25] = 4'h2;
    stim[26] = 4'he;
    stim[27] = 4'h6;
    stim[28] = 4'h1;
    stim[29] = 4'hc;
    stim[30] = 4'hd;
    stim[31] = 4'h7;
    stim[32] = 4'h6;
    stim[33] = 4'h1;
    stim[34] = 4'h8;
    stim[35] = 4'h9;
    stim[36] = 4'h4;
    stim[37] = 4'hb;
    stim[38] = 4'h4;
    stim[39] = 4'h3;
    stim[40] = 4'h4;
    stim[41] = 4'he;
    stim[42] = 4'he;
    stim[43] = 4'h2;
    stim[44] = 4'h7;
    stim[45] = 4'h7;
    stim[46] = 4'he;
    stim[47] = 4'h6;
    stim[48] = 4'h2;
    stim[49] = 4'h3;
    stim[50] = 4'h1;
    stim[51] = 4'h6;
    stim[52] = 4'h9;
    stim[53] = 4'hd;
    stim[54] = 4'h6;
    stim[55] = 4'hd;
    stim[56] = 4'h5;
    stim[57] = 4'hd;
    stim[58] = 4'ha;
    stim[59] = 4'hf;
    stim[60] = 4'h5;
    stim[61] = 4'hb;
    stim[62] = 4'h3;
    stim[63] = 4'h4;
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
      expv[0] = 11'h200;
      expv[1] = 11'h40a;
      expv[2] = 11'h40c;
      expv[3] = 11'h000;
      expv[4] = 11'h40c;
      expv[5] = 11'h033;
      expv[6] = 11'h000;
      expv[7] = 11'h200;
      expv[8] = 11'h100;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h033;
      expv[14] = 11'h000;
      expv[15] = 11'h100;
      expv[16] = 11'h033;
      expv[17] = 11'h000;
      expv[18] = 11'h100;
      expv[19] = 11'h200;
      expv[20] = 11'h40d;
      expv[21] = 11'h100;
      expv[22] = 11'h000;
      expv[23] = 11'h40d;
      expv[24] = 11'h408;
      expv[25] = 11'h408;
      expv[26] = 11'h100;
      expv[27] = 11'h409;
      expv[28] = 11'h40c;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h40d;
      expv[32] = 11'h409;
      expv[33] = 11'h40c;
      expv[34] = 11'h0db;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h01b;
      expv[40] = 11'h000;
      expv[41] = 11'h100;
      expv[42] = 11'h100;
      expv[43] = 11'h408;
      expv[44] = 11'h40d;
      expv[45] = 11'h40d;
      expv[46] = 11'h100;
      expv[47] = 11'h409;
      expv[48] = 11'h408;
      expv[49] = 11'h01b;
      expv[50] = 11'h40c;
      expv[51] = 11'h409;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h409;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h033;
      expv[59] = 11'h200;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h01b;
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
