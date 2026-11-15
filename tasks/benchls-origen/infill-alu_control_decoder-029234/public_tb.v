// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029234 dut (
    .ALUOp(in_vec[7:6]),
    .Funct(in_vec[5:0]),
    .ALUOperation(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h91;
    stim[1] = 8'he0;
    stim[2] = 8'hb1;
    stim[3] = 8'h41;
    stim[4] = 8'he7;
    stim[5] = 8'haa;
    stim[6] = 8'h14;
    stim[7] = 8'h73;
    stim[8] = 8'hf1;
    stim[9] = 8'h06;
    stim[10] = 8'hcf;
    stim[11] = 8'hfd;
    stim[12] = 8'hdb;
    stim[13] = 8'hf8;
    stim[14] = 8'hca;
    stim[15] = 8'h9f;
    stim[16] = 8'h39;
    stim[17] = 8'h5b;
    stim[18] = 8'h6c;
    stim[19] = 8'hb6;
    stim[20] = 8'h69;
    stim[21] = 8'h38;
    stim[22] = 8'hf0;
    stim[23] = 8'h26;
    stim[24] = 8'hd1;
    stim[25] = 8'h45;
    stim[26] = 8'he7;
    stim[27] = 8'ha7;
    stim[28] = 8'h91;
    stim[29] = 8'h07;
    stim[30] = 8'h14;
    stim[31] = 8'hf5;
    stim[32] = 8'h36;
    stim[33] = 8'hcc;
    stim[34] = 8'h79;
    stim[35] = 8'h17;
    stim[36] = 8'h34;
    stim[37] = 8'h2d;
    stim[38] = 8'h35;
    stim[39] = 8'h68;
    stim[40] = 8'he1;
    stim[41] = 8'h3a;
    stim[42] = 8'he0;
    stim[43] = 8'h50;
    stim[44] = 8'hea;
    stim[45] = 8'h52;
    stim[46] = 8'h01;
    stim[47] = 8'hdd;
    stim[48] = 8'h78;
    stim[49] = 8'hd7;
    stim[50] = 8'h50;
    stim[51] = 8'h21;
    stim[52] = 8'h9c;
    stim[53] = 8'h0c;
    stim[54] = 8'h5d;
    stim[55] = 8'h75;
    stim[56] = 8'h92;
    stim[57] = 8'hb9;
    stim[58] = 8'h73;
    stim[59] = 8'h41;
    stim[60] = 8'h95;
    stim[61] = 8'h8a;
    stim[62] = 8'h60;
    stim[63] = 8'h5c;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'h6;
      expv[4] = 4'hx;
      expv[5] = 4'h7;
      expv[6] = 4'h2;
      expv[7] = 4'h6;
      expv[8] = 4'hx;
      expv[9] = 4'h2;
      expv[10] = 4'hx;
      expv[11] = 4'hx;
      expv[12] = 4'hx;
      expv[13] = 4'hx;
      expv[14] = 4'hx;
      expv[15] = 4'hx;
      expv[16] = 4'h2;
      expv[17] = 4'h6;
      expv[18] = 4'h6;
      expv[19] = 4'hx;
      expv[20] = 4'h6;
      expv[21] = 4'h2;
      expv[22] = 4'hx;
      expv[23] = 4'h2;
      expv[24] = 4'hx;
      expv[25] = 4'h6;
      expv[26] = 4'hx;
      expv[27] = 4'hx;
      expv[28] = 4'hx;
      expv[29] = 4'h2;
      expv[30] = 4'h2;
      expv[31] = 4'hx;
      expv[32] = 4'h2;
      expv[33] = 4'hx;
      expv[34] = 4'h6;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h2;
      expv[39] = 4'h6;
      expv[40] = 4'hx;
      expv[41] = 4'h2;
      expv[42] = 4'hx;
      expv[43] = 4'h6;
      expv[44] = 4'hx;
      expv[45] = 4'h6;
      expv[46] = 4'h2;
      expv[47] = 4'hx;
      expv[48] = 4'h6;
      expv[49] = 4'hx;
      expv[50] = 4'h6;
      expv[51] = 4'h2;
      expv[52] = 4'hx;
      expv[53] = 4'h2;
      expv[54] = 4'h6;
      expv[55] = 4'h6;
      expv[56] = 4'hb;
      expv[57] = 4'hx;
      expv[58] = 4'h6;
      expv[59] = 4'h6;
      expv[60] = 4'hx;
      expv[61] = 4'hx;
      expv[62] = 4'h6;
      expv[63] = 4'h6;
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
