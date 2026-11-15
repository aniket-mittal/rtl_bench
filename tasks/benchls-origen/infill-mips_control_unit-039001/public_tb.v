// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039001 dut (
    .OPCode(in_vec[11:6]),
    .FunctCode(in_vec[5:0]),
    .MemtoReg(out_vec[18:17]),
    .MemWrite(out_vec[16:16]),
    .Branch(out_vec[15:13]),
    .ALUsrc(out_vec[12:11]),
    .ALUop(out_vec[10:7]),
    .EXTop(out_vec[6:5]),
    .RegDst(out_vec[4:3]),
    .RegWrite(out_vec[2:2]),
    .Jadr(out_vec[1:1]),
    .Jsrc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hec1;
    stim[1] = 12'ha1b;
    stim[2] = 12'hc5e;
    stim[3] = 12'h6d2;
    stim[4] = 12'h0b2;
    stim[5] = 12'h4fb;
    stim[6] = 12'h32a;
    stim[7] = 12'h0c8;
    stim[8] = 12'h674;
    stim[9] = 12'hd5c;
    stim[10] = 12'hcfb;
    stim[11] = 12'h484;
    stim[12] = 12'h3f4;
    stim[13] = 12'hfe9;
    stim[14] = 12'hccf;
    stim[15] = 12'h6a2;
    stim[16] = 12'hf1e;
    stim[17] = 12'h720;
    stim[18] = 12'ha1b;
    stim[19] = 12'hbb7;
    stim[20] = 12'hfe6;
    stim[21] = 12'h161;
    stim[22] = 12'hc4b;
    stim[23] = 12'h8c0;
    stim[24] = 12'hdb0;
    stim[25] = 12'h52c;
    stim[26] = 12'h0c6;
    stim[27] = 12'h11d;
    stim[28] = 12'h795;
    stim[29] = 12'h0b1;
    stim[30] = 12'hbb2;
    stim[31] = 12'hd04;
    stim[32] = 12'h1f7;
    stim[33] = 12'h569;
    stim[34] = 12'hb48;
    stim[35] = 12'h153;
    stim[36] = 12'h7b5;
    stim[37] = 12'h470;
    stim[38] = 12'h7ec;
    stim[39] = 12'h899;
    stim[40] = 12'h59d;
    stim[41] = 12'hb27;
    stim[42] = 12'h4dd;
    stim[43] = 12'h565;
    stim[44] = 12'h981;
    stim[45] = 12'hfba;
    stim[46] = 12'h7dc;
    stim[47] = 12'h756;
    stim[48] = 12'h103;
    stim[49] = 12'h737;
    stim[50] = 12'h57d;
    stim[51] = 12'h7a8;
    stim[52] = 12'h72f;
    stim[53] = 12'hed6;
    stim[54] = 12'h03d;
    stim[55] = 12'h3f0;
    stim[56] = 12'h01d;
    stim[57] = 12'h7dd;
    stim[58] = 12'h2cc;
    stim[59] = 12'hcdd;
    stim[60] = 12'h365;
    stim[61] = 12'h206;
    stim[62] = 12'h2a1;
    stim[63] = 12'hce2;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00000;
      expv[6] = 19'h00000;
      expv[7] = 19'h40015;
      expv[8] = 19'h00000;
      expv[9] = 19'h00000;
      expv[10] = 19'h00000;
      expv[11] = 19'h00000;
      expv[12] = 19'h00c44;
      expv[13] = 19'h00000;
      expv[14] = 19'h00000;
      expv[15] = 19'h00000;
      expv[16] = 19'h00000;
      expv[17] = 19'h00000;
      expv[18] = 19'h00000;
      expv[19] = 19'h00000;
      expv[20] = 19'h00000;
      expv[21] = 19'h00000;
      expv[22] = 19'h00000;
      expv[23] = 19'h20924;
      expv[24] = 19'h00000;
      expv[25] = 19'h00000;
      expv[26] = 19'h40015;
      expv[27] = 19'h02320;
      expv[28] = 19'h00000;
      expv[29] = 19'h00000;
      expv[30] = 19'h00000;
      expv[31] = 19'h00000;
      expv[32] = 19'h00000;
      expv[33] = 19'h00000;
      expv[34] = 19'h00000;
      expv[35] = 19'h00000;
      expv[36] = 19'h00000;
      expv[37] = 19'h00000;
      expv[38] = 19'h00000;
      expv[39] = 19'h00000;
      expv[40] = 19'h00000;
      expv[41] = 19'h00000;
      expv[42] = 19'h00000;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00000;
      expv[46] = 19'h00000;
      expv[47] = 19'h00000;
      expv[48] = 19'h02320;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00000;
      expv[53] = 19'h00000;
      expv[54] = 19'h00000;
      expv[55] = 19'h00c44;
      expv[56] = 19'h00000;
      expv[57] = 19'h00000;
      expv[58] = 19'h00000;
      expv[59] = 19'h00000;
      expv[60] = 19'h00884;
      expv[61] = 19'h00000;
      expv[62] = 19'h00000;
      expv[63] = 19'h00000;
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
