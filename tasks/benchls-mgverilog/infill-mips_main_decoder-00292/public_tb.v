// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00292 dut (
    .op(in_vec[5:0]),
    .memtoreg(out_vec[8:8]),
    .memwrite(out_vec[7:7]),
    .branch(out_vec[6:6]),
    .alusrc(out_vec[5:5]),
    .regdst(out_vec[4:4]),
    .regwrite(out_vec[3:3]),
    .jump(out_vec[2:2]),
    .aluop(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h20;
    stim[1] = 6'h05;
    stim[2] = 6'h35;
    stim[3] = 6'h0e;
    stim[4] = 6'h2a;
    stim[5] = 6'h25;
    stim[6] = 6'h00;
    stim[7] = 6'h3d;
    stim[8] = 6'h3f;
    stim[9] = 6'h29;
    stim[10] = 6'h2a;
    stim[11] = 6'h07;
    stim[12] = 6'h0c;
    stim[13] = 6'h15;
    stim[14] = 6'h2d;
    stim[15] = 6'h03;
    stim[16] = 6'h04;
    stim[17] = 6'h30;
    stim[18] = 6'h35;
    stim[19] = 6'h3b;
    stim[20] = 6'h17;
    stim[21] = 6'h21;
    stim[22] = 6'h2a;
    stim[23] = 6'h04;
    stim[24] = 6'h3a;
    stim[25] = 6'h0a;
    stim[26] = 6'h34;
    stim[27] = 6'h2e;
    stim[28] = 6'h0f;
    stim[29] = 6'h3b;
    stim[30] = 6'h2f;
    stim[31] = 6'h0b;
    stim[32] = 6'h1f;
    stim[33] = 6'h31;
    stim[34] = 6'h36;
    stim[35] = 6'h27;
    stim[36] = 6'h00;
    stim[37] = 6'h27;
    stim[38] = 6'h18;
    stim[39] = 6'h22;
    stim[40] = 6'h26;
    stim[41] = 6'h0c;
    stim[42] = 6'h27;
    stim[43] = 6'h0c;
    stim[44] = 6'h0a;
    stim[45] = 6'h20;
    stim[46] = 6'h3a;
    stim[47] = 6'h04;
    stim[48] = 6'h1c;
    stim[49] = 6'h27;
    stim[50] = 6'h29;
    stim[51] = 6'h3f;
    stim[52] = 6'h27;
    stim[53] = 6'h2a;
    stim[54] = 6'h21;
    stim[55] = 6'h36;
    stim[56] = 6'h1e;
    stim[57] = 6'h3f;
    stim[58] = 6'h2f;
    stim[59] = 6'h0d;
    stim[60] = 6'h12;
    stim[61] = 6'h11;
    stim[62] = 6'h38;
    stim[63] = 6'h03;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'h01b;
      expv[7] = 9'hxxx;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'hxxx;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'hxxx;
      expv[15] = 9'hxxx;
      expv[16] = 9'h041;
      expv[17] = 9'hxxx;
      expv[18] = 9'hxxx;
      expv[19] = 9'hxxx;
      expv[20] = 9'hxxx;
      expv[21] = 9'hxxx;
      expv[22] = 9'hxxx;
      expv[23] = 9'h041;
      expv[24] = 9'hxxx;
      expv[25] = 9'hxxx;
      expv[26] = 9'hxxx;
      expv[27] = 9'hxxx;
      expv[28] = 9'hxxx;
      expv[29] = 9'hxxx;
      expv[30] = 9'hxxx;
      expv[31] = 9'hxxx;
      expv[32] = 9'hxxx;
      expv[33] = 9'hxxx;
      expv[34] = 9'hxxx;
      expv[35] = 9'hxxx;
      expv[36] = 9'h01b;
      expv[37] = 9'hxxx;
      expv[38] = 9'hxxx;
      expv[39] = 9'hxxx;
      expv[40] = 9'hxxx;
      expv[41] = 9'hxxx;
      expv[42] = 9'hxxx;
      expv[43] = 9'hxxx;
      expv[44] = 9'hxxx;
      expv[45] = 9'hxxx;
      expv[46] = 9'hxxx;
      expv[47] = 9'h041;
      expv[48] = 9'hxxx;
      expv[49] = 9'hxxx;
      expv[50] = 9'hxxx;
      expv[51] = 9'hxxx;
      expv[52] = 9'hxxx;
      expv[53] = 9'hxxx;
      expv[54] = 9'hxxx;
      expv[55] = 9'hxxx;
      expv[56] = 9'hxxx;
      expv[57] = 9'hxxx;
      expv[58] = 9'hxxx;
      expv[59] = 9'hxxx;
      expv[60] = 9'hxxx;
      expv[61] = 9'hxxx;
      expv[62] = 9'hxxx;
      expv[63] = 9'hxxx;
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
