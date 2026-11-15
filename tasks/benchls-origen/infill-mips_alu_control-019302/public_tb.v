// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_019302 dut (
    .OP(in_vec[11:6]),
    .func(in_vec[5:0]),
    .RegWrite(out_vec[9:9]),
    .RegDist(out_vec[8:8]),
    .ALUSrc(out_vec[7:7]),
    .ALUControl(out_vec[6:4]),
    .Branch(out_vec[3:3]),
    .MemWrite(out_vec[2:2]),
    .MemtoReg(out_vec[1:1]),
    .jump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd88;
    stim[1] = 12'h593;
    stim[2] = 12'h511;
    stim[3] = 12'h300;
    stim[4] = 12'ha18;
    stim[5] = 12'hd6f;
    stim[6] = 12'h02a;
    stim[7] = 12'h59d;
    stim[8] = 12'h8f5;
    stim[9] = 12'h36e;
    stim[10] = 12'h8d4;
    stim[11] = 12'hc15;
    stim[12] = 12'h72c;
    stim[13] = 12'h58d;
    stim[14] = 12'hecf;
    stim[15] = 12'ha6f;
    stim[16] = 12'hfbd;
    stim[17] = 12'ha21;
    stim[18] = 12'h8a9;
    stim[19] = 12'hd04;
    stim[20] = 12'h77d;
    stim[21] = 12'h447;
    stim[22] = 12'h960;
    stim[23] = 12'hc57;
    stim[24] = 12'h8be;
    stim[25] = 12'h364;
    stim[26] = 12'h9cc;
    stim[27] = 12'haac;
    stim[28] = 12'h30d;
    stim[29] = 12'ha1b;
    stim[30] = 12'h2a8;
    stim[31] = 12'h7e2;
    stim[32] = 12'h084;
    stim[33] = 12'h6b8;
    stim[34] = 12'h645;
    stim[35] = 12'h75b;
    stim[36] = 12'hf73;
    stim[37] = 12'hf15;
    stim[38] = 12'hc0c;
    stim[39] = 12'ha4a;
    stim[40] = 12'h3c4;
    stim[41] = 12'hecf;
    stim[42] = 12'hb33;
    stim[43] = 12'h12e;
    stim[44] = 12'h31d;
    stim[45] = 12'hb70;
    stim[46] = 12'h0da;
    stim[47] = 12'hcae;
    stim[48] = 12'hc28;
    stim[49] = 12'h9a3;
    stim[50] = 12'h3f3;
    stim[51] = 12'h0da;
    stim[52] = 12'hd03;
    stim[53] = 12'h6fd;
    stim[54] = 12'hbb5;
    stim[55] = 12'h92d;
    stim[56] = 12'hbdb;
    stim[57] = 12'h7f6;
    stim[58] = 12'h609;
    stim[59] = 12'h902;
    stim[60] = 12'h88a;
    stim[61] = 12'h63d;
    stim[62] = 12'h447;
    stim[63] = 12'h261;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'h370;
      expv[7] = 10'hxxx;
      expv[8] = 10'h2a2;
      expv[9] = 10'h290;
      expv[10] = 10'h2a2;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'hxxx;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'h290;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
      expv[58] = 10'hxxx;
      expv[59] = 10'hxxx;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
