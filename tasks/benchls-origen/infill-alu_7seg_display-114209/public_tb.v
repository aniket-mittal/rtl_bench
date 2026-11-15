// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_114209 dut (
    .clk_2(clk),
    .SWI(in_vec[7:0]),
    .LED(out_vec[47:40]),
    .SEG(out_vec[39:32]),
    .LCD_RS(out_vec[31:24]),
    .LCD_RW(out_vec[23:16]),
    .LCD_E(out_vec[15:8]),
    .LCD_DB(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h45;
    stim[1] = 8'h66;
    stim[2] = 8'h10;
    stim[3] = 8'h81;
    stim[4] = 8'h79;
    stim[5] = 8'h88;
    stim[6] = 8'hb9;
    stim[7] = 8'h5f;
    stim[8] = 8'h28;
    stim[9] = 8'hb6;
    stim[10] = 8'hb4;
    stim[11] = 8'hc7;
    stim[12] = 8'ha9;
    stim[13] = 8'h26;
    stim[14] = 8'he6;
    stim[15] = 8'h66;
    stim[16] = 8'hd3;
    stim[17] = 8'h8d;
    stim[18] = 8'hf7;
    stim[19] = 8'h81;
    stim[20] = 8'h7b;
    stim[21] = 8'h77;
    stim[22] = 8'h55;
    stim[23] = 8'h63;
    stim[24] = 8'h21;
    stim[25] = 8'hca;
    stim[26] = 8'hfe;
    stim[27] = 8'hcb;
    stim[28] = 8'h8e;
    stim[29] = 8'hcb;
    stim[30] = 8'h25;
    stim[31] = 8'h79;
    stim[32] = 8'h99;
    stim[33] = 8'h66;
    stim[34] = 8'h18;
    stim[35] = 8'h22;
    stim[36] = 8'he4;
    stim[37] = 8'h48;
    stim[38] = 8'h3f;
    stim[39] = 8'h3d;
    stim[40] = 8'hc9;
    stim[41] = 8'h3e;
    stim[42] = 8'h01;
    stim[43] = 8'hb4;
    stim[44] = 8'hfc;
    stim[45] = 8'hd5;
    stim[46] = 8'h6f;
    stim[47] = 8'h13;
    stim[48] = 8'hf1;
    stim[49] = 8'h64;
    stim[50] = 8'hb5;
    stim[51] = 8'h79;
    stim[52] = 8'h77;
    stim[53] = 8'h50;
    stim[54] = 8'hb9;
    stim[55] = 8'hbd;
    stim[56] = 8'h3b;
    stim[57] = 8'h95;
    stim[58] = 8'h32;
    stim[59] = 8'h85;
    stim[60] = 8'h43;
    stim[61] = 8'h7b;
    stim[62] = 8'h42;
    stim[63] = 8'h33;
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
      expv[0] = 48'h8979aa55cc09;
      expv[1] = 48'h8c19aa55cc0c;
      expv[2] = 48'h0179aa55cc01;
      expv[3] = 48'h0179aa55cc01;
      expv[4] = 48'h8682aa55cc06;
      expv[5] = 48'h0040aa55cc00;
      expv[6] = 48'h0c99aa55cc0c;
      expv[7] = 48'h8e02aa55cc0e;
      expv[8] = 48'h0224aa55cc02;
      expv[9] = 48'h83b0aa55cc03;
      expv[10] = 48'h01f9aa55cc01;
      expv[11] = 48'h83b0aa55cc03;
      expv[12] = 48'h0d92aa55cc0d;
      expv[13] = 48'h8840aa55cc08;
      expv[14] = 48'h80c0aa55cc00;
      expv[15] = 48'h8c19aa55cc0c;
      expv[16] = 48'h8e02aa55cc0e;
      expv[17] = 48'h0b30aa55cc0b;
      expv[18] = 48'h80c0aa55cc00;
      expv[19] = 48'h0179aa55cc01;
      expv[20] = 48'h8499aa55cc04;
      expv[21] = 48'h8e02aa55cc0e;
      expv[22] = 48'h8a24aa55cc0a;
      expv[23] = 48'h8979aa55cc09;
      expv[24] = 48'h0330aa55cc03;
      expv[25] = 48'h0aa4aa55cc0a;
      expv[26] = 48'h83b0aa55cc03;
      expv[27] = 48'h09f9aa55cc09;
      expv[28] = 48'h0a24aa55cc0a;
      expv[29] = 48'h09f9aa55cc09;
      expv[30] = 48'h0778aa55cc07;
      expv[31] = 48'h8682aa55cc06;
      expv[32] = 48'h0e82aa55cc0e;
      expv[33] = 48'h8c19aa55cc0c;
      expv[34] = 48'h0179aa55cc01;
      expv[35] = 48'h0419aa55cc04;
      expv[36] = 48'h8e02aa55cc0e;
      expv[37] = 48'h0419aa55cc04;
      expv[38] = 48'h8c19aa55cc0c;
      expv[39] = 48'h8e02aa55cc0e;
      expv[40] = 48'h0bb0aa55cc0b;
      expv[41] = 48'h8d12aa55cc0d;
      expv[42] = 48'h0179aa55cc01;
      expv[43] = 48'h01f9aa55cc01;
      expv[44] = 48'h8592aa55cc05;
      expv[45] = 48'h80c0aa55cc00;
      expv[46] = 48'h8f78aa55cc0f;
      expv[47] = 48'h0419aa55cc04;
      expv[48] = 48'h8a24aa55cc0a;
      expv[49] = 48'h8a24aa55cc0a;
      expv[50] = 48'h82a4aa55cc02;
      expv[51] = 48'h8682aa55cc06;
      expv[52] = 48'h8e02aa55cc0e;
      expv[53] = 48'h0512aa55cc05;
      expv[54] = 48'h0c99aa55cc0c;
      expv[55] = 48'h88c0aa55cc08;
      expv[56] = 48'h00c0aa55cc00;
      expv[57] = 48'h0499aa55cc04;
      expv[58] = 48'h0512aa55cc05;
      expv[59] = 48'h0512aa55cc05;
      expv[60] = 48'h0778aa55cc07;
      expv[61] = 48'h8499aa55cc04;
      expv[62] = 48'h0602aa55cc06;
      expv[63] = 48'h0602aa55cc06;
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
