// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_160826 dut (
    .opcode(in_vec[7:1]),
    .control_sel(in_vec[0:0]),
    .MemRead(out_vec[7:7]),
    .MemtoReg(out_vec[6:6]),
    .MemWrite(out_vec[5:5]),
    .RegWrite(out_vec[4:4]),
    .Branch(out_vec[3:3]),
    .ALUSrc(out_vec[2:2]),
    .ALUop(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h04;
    stim[1] = 8'h1f;
    stim[2] = 8'h0f;
    stim[3] = 8'hce;
    stim[4] = 8'h80;
    stim[5] = 8'h9a;
    stim[6] = 8'h56;
    stim[7] = 8'ha3;
    stim[8] = 8'h80;
    stim[9] = 8'h61;
    stim[10] = 8'h5f;
    stim[11] = 8'h26;
    stim[12] = 8'hda;
    stim[13] = 8'hf6;
    stim[14] = 8'h8a;
    stim[15] = 8'h9e;
    stim[16] = 8'had;
    stim[17] = 8'ha5;
    stim[18] = 8'h6c;
    stim[19] = 8'hc1;
    stim[20] = 8'h08;
    stim[21] = 8'h46;
    stim[22] = 8'h2c;
    stim[23] = 8'h8d;
    stim[24] = 8'hf3;
    stim[25] = 8'h5d;
    stim[26] = 8'h15;
    stim[27] = 8'hd7;
    stim[28] = 8'he7;
    stim[29] = 8'hf9;
    stim[30] = 8'h40;
    stim[31] = 8'h38;
    stim[32] = 8'h6f;
    stim[33] = 8'h11;
    stim[34] = 8'h8e;
    stim[35] = 8'h14;
    stim[36] = 8'h4d;
    stim[37] = 8'h0c;
    stim[38] = 8'h25;
    stim[39] = 8'h6c;
    stim[40] = 8'h93;
    stim[41] = 8'h5e;
    stim[42] = 8'h77;
    stim[43] = 8'h1f;
    stim[44] = 8'h07;
    stim[45] = 8'h6b;
    stim[46] = 8'h84;
    stim[47] = 8'h30;
    stim[48] = 8'h8a;
    stim[49] = 8'h45;
    stim[50] = 8'h5a;
    stim[51] = 8'hb4;
    stim[52] = 8'h89;
    stim[53] = 8'h99;
    stim[54] = 8'h73;
    stim[55] = 8'h82;
    stim[56] = 8'hfb;
    stim[57] = 8'hfb;
    stim[58] = 8'h9e;
    stim[59] = 8'hef;
    stim[60] = 8'hac;
    stim[61] = 8'h52;
    stim[62] = 8'h6d;
    stim[63] = 8'hb9;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'h00;
      expv[8] = 8'hxx;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h16;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'hxx;
      expv[19] = 8'h00;
      expv[20] = 8'hxx;
      expv[21] = 8'hx4;
      expv[22] = 8'hxx;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'h00;
      expv[37] = 8'hxx;
      expv[38] = 8'h00;
      expv[39] = 8'hxx;
      expv[40] = 8'h00;
      expv[41] = 8'hxx;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'h00;
      expv[50] = 8'hxx;
      expv[51] = 8'hxx;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'hxx;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'hxx;
      expv[59] = 8'h00;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
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
