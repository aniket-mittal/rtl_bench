// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 108;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_096374 dut (
    .clk_2(clk),
    .SWI(in_vec[7:0]),
    .LED(out_vec[107:100]),
    .SEG(out_vec[99:92]),
    .lcd_a(out_vec[91:84]),
    .lcd_b(out_vec[83:76]),
    .lcd_instruction(out_vec[75:68]),
    .lcd_registrador(out_vec[67:60]),
    .lcd_pc(out_vec[59:52]),
    .lcd_SrcA(out_vec[51:44]),
    .lcd_SrcB(out_vec[43:36]),
    .lcd_ALUResult(out_vec[35:28]),
    .lcd_Result(out_vec[27:20]),
    .lcd_WriteData(out_vec[19:12]),
    .lcd_ReadData(out_vec[11:4]),
    .lcd_MemWrite(out_vec[3:3]),
    .lcd_Branch(out_vec[2:2]),
    .lcd_MemtoReg(out_vec[1:1]),
    .lcd_RegWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hed;
    stim[1] = 8'h26;
    stim[2] = 8'h63;
    stim[3] = 8'h30;
    stim[4] = 8'he1;
    stim[5] = 8'h1b;
    stim[6] = 8'haa;
    stim[7] = 8'h8d;
    stim[8] = 8'h5e;
    stim[9] = 8'h0f;
    stim[10] = 8'hf5;
    stim[11] = 8'h26;
    stim[12] = 8'h4d;
    stim[13] = 8'h84;
    stim[14] = 8'h59;
    stim[15] = 8'hdc;
    stim[16] = 8'hb1;
    stim[17] = 8'hfa;
    stim[18] = 8'h96;
    stim[19] = 8'h1e;
    stim[20] = 8'ha3;
    stim[21] = 8'h27;
    stim[22] = 8'he9;
    stim[23] = 8'h02;
    stim[24] = 8'h05;
    stim[25] = 8'h67;
    stim[26] = 8'hdc;
    stim[27] = 8'hb9;
    stim[28] = 8'h72;
    stim[29] = 8'h62;
    stim[30] = 8'h45;
    stim[31] = 8'hdb;
    stim[32] = 8'he4;
    stim[33] = 8'h56;
    stim[34] = 8'h6f;
    stim[35] = 8'hee;
    stim[36] = 8'h02;
    stim[37] = 8'he7;
    stim[38] = 8'hba;
    stim[39] = 8'h38;
    stim[40] = 8'h45;
    stim[41] = 8'h7d;
    stim[42] = 8'heb;
    stim[43] = 8'hdd;
    stim[44] = 8'he2;
    stim[45] = 8'hd7;
    stim[46] = 8'h1d;
    stim[47] = 8'h6e;
    stim[48] = 8'h92;
    stim[49] = 8'h8f;
    stim[50] = 8'h1f;
    stim[51] = 8'ha7;
    stim[52] = 8'h70;
    stim[53] = 8'h97;
    stim[54] = 8'h66;
    stim[55] = 8'hbf;
    stim[56] = 8'hfd;
    stim[57] = 8'ha8;
    stim[58] = 8'h67;
    stim[59] = 8'h4e;
    stim[60] = 8'h08;
    stim[61] = 8'h44;
    stim[62] = 8'hcb;
    stim[63] = 8'hb2;
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
      expv[0] = 108'h0x0000000000000000000000000;
      expv[1] = 108'h0x0000000000000000000000000;
      expv[2] = 108'h0x0000000000000000000000000;
      expv[3] = 108'h0x0000000000000000000000000;
      expv[4] = 108'h0x0000000000000000000000000;
      expv[5] = 108'h0x0000000000000000000000000;
      expv[6] = 108'h8x0000000000000000000000000;
      expv[7] = 108'h0x0000000000000000000000000;
      expv[8] = 108'h0x0000000000000000000000000;
      expv[9] = 108'h0x0000000000000000000000000;
      expv[10] = 108'h0x0000000000000000000000000;
      expv[11] = 108'h0x0000000000000000000000000;
      expv[12] = 108'h0x0000000000000000000000000;
      expv[13] = 108'h0x0000000000000000000000000;
      expv[14] = 108'h0x0000000000000000000000000;
      expv[15] = 108'h0x0000000000000000000000000;
      expv[16] = 108'h0x0000000000000000000000000;
      expv[17] = 108'h0x0000000000000000000000000;
      expv[18] = 108'h0x0000000000000000000000000;
      expv[19] = 108'h8x0000000000000000000000000;
      expv[20] = 108'h0x0000000000000000000000000;
      expv[21] = 108'h8x0000000000000000000000000;
      expv[22] = 108'h0x0000000000000000000000000;
      expv[23] = 108'h0x0000000000000000000000000;
      expv[24] = 108'h8x0000000000000000000000000;
      expv[25] = 108'h0x0000000000000000000000000;
      expv[26] = 108'h0x0000000000000000000000000;
      expv[27] = 108'h0x0000000000000000000000000;
      expv[28] = 108'h0x0000000000000000000000000;
      expv[29] = 108'h0x0000000000000000000000000;
      expv[30] = 108'h0x0000000000000000000000000;
      expv[31] = 108'h0x0000000000000000000000000;
      expv[32] = 108'h0x0000000000000000000000000;
      expv[33] = 108'h0x0000000000000000000000000;
      expv[34] = 108'h0x0000000000000000000000000;
      expv[35] = 108'h0x0000000000000000000000000;
      expv[36] = 108'h0x0000000000000000000000000;
      expv[37] = 108'h0x0000000000000000000000000;
      expv[38] = 108'h0x0000000000000000000000000;
      expv[39] = 108'h8x0000000000000000000000000;
      expv[40] = 108'h0x0000000000000000000000000;
      expv[41] = 108'h0x0000000000000000000000000;
      expv[42] = 108'h0x0000000000000000000000000;
      expv[43] = 108'h0x0000000000000000000000000;
      expv[44] = 108'h0x0000000000000000000000000;
      expv[45] = 108'h0x0000000000000000000000000;
      expv[46] = 108'h0x0000000000000000000000000;
      expv[47] = 108'h0x0000000000000000000000000;
      expv[48] = 108'h0x0000000000000000000000000;
      expv[49] = 108'h8x0000000000000000000000000;
      expv[50] = 108'h0x0000000000000000000000000;
      expv[51] = 108'h8x0000000000000000000000000;
      expv[52] = 108'h0x0000000000000000000000000;
      expv[53] = 108'h0x0000000000000000000000000;
      expv[54] = 108'h0x0000000000000000000000000;
      expv[55] = 108'h0x0000000000000000000000000;
      expv[56] = 108'h0x0000000000000000000000000;
      expv[57] = 108'h0x0000000000000000000000000;
      expv[58] = 108'h0x0000000000000000000000000;
      expv[59] = 108'h0x0000000000000000000000000;
      expv[60] = 108'h0x0000000000000000000000000;
      expv[61] = 108'h0x0000000000000000000000000;
      expv[62] = 108'h0x0000000000000000000000000;
      expv[63] = 108'h0x0000000000000000000000000;
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
