// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_201242 dut (
    .clock(clk),
    .OpCode(in_vec[19:17]),
    .Instr(in_vec[16:1]),
    .reset(in_vec[0:0]),
    .RegWrite(out_vec[10:10]),
    .RegDst(out_vec[9:8]),
    .ALUSrc(out_vec[7:7]),
    .ALUOp(out_vec[6:5]),
    .Branch(out_vec[4:4]),
    .MemWrite(out_vec[3:3]),
    .MemRead(out_vec[2:2]),
    .MemtoReg(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h883c1;
    stim[1] = 20'hae5bf;
    stim[2] = 20'ha27d2;
    stim[3] = 20'hbdc54;
    stim[4] = 20'h6deb2;
    stim[5] = 20'hf8222;
    stim[6] = 20'h69114;
    stim[7] = 20'ha7e26;
    stim[8] = 20'hb1a0e;
    stim[9] = 20'h8c1b8;
    stim[10] = 20'h5a988;
    stim[11] = 20'h9172c;
    stim[12] = 20'ha61b0;
    stim[13] = 20'h86cb8;
    stim[14] = 20'h179d2;
    stim[15] = 20'h9b32c;
    stim[16] = 20'hc8a72;
    stim[17] = 20'hf01e4;
    stim[18] = 20'hea33e;
    stim[19] = 20'h6cacd;
    stim[20] = 20'h2d882;
    stim[21] = 20'hc4088;
    stim[22] = 20'h359b2;
    stim[23] = 20'h87cee;
    stim[24] = 20'h4f386;
    stim[25] = 20'ha1c4b;
    stim[26] = 20'hf0f26;
    stim[27] = 20'hd21ed;
    stim[28] = 20'hc4180;
    stim[29] = 20'h9ee2a;
    stim[30] = 20'h5a00a;
    stim[31] = 20'h3e62c;
    stim[32] = 20'hcd14a;
    stim[33] = 20'hf5bba;
    stim[34] = 20'h7816e;
    stim[35] = 20'h5748c;
    stim[36] = 20'h18e9e;
    stim[37] = 20'h7e73f;
    stim[38] = 20'h62176;
    stim[39] = 20'hd1f5a;
    stim[40] = 20'h068b9;
    stim[41] = 20'h0121a;
    stim[42] = 20'h65c7c;
    stim[43] = 20'h31454;
    stim[44] = 20'h1c27e;
    stim[45] = 20'h60c62;
    stim[46] = 20'he312c;
    stim[47] = 20'haa3da;
    stim[48] = 20'hf1ca0;
    stim[49] = 20'hfd43e;
    stim[50] = 20'h43022;
    stim[51] = 20'h32042;
    stim[52] = 20'h31424;
    stim[53] = 20'hc5dd4;
    stim[54] = 20'h5c08e;
    stim[55] = 20'h4ee40;
    stim[56] = 20'h54bda;
    stim[57] = 20'h2c1ee;
    stim[58] = 20'hd3c66;
    stim[59] = 20'h62ebe;
    stim[60] = 20'h74968;
    stim[61] = 20'h8204c;
    stim[62] = 20'hb51a4;
    stim[63] = 20'hea38a;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h485;
      expv[3] = 11'h485;
      expv[4] = 11'h480;
      expv[5] = 11'h000;
      expv[6] = 11'h480;
      expv[7] = 11'h485;
      expv[8] = 11'h485;
      expv[9] = 11'h000;
      expv[10] = 11'h010;
      expv[11] = 11'h000;
      expv[12] = 11'h485;
      expv[13] = 11'h000;
      expv[14] = 11'h540;
      expv[15] = 11'h000;
      expv[16] = 11'h088;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h602;
      expv[21] = 11'h088;
      expv[22] = 11'h602;
      expv[23] = 11'h000;
      expv[24] = 11'h010;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h088;
      expv[29] = 11'h000;
      expv[30] = 11'h010;
      expv[31] = 11'h602;
      expv[32] = 11'h088;
      expv[33] = 11'h000;
      expv[34] = 11'h480;
      expv[35] = 11'h010;
      expv[36] = 11'h540;
      expv[37] = 11'h000;
      expv[38] = 11'h480;
      expv[39] = 11'h088;
      expv[40] = 11'h000;
      expv[41] = 11'h540;
      expv[42] = 11'h480;
      expv[43] = 11'h602;
      expv[44] = 11'h540;
      expv[45] = 11'h480;
      expv[46] = 11'h000;
      expv[47] = 11'h485;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h010;
      expv[51] = 11'h602;
      expv[52] = 11'h602;
      expv[53] = 11'h088;
      expv[54] = 11'h010;
      expv[55] = 11'h010;
      expv[56] = 11'h010;
      expv[57] = 11'h602;
      expv[58] = 11'h088;
      expv[59] = 11'h480;
      expv[60] = 11'h480;
      expv[61] = 11'h000;
      expv[62] = 11'h485;
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
