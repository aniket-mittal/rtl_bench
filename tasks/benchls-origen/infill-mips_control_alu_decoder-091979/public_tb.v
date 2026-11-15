// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091979 dut (
    .Op(in_vec[11:6]),
    .Funct(in_vec[5:0]),
    .MemtoReg(out_vec[8:8]),
    .MemWrite(out_vec[7:7]),
    .Branch(out_vec[6:6]),
    .ALUSrc(out_vec[5:5]),
    .RegDst(out_vec[4:4]),
    .RegWrite(out_vec[3:3]),
    .ALUControl(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h6d7;
    stim[1] = 12'hb66;
    stim[2] = 12'h82a;
    stim[3] = 12'hd68;
    stim[4] = 12'hf43;
    stim[5] = 12'h0d8;
    stim[6] = 12'hc0a;
    stim[7] = 12'h004;
    stim[8] = 12'h0d9;
    stim[9] = 12'h97a;
    stim[10] = 12'hb06;
    stim[11] = 12'h23c;
    stim[12] = 12'hd0c;
    stim[13] = 12'h403;
    stim[14] = 12'h7df;
    stim[15] = 12'ha51;
    stim[16] = 12'hfde;
    stim[17] = 12'he06;
    stim[18] = 12'h597;
    stim[19] = 12'h9c3;
    stim[20] = 12'h233;
    stim[21] = 12'hc3e;
    stim[22] = 12'h756;
    stim[23] = 12'he40;
    stim[24] = 12'h9c5;
    stim[25] = 12'h764;
    stim[26] = 12'hc9d;
    stim[27] = 12'hfa6;
    stim[28] = 12'h47a;
    stim[29] = 12'h3d7;
    stim[30] = 12'hdfe;
    stim[31] = 12'h358;
    stim[32] = 12'hbed;
    stim[33] = 12'h5a3;
    stim[34] = 12'ha6b;
    stim[35] = 12'h5ea;
    stim[36] = 12'h08d;
    stim[37] = 12'hded;
    stim[38] = 12'he6e;
    stim[39] = 12'hdb7;
    stim[40] = 12'h130;
    stim[41] = 12'hd0e;
    stim[42] = 12'ha0b;
    stim[43] = 12'h3fa;
    stim[44] = 12'hf12;
    stim[45] = 12'hb00;
    stim[46] = 12'h1d8;
    stim[47] = 12'h892;
    stim[48] = 12'h816;
    stim[49] = 12'hc7b;
    stim[50] = 12'haa2;
    stim[51] = 12'h304;
    stim[52] = 12'hc8b;
    stim[53] = 12'he0b;
    stim[54] = 12'h751;
    stim[55] = 12'h160;
    stim[56] = 12'h37f;
    stim[57] = 12'h6a8;
    stim[58] = 12'h22f;
    stim[59] = 12'hc33;
    stim[60] = 12'h081;
    stim[61] = 12'h3e8;
    stim[62] = 12'hf8f;
    stim[63] = 12'h914;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'hxxx;
      expv[3] = 9'hxxx;
      expv[4] = 9'hxxx;
      expv[5] = 9'hxxx;
      expv[6] = 9'hxxx;
      expv[7] = 9'h01x;
      expv[8] = 9'hxxx;
      expv[9] = 9'hxxx;
      expv[10] = 9'hxxx;
      expv[11] = 9'h02a;
      expv[12] = 9'hxxx;
      expv[13] = 9'hxxx;
      expv[14] = 9'hxxx;
      expv[15] = 9'hxxx;
      expv[16] = 9'hxxx;
      expv[17] = 9'hxxx;
      expv[18] = 9'hxxx;
      expv[19] = 9'hxxx;
      expv[20] = 9'h02a;
      expv[21] = 9'hxxx;
      expv[22] = 9'hxxx;
      expv[23] = 9'hxxx;
      expv[24] = 9'hxxx;
      expv[25] = 9'hxxx;
      expv[26] = 9'hxxx;
      expv[27] = 9'hxxx;
      expv[28] = 9'hxxx;
      expv[29] = 9'hxxx;
      expv[30] = 9'hxxx;
      expv[31] = 9'hxxx;
      expv[32] = 9'hxxx;
      expv[33] = 9'hxxx;
      expv[34] = 9'hxxx;
      expv[35] = 9'hxxx;
      expv[36] = 9'hxxx;
      expv[37] = 9'hxxx;
      expv[38] = 9'hxxx;
      expv[39] = 9'hxxx;
      expv[40] = 9'hxx6;
      expv[41] = 9'hxxx;
      expv[42] = 9'hxxx;
      expv[43] = 9'hxxx;
      expv[44] = 9'hxxx;
      expv[45] = 9'hxxx;
      expv[46] = 9'hxxx;
      expv[47] = 9'hxxx;
      expv[48] = 9'hxxx;
      expv[49] = 9'hxxx;
      expv[50] = 9'hxxx;
      expv[51] = 9'hxxx;
      expv[52] = 9'hxxx;
      expv[53] = 9'hxxx;
      expv[54] = 9'hxxx;
      expv[55] = 9'hxxx;
      expv[56] = 9'hxxx;
      expv[57] = 9'hxxx;
      expv[58] = 9'h02a;
      expv[59] = 9'hxxx;
      expv[60] = 9'hxxx;
      expv[61] = 9'hxxx;
      expv[62] = 9'hxxx;
      expv[63] = 9'hxxx;
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
