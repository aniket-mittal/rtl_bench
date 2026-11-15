// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09742 dut (
    .clk(clk),
    .ibus(in_vec[31:0]),
    .ibusWire(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'he23d4fa6;
    stim[1] = 32'hd063f4e5;
    stim[2] = 32'h6fb9cbcd;
    stim[3] = 32'he8228dcf;
    stim[4] = 32'h59f8204f;
    stim[5] = 32'h55f04f41;
    stim[6] = 32'hcdb78bb7;
    stim[7] = 32'h8d07db89;
    stim[8] = 32'h67cfb223;
    stim[9] = 32'h2dc1e771;
    stim[10] = 32'h2360d904;
    stim[11] = 32'hc94a3e9e;
    stim[12] = 32'hc089dc04;
    stim[13] = 32'he1f9d3b2;
    stim[14] = 32'h9a170911;
    stim[15] = 32'h29e6ec4e;
    stim[16] = 32'h452faa1e;
    stim[17] = 32'h6b759b87;
    stim[18] = 32'h411d6bd2;
    stim[19] = 32'h0056d1b8;
    stim[20] = 32'h9d6c1541;
    stim[21] = 32'h911dc2bc;
    stim[22] = 32'ha8db2d44;
    stim[23] = 32'h79b174b2;
    stim[24] = 32'h3d9ab07c;
    stim[25] = 32'h8960ba62;
    stim[26] = 32'h98ff7b1b;
    stim[27] = 32'hea4565fc;
    stim[28] = 32'h3a278a3c;
    stim[29] = 32'hc55940d4;
    stim[30] = 32'h24057925;
    stim[31] = 32'h6739c9d1;
    stim[32] = 32'hf384d257;
    stim[33] = 32'h63505043;
    stim[34] = 32'hed816003;
    stim[35] = 32'h34f3de19;
    stim[36] = 32'h872b9756;
    stim[37] = 32'ha9180134;
    stim[38] = 32'hfa74a0ef;
    stim[39] = 32'h8bead8eb;
    stim[40] = 32'h6ef22ec6;
    stim[41] = 32'h46e20ec8;
    stim[42] = 32'hcc057cae;
    stim[43] = 32'h9648ca0b;
    stim[44] = 32'hc7fbe292;
    stim[45] = 32'h942c1d8a;
    stim[46] = 32'hd261ebc0;
    stim[47] = 32'h877507af;
    stim[48] = 32'hb9e5364f;
    stim[49] = 32'h45e04b2a;
    stim[50] = 32'hc224cd2e;
    stim[51] = 32'h9369218b;
    stim[52] = 32'ha0f0d583;
    stim[53] = 32'hae3b4be0;
    stim[54] = 32'h90ae0a72;
    stim[55] = 32'h6b9e696e;
    stim[56] = 32'h4c58592e;
    stim[57] = 32'h979a8910;
    stim[58] = 32'he77626a8;
    stim[59] = 32'h13d466e6;
    stim[60] = 32'h706d235c;
    stim[61] = 32'had01a02d;
    stim[62] = 32'h07a42a61;
    stim[63] = 32'he0cb5dcd;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'he23d4fa6;
      expv[2] = 32'hd063f4e5;
      expv[3] = 32'h6fb9cbcd;
      expv[4] = 32'he8228dcf;
      expv[5] = 32'h59f8204f;
      expv[6] = 32'h55f04f41;
      expv[7] = 32'hcdb78bb7;
      expv[8] = 32'h8d07db89;
      expv[9] = 32'h67cfb223;
      expv[10] = 32'h2dc1e771;
      expv[11] = 32'h2360d904;
      expv[12] = 32'hc94a3e9e;
      expv[13] = 32'hc089dc04;
      expv[14] = 32'he1f9d3b2;
      expv[15] = 32'h9a170911;
      expv[16] = 32'h29e6ec4e;
      expv[17] = 32'h452faa1e;
      expv[18] = 32'h6b759b87;
      expv[19] = 32'h411d6bd2;
      expv[20] = 32'h0056d1b8;
      expv[21] = 32'h9d6c1541;
      expv[22] = 32'h911dc2bc;
      expv[23] = 32'ha8db2d44;
      expv[24] = 32'h79b174b2;
      expv[25] = 32'h3d9ab07c;
      expv[26] = 32'h8960ba62;
      expv[27] = 32'h98ff7b1b;
      expv[28] = 32'hea4565fc;
      expv[29] = 32'h3a278a3c;
      expv[30] = 32'hc55940d4;
      expv[31] = 32'h24057925;
      expv[32] = 32'h6739c9d1;
      expv[33] = 32'hf384d257;
      expv[34] = 32'h63505043;
      expv[35] = 32'hed816003;
      expv[36] = 32'h34f3de19;
      expv[37] = 32'h872b9756;
      expv[38] = 32'ha9180134;
      expv[39] = 32'hfa74a0ef;
      expv[40] = 32'h8bead8eb;
      expv[41] = 32'h6ef22ec6;
      expv[42] = 32'h46e20ec8;
      expv[43] = 32'hcc057cae;
      expv[44] = 32'h9648ca0b;
      expv[45] = 32'hc7fbe292;
      expv[46] = 32'h942c1d8a;
      expv[47] = 32'hd261ebc0;
      expv[48] = 32'h877507af;
      expv[49] = 32'hb9e5364f;
      expv[50] = 32'h45e04b2a;
      expv[51] = 32'hc224cd2e;
      expv[52] = 32'h9369218b;
      expv[53] = 32'ha0f0d583;
      expv[54] = 32'hae3b4be0;
      expv[55] = 32'h90ae0a72;
      expv[56] = 32'h6b9e696e;
      expv[57] = 32'h4c58592e;
      expv[58] = 32'h979a8910;
      expv[59] = 32'he77626a8;
      expv[60] = 32'h13d466e6;
      expv[61] = 32'h706d235c;
      expv[62] = 32'had01a02d;
      expv[63] = 32'h07a42a61;
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
