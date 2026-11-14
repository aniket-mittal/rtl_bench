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

  dut dut (
    .clk(clk),
    .in(in_vec[7:0]),
    .anyedge(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h3f;
    stim[1] = 8'hec;
    stim[2] = 8'hbf;
    stim[3] = 8'ha6;
    stim[4] = 8'h75;
    stim[5] = 8'h67;
    stim[6] = 8'hd9;
    stim[7] = 8'h8b;
    stim[8] = 8'h2c;
    stim[9] = 8'h26;
    stim[10] = 8'h79;
    stim[11] = 8'h1a;
    stim[12] = 8'h92;
    stim[13] = 8'hbc;
    stim[14] = 8'he0;
    stim[15] = 8'h3a;
    stim[16] = 8'h2f;
    stim[17] = 8'hc4;
    stim[18] = 8'hf4;
    stim[19] = 8'h60;
    stim[20] = 8'h09;
    stim[21] = 8'ha2;
    stim[22] = 8'h11;
    stim[23] = 8'h89;
    stim[24] = 8'h95;
    stim[25] = 8'hea;
    stim[26] = 8'h53;
    stim[27] = 8'h84;
    stim[28] = 8'h43;
    stim[29] = 8'h9f;
    stim[30] = 8'h38;
    stim[31] = 8'h33;
    stim[32] = 8'h76;
    stim[33] = 8'hab;
    stim[34] = 8'h76;
    stim[35] = 8'h3a;
    stim[36] = 8'h66;
    stim[37] = 8'h58;
    stim[38] = 8'ha7;
    stim[39] = 8'h60;
    stim[40] = 8'h36;
    stim[41] = 8'hb4;
    stim[42] = 8'hde;
    stim[43] = 8'ha5;
    stim[44] = 8'h9f;
    stim[45] = 8'h39;
    stim[46] = 8'hf4;
    stim[47] = 8'hd4;
    stim[48] = 8'h1c;
    stim[49] = 8'h04;
    stim[50] = 8'h3e;
    stim[51] = 8'h22;
    stim[52] = 8'hb3;
    stim[53] = 8'h80;
    stim[54] = 8'h59;
    stim[55] = 8'hcc;
    stim[56] = 8'h27;
    stim[57] = 8'h33;
    stim[58] = 8'he9;
    stim[59] = 8'h27;
    stim[60] = 8'haa;
    stim[61] = 8'hd7;
    stim[62] = 8'h04;
    stim[63] = 8'h01;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
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
