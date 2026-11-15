// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011883 dut (
    .INPUT1(in_vec[18:11]),
    .INPUT2(in_vec[10:3]),
    .SELECT(in_vec[2:0]),
    .OUTPUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h2e9f3;
    stim[1] = 19'h216a3;
    stim[2] = 19'h29e80;
    stim[3] = 19'h5b670;
    stim[4] = 19'h20b62;
    stim[5] = 19'h23e6a;
    stim[6] = 19'h35677;
    stim[7] = 19'h2e047;
    stim[8] = 19'h5f475;
    stim[9] = 19'h39dec;
    stim[10] = 19'h39e46;
    stim[11] = 19'h57e8b;
    stim[12] = 19'h0b05b;
    stim[13] = 19'h1c887;
    stim[14] = 19'h34732;
    stim[15] = 19'h0c9f9;
    stim[16] = 19'h04d9a;
    stim[17] = 19'h02db8;
    stim[18] = 19'h331af;
    stim[19] = 19'h1f345;
    stim[20] = 19'h73d85;
    stim[21] = 19'h15f80;
    stim[22] = 19'h29006;
    stim[23] = 19'h1dfae;
    stim[24] = 19'h7ae7f;
    stim[25] = 19'h27dba;
    stim[26] = 19'h2be93;
    stim[27] = 19'h103b5;
    stim[28] = 19'h5a8d3;
    stim[29] = 19'h118ca;
    stim[30] = 19'h0dc9a;
    stim[31] = 19'h55eef;
    stim[32] = 19'h74494;
    stim[33] = 19'h551fc;
    stim[34] = 19'h680e8;
    stim[35] = 19'h4ec31;
    stim[36] = 19'h57d10;
    stim[37] = 19'h336d2;
    stim[38] = 19'h32e29;
    stim[39] = 19'h474c3;
    stim[40] = 19'h5d9bc;
    stim[41] = 19'h27239;
    stim[42] = 19'h1453b;
    stim[43] = 19'h3bdcb;
    stim[44] = 19'h5ed95;
    stim[45] = 19'h0d7e7;
    stim[46] = 19'h79fbb;
    stim[47] = 19'h5d96e;
    stim[48] = 19'h43281;
    stim[49] = 19'h6e115;
    stim[50] = 19'h7454f;
    stim[51] = 19'h5a3cc;
    stim[52] = 19'h03537;
    stim[53] = 19'h37076;
    stim[54] = 19'h000d5;
    stim[55] = 19'h3fc11;
    stim[56] = 19'h5454d;
    stim[57] = 19'h21d30;
    stim[58] = 19'h1fa0e;
    stim[59] = 19'h63c34;
    stim[60] = 19'h641f0;
    stim[61] = 19'h095a1;
    stim[62] = 19'h54127;
    stim[63] = 19'h2c21e;
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
      expv[0] = 8'h7f;
      expv[1] = 8'hd6;
      expv[2] = 8'h53;
      expv[3] = 8'hb6;
      expv[4] = 8'h40;
      expv[5] = 8'h45;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'hff;
      expv[12] = 8'h1f;
      expv[13] = 8'h00;
      expv[14] = 8'h60;
      expv[15] = 8'h58;
      expv[16] = 8'h01;
      expv[17] = 8'h05;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h2b;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h07;
      expv[26] = 8'hd7;
      expv[27] = 8'h00;
      expv[28] = 8'hbf;
      expv[29] = 8'h01;
      expv[30] = 8'h13;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'hd0;
      expv[35] = 8'h23;
      expv[36] = 8'haf;
      expv[37] = 8'h42;
      expv[38] = 8'h2a;
      expv[39] = 8'h9e;
      expv[40] = 8'h00;
      expv[41] = 8'h95;
      expv[42] = 8'haf;
      expv[43] = 8'hff;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'hf7;
      expv[47] = 8'h00;
      expv[48] = 8'hd6;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h01;
      expv[56] = 8'h00;
      expv[57] = 8'h43;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'hc8;
      expv[61] = 8'hc6;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
