// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116433 dut (
    .a(in_vec[19:12]),
    .b(in_vec[11:4]),
    .op(in_vec[3:0]),
    .out(out_vec[8:1]),
    .carry(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h7876f;
    stim[1] = 20'h57110;
    stim[2] = 20'h78669;
    stim[3] = 20'h91b2f;
    stim[4] = 20'hc7b37;
    stim[5] = 20'h4ec03;
    stim[6] = 20'hb2246;
    stim[7] = 20'h56501;
    stim[8] = 20'h16b99;
    stim[9] = 20'ha922b;
    stim[10] = 20'hf6acb;
    stim[11] = 20'hf51a0;
    stim[12] = 20'ha2313;
    stim[13] = 20'h75c3c;
    stim[14] = 20'h64c20;
    stim[15] = 20'h792b5;
    stim[16] = 20'h71d2a;
    stim[17] = 20'h93825;
    stim[18] = 20'hb4825;
    stim[19] = 20'h2d436;
    stim[20] = 20'h2de1c;
    stim[21] = 20'h09f6c;
    stim[22] = 20'h04da6;
    stim[23] = 20'h7e4e2;
    stim[24] = 20'h77c9d;
    stim[25] = 20'hf9245;
    stim[26] = 20'h11b4d;
    stim[27] = 20'ha44db;
    stim[28] = 20'hda468;
    stim[29] = 20'h15c52;
    stim[30] = 20'h68d9e;
    stim[31] = 20'hf2275;
    stim[32] = 20'h5f117;
    stim[33] = 20'h091cd;
    stim[34] = 20'hb7e47;
    stim[35] = 20'h7a4b0;
    stim[36] = 20'h44ed9;
    stim[37] = 20'hc8bd2;
    stim[38] = 20'h28fbd;
    stim[39] = 20'h32fed;
    stim[40] = 20'h8ebaa;
    stim[41] = 20'h2a074;
    stim[42] = 20'hb6278;
    stim[43] = 20'h0abee;
    stim[44] = 20'hdec36;
    stim[45] = 20'hee56d;
    stim[46] = 20'he23fa;
    stim[47] = 20'h194e5;
    stim[48] = 20'hc59db;
    stim[49] = 20'h22d58;
    stim[50] = 20'hea9da;
    stim[51] = 20'h853c5;
    stim[52] = 20'he0dc5;
    stim[53] = 20'h70ada;
    stim[54] = 20'h3aeb6;
    stim[55] = 20'h26290;
    stim[56] = 20'hdc904;
    stim[57] = 20'hf05ab;
    stim[58] = 20'h8d32b;
    stim[59] = 20'hb6f78;
    stim[60] = 20'h892d0;
    stim[61] = 20'h5c44f;
    stim[62] = 20'hb3a76;
    stim[63] = 20'h86612;
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
      expv[0] = 9'h000;
      expv[1] = 9'h0d0;
      expv[2] = 9'h0fc;
      expv[3] = 9'h000;
      expv[4] = 9'h1c6;
      expv[5] = 9'h000;
      expv[6] = 9'h0ca;
      expv[7] = 9'h00c;
      expv[8] = 9'h17e;
      expv[9] = 9'h0a8;
      expv[10] = 9'h002;
      expv[11] = 9'h01f;
      expv[12] = 9'h006;
      expv[13] = 9'h17c;
      expv[14] = 9'h04d;
      expv[15] = 9'h078;
      expv[16] = 9'h146;
      expv[17] = 9'h092;
      expv[18] = 9'h0b4;
      expv[19] = 9'h0b4;
      expv[20] = 9'h1bc;
      expv[21] = 9'h1fe;
      expv[22] = 9'h010;
      expv[23] = 9'h0c8;
      expv[24] = 9'h082;
      expv[25] = 9'h0f8;
      expv[26] = 9'h0b4;
      expv[27] = 9'h024;
      expv[28] = 9'h084;
      expv[29] = 9'h052;
      expv[30] = 9'h000;
      expv[31] = 9'h0f2;
      expv[32] = 9'h15e;
      expv[33] = 9'h1d4;
      expv[34] = 9'h1b6;
      expv[35] = 9'h18a;
      expv[36] = 9'h1da;
      expv[37] = 9'h150;
      expv[38] = 9'h058;
      expv[39] = 9'h066;
      expv[40] = 9'h068;
      expv[41] = 9'h0a8;
      expv[42] = 9'h04c;
      expv[43] = 9'h000;
      expv[44] = 9'h17a;
      expv[45] = 9'h08e;
      expv[46] = 9'h1ba;
      expv[47] = 9'h018;
      expv[48] = 9'h044;
      expv[49] = 9'h000;
      expv[50] = 9'h0ee;
      expv[51] = 9'h084;
      expv[52] = 9'h0e0;
      expv[53] = 9'h1ba;
      expv[54] = 9'h0e8;
      expv[55] = 9'h09e;
      expv[56] = 9'h170;
      expv[57] = 9'h00a;
      expv[58] = 9'h080;
      expv[59] = 9'h16c;
      expv[60] = 9'h16c;
      expv[61] = 9'h000;
      expv[62] = 9'h0ce;
      expv[63] = 9'h18c;
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
