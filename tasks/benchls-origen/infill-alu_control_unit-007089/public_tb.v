// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007089 dut (
    .clk(clk),
    .rst(in_vec[14:14]),
    .instFunc(in_vec[13:8]),
    .opcode(in_vec[7:2]),
    .ALUOp(in_vec[1:0]),
    .ALUOperation(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h4b35;
    stim[1] = 15'h47ea;
    stim[2] = 15'h0470;
    stim[3] = 15'h0dd1;
    stim[4] = 15'h4092;
    stim[5] = 15'h2a84;
    stim[6] = 15'h2a4a;
    stim[7] = 15'h19b6;
    stim[8] = 15'h2f30;
    stim[9] = 15'h399e;
    stim[10] = 15'h3d21;
    stim[11] = 15'h1689;
    stim[12] = 15'h31ca;
    stim[13] = 15'h14bb;
    stim[14] = 15'h0cee;
    stim[15] = 15'h2f6c;
    stim[16] = 15'h0a5f;
    stim[17] = 15'h0641;
    stim[18] = 15'h0dc9;
    stim[19] = 15'h398a;
    stim[20] = 15'h018c;
    stim[21] = 15'h0be9;
    stim[22] = 15'h26f3;
    stim[23] = 15'h3d77;
    stim[24] = 15'h06a2;
    stim[25] = 15'h1f5f;
    stim[26] = 15'h1cf0;
    stim[27] = 15'h0b28;
    stim[28] = 15'h31e8;
    stim[29] = 15'h1420;
    stim[30] = 15'h1a6e;
    stim[31] = 15'h1059;
    stim[32] = 15'h3fa4;
    stim[33] = 15'h178d;
    stim[34] = 15'h0f90;
    stim[35] = 15'h0558;
    stim[36] = 15'h32af;
    stim[37] = 15'h02cf;
    stim[38] = 15'h13b8;
    stim[39] = 15'h2e90;
    stim[40] = 15'h35f5;
    stim[41] = 15'h176a;
    stim[42] = 15'h1fff;
    stim[43] = 15'h09f0;
    stim[44] = 15'h3a6c;
    stim[45] = 15'h1118;
    stim[46] = 15'h0eed;
    stim[47] = 15'h0a12;
    stim[48] = 15'h0cc4;
    stim[49] = 15'h3d4d;
    stim[50] = 15'h20a0;
    stim[51] = 15'h2a1b;
    stim[52] = 15'h18aa;
    stim[53] = 15'h1e74;
    stim[54] = 15'h0c92;
    stim[55] = 15'h054c;
    stim[56] = 15'h307c;
    stim[57] = 15'h0439;
    stim[58] = 15'h1dc0;
    stim[59] = 15'h1a7a;
    stim[60] = 15'h339b;
    stim[61] = 15'h18d5;
    stim[62] = 15'h0735;
    stim[63] = 15'h28a3;
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
      expv[0] = 3'h1;
      expv[1] = 3'hx;
      expv[2] = 3'h2;
      expv[3] = 3'h6;
      expv[4] = 3'hx;
      expv[5] = 3'h2;
      expv[6] = 3'h7;
      expv[7] = 3'hx;
      expv[8] = 3'h0;
      expv[9] = 3'hx;
      expv[10] = 3'h2;
      expv[11] = 3'h6;
      expv[12] = 3'hx;
      expv[13] = 3'h6;
      expv[14] = 3'hx;
      expv[15] = 3'h2;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'hx;
      expv[20] = 3'h2;
      expv[21] = 3'h6;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'hx;
      expv[25] = 3'h6;
      expv[26] = 3'h2;
      expv[27] = 3'h2;
      expv[28] = 3'h2;
      expv[29] = 3'h2;
      expv[30] = 3'hx;
      expv[31] = 3'h6;
      expv[32] = 3'h2;
      expv[33] = 3'h6;
      expv[34] = 3'h2;
      expv[35] = 3'h2;
      expv[36] = 3'h6;
      expv[37] = 3'h6;
      expv[38] = 3'h2;
      expv[39] = 3'h2;
      expv[40] = 3'h6;
      expv[41] = 3'hx;
      expv[42] = 3'h6;
      expv[43] = 3'h2;
      expv[44] = 3'h2;
      expv[45] = 3'h2;
      expv[46] = 3'h6;
      expv[47] = 3'hx;
      expv[48] = 3'h2;
      expv[49] = 3'h6;
      expv[50] = 3'h2;
      expv[51] = 3'h6;
      expv[52] = 3'hx;
      expv[53] = 3'h2;
      expv[54] = 3'hx;
      expv[55] = 3'h2;
      expv[56] = 3'h2;
      expv[57] = 3'h3;
      expv[58] = 3'h2;
      expv[59] = 3'hx;
      expv[60] = 3'h6;
      expv[61] = 3'h6;
      expv[62] = 3'h1;
      expv[63] = 3'h6;
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
