// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065249 dut (
    .OPCODE(in_vec[6:1]),
    .lw_hazard(in_vec[0:0]),
    .regdst(out_vec[8:8]),
    .alusrc(out_vec[7:7]),
    .memtoreg(out_vec[6:6]),
    .regwrite(out_vec[5:5]),
    .memread(out_vec[4:4]),
    .memwrite(out_vec[3:3]),
    .branch(out_vec[2:2]),
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
    stim[0] = 7'h6b;
    stim[1] = 7'h01;
    stim[2] = 7'h40;
    stim[3] = 7'h1a;
    stim[4] = 7'h0a;
    stim[5] = 7'h6d;
    stim[6] = 7'h0b;
    stim[7] = 7'h16;
    stim[8] = 7'h3a;
    stim[9] = 7'h22;
    stim[10] = 7'h6b;
    stim[11] = 7'h51;
    stim[12] = 7'h2b;
    stim[13] = 7'h56;
    stim[14] = 7'h5f;
    stim[15] = 7'h1a;
    stim[16] = 7'h31;
    stim[17] = 7'h09;
    stim[18] = 7'h24;
    stim[19] = 7'h60;
    stim[20] = 7'h4a;
    stim[21] = 7'h4a;
    stim[22] = 7'h30;
    stim[23] = 7'h43;
    stim[24] = 7'h40;
    stim[25] = 7'h03;
    stim[26] = 7'h25;
    stim[27] = 7'h16;
    stim[28] = 7'h23;
    stim[29] = 7'h16;
    stim[30] = 7'h7c;
    stim[31] = 7'h35;
    stim[32] = 7'h1e;
    stim[33] = 7'h27;
    stim[34] = 7'h28;
    stim[35] = 7'h3e;
    stim[36] = 7'h3a;
    stim[37] = 7'h69;
    stim[38] = 7'h2f;
    stim[39] = 7'h78;
    stim[40] = 7'h79;
    stim[41] = 7'h23;
    stim[42] = 7'h43;
    stim[43] = 7'h1f;
    stim[44] = 7'h31;
    stim[45] = 7'h61;
    stim[46] = 7'h6a;
    stim[47] = 7'h10;
    stim[48] = 7'h14;
    stim[49] = 7'h2f;
    stim[50] = 7'h04;
    stim[51] = 7'h5c;
    stim[52] = 7'h4e;
    stim[53] = 7'h63;
    stim[54] = 7'h14;
    stim[55] = 7'h4a;
    stim[56] = 7'h54;
    stim[57] = 7'h39;
    stim[58] = 7'h53;
    stim[59] = 7'h33;
    stim[60] = 7'h10;
    stim[61] = 7'h12;
    stim[62] = 7'h29;
    stim[63] = 7'h06;
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
      expv[0] = 9'h003;
      expv[1] = 9'h003;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h003;
      expv[6] = 9'h003;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h003;
      expv[11] = 9'h003;
      expv[12] = 9'h003;
      expv[13] = 9'hxx8;
      expv[14] = 9'h003;
      expv[15] = 9'h000;
      expv[16] = 9'h003;
      expv[17] = 9'h003;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h003;
      expv[24] = 9'h000;
      expv[25] = 9'h003;
      expv[26] = 9'h003;
      expv[27] = 9'h000;
      expv[28] = 9'h003;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h003;
      expv[32] = 9'h000;
      expv[33] = 9'h003;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h003;
      expv[38] = 9'h003;
      expv[39] = 9'h000;
      expv[40] = 9'h003;
      expv[41] = 9'h003;
      expv[42] = 9'h003;
      expv[43] = 9'h003;
      expv[44] = 9'h003;
      expv[45] = 9'h003;
      expv[46] = 9'h000;
      expv[47] = 9'h0a0;
      expv[48] = 9'h000;
      expv[49] = 9'h003;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h003;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h003;
      expv[58] = 9'h003;
      expv[59] = 9'h003;
      expv[60] = 9'h0a0;
      expv[61] = 9'h000;
      expv[62] = 9'h003;
      expv[63] = 9'h000;
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
