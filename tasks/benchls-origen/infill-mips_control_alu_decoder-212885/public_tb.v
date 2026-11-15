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

  origen_212885 dut (
    .OpCode(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .RegDst(out_vec[11:11]),
    .ALUSrc(out_vec[10:10]),
    .RegWrite(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .MemRead(out_vec[7:7]),
    .MemtoReg(out_vec[6:6]),
    .Branch(out_vec[5:5]),
    .Jump(out_vec[4:4]),
    .ALUControl(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hcde;
    stim[1] = 12'he7e;
    stim[2] = 12'he23;
    stim[3] = 12'h0cd;
    stim[4] = 12'h9e9;
    stim[5] = 12'h144;
    stim[6] = 12'h249;
    stim[7] = 12'hd10;
    stim[8] = 12'hfc6;
    stim[9] = 12'h765;
    stim[10] = 12'hb7e;
    stim[11] = 12'heb2;
    stim[12] = 12'h40b;
    stim[13] = 12'ha16;
    stim[14] = 12'h60e;
    stim[15] = 12'hfab;
    stim[16] = 12'hd8e;
    stim[17] = 12'hc6c;
    stim[18] = 12'h89c;
    stim[19] = 12'h25d;
    stim[20] = 12'h82e;
    stim[21] = 12'h625;
    stim[22] = 12'h241;
    stim[23] = 12'hb64;
    stim[24] = 12'hc6f;
    stim[25] = 12'had6;
    stim[26] = 12'h682;
    stim[27] = 12'h3b5;
    stim[28] = 12'hfdf;
    stim[29] = 12'h620;
    stim[30] = 12'h018;
    stim[31] = 12'ha32;
    stim[32] = 12'h2f0;
    stim[33] = 12'h8d1;
    stim[34] = 12'ha5b;
    stim[35] = 12'h2ea;
    stim[36] = 12'h24c;
    stim[37] = 12'h951;
    stim[38] = 12'hf59;
    stim[39] = 12'he6f;
    stim[40] = 12'h380;
    stim[41] = 12'hc05;
    stim[42] = 12'hcfd;
    stim[43] = 12'h3f6;
    stim[44] = 12'h56a;
    stim[45] = 12'h3ba;
    stim[46] = 12'hfc3;
    stim[47] = 12'hd4e;
    stim[48] = 12'hc97;
    stim[49] = 12'h64b;
    stim[50] = 12'hd3c;
    stim[51] = 12'h7d7;
    stim[52] = 12'h729;
    stim[53] = 12'h0b9;
    stim[54] = 12'h4cd;
    stim[55] = 12'h15a;
    stim[56] = 12'hb21;
    stim[57] = 12'hea1;
    stim[58] = 12'hacd;
    stim[59] = 12'hb5b;
    stim[60] = 12'hf4c;
    stim[61] = 12'hd90;
    stim[62] = 12'h5ea;
    stim[63] = 12'h839;
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
      expv[0] = 12'hxxf;
      expv[1] = 12'hxxf;
      expv[2] = 12'hxxf;
      expv[3] = 12'hxxf;
      expv[4] = 12'hxxf;
      expv[5] = 12'hxxf;
      expv[6] = 12'hxxf;
      expv[7] = 12'hxxf;
      expv[8] = 12'hxxf;
      expv[9] = 12'hxxf;
      expv[10] = 12'hxxf;
      expv[11] = 12'hxxf;
      expv[12] = 12'hxxf;
      expv[13] = 12'hxxf;
      expv[14] = 12'hxxf;
      expv[15] = 12'hxxf;
      expv[16] = 12'hxxf;
      expv[17] = 12'hxxf;
      expv[18] = 12'hxxf;
      expv[19] = 12'hxxf;
      expv[20] = 12'hxxf;
      expv[21] = 12'hxxf;
      expv[22] = 12'hxxf;
      expv[23] = 12'hxxf;
      expv[24] = 12'hxxf;
      expv[25] = 12'hxx2;
      expv[26] = 12'hxxf;
      expv[27] = 12'hxxf;
      expv[28] = 12'hxxf;
      expv[29] = 12'hxxf;
      expv[30] = 12'ha0f;
      expv[31] = 12'hxxf;
      expv[32] = 12'hxxf;
      expv[33] = 12'h6c2;
      expv[34] = 12'hxxf;
      expv[35] = 12'hxxf;
      expv[36] = 12'hxxf;
      expv[37] = 12'hxxf;
      expv[38] = 12'hxxf;
      expv[39] = 12'hxxf;
      expv[40] = 12'hxxf;
      expv[41] = 12'hxxf;
      expv[42] = 12'hxxf;
      expv[43] = 12'hxxf;
      expv[44] = 12'hxxf;
      expv[45] = 12'hxxf;
      expv[46] = 12'hxxf;
      expv[47] = 12'hxxf;
      expv[48] = 12'hxxf;
      expv[49] = 12'hxxf;
      expv[50] = 12'hxxf;
      expv[51] = 12'hxxf;
      expv[52] = 12'hxxf;
      expv[53] = 12'hxxx;
      expv[54] = 12'hxxf;
      expv[55] = 12'hxxf;
      expv[56] = 12'hxxf;
      expv[57] = 12'hxxf;
      expv[58] = 12'hxx2;
      expv[59] = 12'hxxf;
      expv[60] = 12'hxxf;
      expv[61] = 12'hxxf;
      expv[62] = 12'hxxf;
      expv[63] = 12'hxxf;
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
