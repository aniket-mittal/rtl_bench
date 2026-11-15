// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_049165 dut (
    .opcode(in_vec[11:6]),
    .func(in_vec[5:0]),
    .AluOp(out_vec[10:9]),
    .Jmp(out_vec[8:8]),
    .Brancheq(out_vec[7:7]),
    .Branchneq(out_vec[6:6]),
    .DataSrc(out_vec[5:5]),
    .regDst(out_vec[4:4]),
    .regWrite(out_vec[3:3]),
    .AluSrc(out_vec[2:2]),
    .MemWrite(out_vec[1:1]),
    .MemRead(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h7a8;
    stim[1] = 12'h53c;
    stim[2] = 12'h818;
    stim[3] = 12'haa4;
    stim[4] = 12'h0f2;
    stim[5] = 12'hf8b;
    stim[6] = 12'h95e;
    stim[7] = 12'h77b;
    stim[8] = 12'hc66;
    stim[9] = 12'hddb;
    stim[10] = 12'h6cd;
    stim[11] = 12'h63e;
    stim[12] = 12'h25c;
    stim[13] = 12'h04c;
    stim[14] = 12'h6ea;
    stim[15] = 12'hac5;
    stim[16] = 12'hf27;
    stim[17] = 12'ha29;
    stim[18] = 12'he75;
    stim[19] = 12'hcc5;
    stim[20] = 12'hf66;
    stim[21] = 12'he9a;
    stim[22] = 12'h97d;
    stim[23] = 12'h892;
    stim[24] = 12'hbaf;
    stim[25] = 12'hd39;
    stim[26] = 12'h5d9;
    stim[27] = 12'hf2a;
    stim[28] = 12'hb30;
    stim[29] = 12'h1e9;
    stim[30] = 12'hf70;
    stim[31] = 12'h81a;
    stim[32] = 12'h61d;
    stim[33] = 12'h05c;
    stim[34] = 12'hc13;
    stim[35] = 12'hb02;
    stim[36] = 12'hd27;
    stim[37] = 12'h542;
    stim[38] = 12'hdb5;
    stim[39] = 12'hf43;
    stim[40] = 12'he2d;
    stim[41] = 12'h84f;
    stim[42] = 12'h26a;
    stim[43] = 12'ha74;
    stim[44] = 12'h6fe;
    stim[45] = 12'h6ba;
    stim[46] = 12'h036;
    stim[47] = 12'h957;
    stim[48] = 12'h0f9;
    stim[49] = 12'hd3e;
    stim[50] = 12'hb9d;
    stim[51] = 12'hff1;
    stim[52] = 12'hdc2;
    stim[53] = 12'hac7;
    stim[54] = 12'h728;
    stim[55] = 12'h2ce;
    stim[56] = 12'h184;
    stim[57] = 12'he39;
    stim[58] = 12'h0bd;
    stim[59] = 12'h0cc;
    stim[60] = 12'h176;
    stim[61] = 12'h3a5;
    stim[62] = 12'hff0;
    stim[63] = 12'h2f4;
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
      expv[3] = 11'h000;
      expv[4] = 11'h000;
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
      expv[15] = 11'h006;
      expv[16] = 11'h000;
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
      expv[34] = 11'h000;
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
      expv[46] = 11'h418;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h006;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h100;
      expv[59] = 11'h000;
      expv[60] = 11'h240;
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
