// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006969 dut (
    .OpCode(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .PCSrc(out_vec[17:16]),
    .Branch(out_vec[15:15]),
    .RegWrite(out_vec[14:14]),
    .RegDst(out_vec[13:12]),
    .MemRead(out_vec[11:11]),
    .MemWrite(out_vec[10:10]),
    .MemtoReg(out_vec[9:8]),
    .ALUSrc1(out_vec[7:7]),
    .ALUSrc2(out_vec[6:6]),
    .ExtOp(out_vec[5:5]),
    .LuOp(out_vec[4:4]),
    .ALUOp(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h1f8;
    stim[1] = 12'h470;
    stim[2] = 12'hd68;
    stim[3] = 12'he7c;
    stim[4] = 12'h18d;
    stim[5] = 12'h8c6;
    stim[6] = 12'h73b;
    stim[7] = 12'h2d6;
    stim[8] = 12'h45a;
    stim[9] = 12'hf9b;
    stim[10] = 12'h6ba;
    stim[11] = 12'h690;
    stim[12] = 12'h669;
    stim[13] = 12'h1a3;
    stim[14] = 12'h83e;
    stim[15] = 12'hacd;
    stim[16] = 12'h77a;
    stim[17] = 12'h0b5;
    stim[18] = 12'h68d;
    stim[19] = 12'had0;
    stim[20] = 12'h7ac;
    stim[21] = 12'h2b1;
    stim[22] = 12'hb0a;
    stim[23] = 12'hfc8;
    stim[24] = 12'hd6f;
    stim[25] = 12'hcd2;
    stim[26] = 12'hf8c;
    stim[27] = 12'h556;
    stim[28] = 12'h003;
    stim[29] = 12'hb72;
    stim[30] = 12'hfc3;
    stim[31] = 12'hece;
    stim[32] = 12'hf00;
    stim[33] = 12'h6b3;
    stim[34] = 12'hd02;
    stim[35] = 12'hcca;
    stim[36] = 12'h91c;
    stim[37] = 12'h5db;
    stim[38] = 12'h08d;
    stim[39] = 12'h910;
    stim[40] = 12'h223;
    stim[41] = 12'hd0c;
    stim[42] = 12'h448;
    stim[43] = 12'hb66;
    stim[44] = 12'ha26;
    stim[45] = 12'he1f;
    stim[46] = 12'haf1;
    stim[47] = 12'h54d;
    stim[48] = 12'ha15;
    stim[49] = 12'h8c2;
    stim[50] = 12'hb8b;
    stim[51] = 12'h85f;
    stim[52] = 12'hae9;
    stim[53] = 12'he58;
    stim[54] = 12'hddc;
    stim[55] = 12'h117;
    stim[56] = 12'h19b;
    stim[57] = 12'hbbf;
    stim[58] = 12'h6f8;
    stim[59] = 12'h890;
    stim[60] = 12'h704;
    stim[61] = 12'h83e;
    stim[62] = 12'h615;
    stim[63] = 12'hcba;
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
      expv[0] = 18'h04068;
      expv[1] = 18'h04068;
      expv[2] = 18'h04068;
      expv[3] = 18'h04068;
      expv[4] = 18'h04060;
      expv[5] = 18'h04968;
      expv[6] = 18'h04060;
      expv[7] = 18'h0406d;
      expv[8] = 18'h04068;
      expv[9] = 18'h04060;
      expv[10] = 18'h04060;
      expv[11] = 18'h04060;
      expv[12] = 18'h04068;
      expv[13] = 18'h04060;
      expv[14] = 18'h04060;
      expv[15] = 18'h01468;
      expv[16] = 18'h04068;
      expv[17] = 18'h12200;
      expv[18] = 18'h04060;
      expv[19] = 18'h01468;
      expv[20] = 18'h04060;
      expv[21] = 18'h04065;
      expv[22] = 18'h04060;
      expv[23] = 18'h04068;
      expv[24] = 18'h04068;
      expv[25] = 18'h04068;
      expv[26] = 18'h04060;
      expv[27] = 18'h04068;
      expv[28] = 18'h05082;
      expv[29] = 18'h04068;
      expv[30] = 18'h04068;
      expv[31] = 18'h04068;
      expv[32] = 18'h04060;
      expv[33] = 18'h04060;
      expv[34] = 18'h04060;
      expv[35] = 18'h04068;
      expv[36] = 18'h04060;
      expv[37] = 18'h04068;
      expv[38] = 18'h12200;
      expv[39] = 18'h04060;
      expv[40] = 18'h04060;
      expv[41] = 18'h04060;
      expv[42] = 18'h04068;
      expv[43] = 18'h04068;
      expv[44] = 18'h04060;
      expv[45] = 18'h04060;
      expv[46] = 18'h01468;
      expv[47] = 18'h04068;
      expv[48] = 18'h04060;
      expv[49] = 18'h04968;
      expv[50] = 18'h04060;
      expv[51] = 18'h04068;
      expv[52] = 18'h01468;
      expv[53] = 18'h04068;
      expv[54] = 18'h04068;
      expv[55] = 18'h09001;
      expv[56] = 18'h04060;
      expv[57] = 18'h04060;
      expv[58] = 18'h04068;
      expv[59] = 18'h04060;
      expv[60] = 18'h04060;
      expv[61] = 18'h04060;
      expv[62] = 18'h04060;
      expv[63] = 18'h04060;
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
