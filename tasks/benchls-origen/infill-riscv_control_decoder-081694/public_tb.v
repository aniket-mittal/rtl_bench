// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081694 dut (
    .instr(in_vec[6:0]),
    .RdSrc(out_vec[9:8]),
    .Branch(out_vec[7:7]),
    .MemRead(out_vec[6:6]),
    .MemtoReg(out_vec[5:5]),
    .MemWrite(out_vec[4:4]),
    .ALUSrc(out_vec[3:3]),
    .RegWrite(out_vec[2:2]),
    .ALUOp(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h6a;
    stim[1] = 7'h3d;
    stim[2] = 7'h73;
    stim[3] = 7'h4c;
    stim[4] = 7'h33;
    stim[5] = 7'h18;
    stim[6] = 7'h45;
    stim[7] = 7'h5c;
    stim[8] = 7'h54;
    stim[9] = 7'h55;
    stim[10] = 7'h05;
    stim[11] = 7'h1e;
    stim[12] = 7'h6b;
    stim[13] = 7'h01;
    stim[14] = 7'h7b;
    stim[15] = 7'h0c;
    stim[16] = 7'h77;
    stim[17] = 7'h7e;
    stim[18] = 7'h6e;
    stim[19] = 7'h61;
    stim[20] = 7'h79;
    stim[21] = 7'h63;
    stim[22] = 7'h4b;
    stim[23] = 7'h38;
    stim[24] = 7'h43;
    stim[25] = 7'h48;
    stim[26] = 7'h7d;
    stim[27] = 7'h67;
    stim[28] = 7'h1b;
    stim[29] = 7'h15;
    stim[30] = 7'h5e;
    stim[31] = 7'h40;
    stim[32] = 7'h19;
    stim[33] = 7'h7b;
    stim[34] = 7'h23;
    stim[35] = 7'h5a;
    stim[36] = 7'h05;
    stim[37] = 7'h47;
    stim[38] = 7'h5c;
    stim[39] = 7'h01;
    stim[40] = 7'h2e;
    stim[41] = 7'h1e;
    stim[42] = 7'h34;
    stim[43] = 7'h5c;
    stim[44] = 7'h4b;
    stim[45] = 7'h3f;
    stim[46] = 7'h19;
    stim[47] = 7'h3a;
    stim[48] = 7'h3f;
    stim[49] = 7'h60;
    stim[50] = 7'h71;
    stim[51] = 7'h68;
    stim[52] = 7'h3e;
    stim[53] = 7'h3b;
    stim[54] = 7'h67;
    stim[55] = 7'h4c;
    stim[56] = 7'h0f;
    stim[57] = 7'h63;
    stim[58] = 7'h4b;
    stim[59] = 7'h6c;
    stim[60] = 7'h04;
    stim[61] = 7'h7a;
    stim[62] = 7'h76;
    stim[63] = 7'h7e;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'hxxx;
      expv[3] = 10'h000;
      expv[4] = 10'h006;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h06c;
      expv[14] = 10'h000;
      expv[15] = 10'hxxx;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h28x;
      expv[19] = 10'hxx1;
      expv[20] = 10'h000;
      expv[21] = 10'hxx1;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h28c;
      expv[28] = 10'h000;
      expv[29] = 10'h30c;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'hxx8;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h06c;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h10x;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'hxx1;
      expv[50] = 10'hxxx;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h28c;
      expv[55] = 10'h000;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxx1;
      expv[58] = 10'h000;
      expv[59] = 10'h28x;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
