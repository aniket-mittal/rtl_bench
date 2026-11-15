// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01458 dut (
    .clk(clk),
    .ctrl(in_vec[7:3]),
    .din(in_vec[2:1]),
    .sel(in_vec[0:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h01;
    stim[1] = 8'h93;
    stim[2] = 8'h17;
    stim[3] = 8'h0a;
    stim[4] = 8'h1c;
    stim[5] = 8'ha6;
    stim[6] = 8'h87;
    stim[7] = 8'hfd;
    stim[8] = 8'hba;
    stim[9] = 8'hb1;
    stim[10] = 8'he6;
    stim[11] = 8'h9f;
    stim[12] = 8'h80;
    stim[13] = 8'h8f;
    stim[14] = 8'hf7;
    stim[15] = 8'h70;
    stim[16] = 8'hc7;
    stim[17] = 8'h7a;
    stim[18] = 8'h97;
    stim[19] = 8'hea;
    stim[20] = 8'h2a;
    stim[21] = 8'had;
    stim[22] = 8'he2;
    stim[23] = 8'hfd;
    stim[24] = 8'h71;
    stim[25] = 8'ha9;
    stim[26] = 8'h8d;
    stim[27] = 8'h9c;
    stim[28] = 8'hae;
    stim[29] = 8'hf9;
    stim[30] = 8'he2;
    stim[31] = 8'hdb;
    stim[32] = 8'h57;
    stim[33] = 8'had;
    stim[34] = 8'h9d;
    stim[35] = 8'h11;
    stim[36] = 8'h53;
    stim[37] = 8'h71;
    stim[38] = 8'h81;
    stim[39] = 8'hca;
    stim[40] = 8'h05;
    stim[41] = 8'h4f;
    stim[42] = 8'hbc;
    stim[43] = 8'h9b;
    stim[44] = 8'h4f;
    stim[45] = 8'h12;
    stim[46] = 8'h92;
    stim[47] = 8'h4f;
    stim[48] = 8'hd4;
    stim[49] = 8'ha8;
    stim[50] = 8'h07;
    stim[51] = 8'h09;
    stim[52] = 8'ha6;
    stim[53] = 8'hf9;
    stim[54] = 8'h39;
    stim[55] = 8'h8d;
    stim[56] = 8'hd3;
    stim[57] = 8'hb3;
    stim[58] = 8'hfa;
    stim[59] = 8'hf8;
    stim[60] = 8'h81;
    stim[61] = 8'hb5;
    stim[62] = 8'h70;
    stim[63] = 8'hf1;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00040000;
      expv[3] = 32'h0000000c;
      expv[4] = 32'h00000001;
      expv[5] = 32'h00000002;
      expv[6] = 32'h00000003;
      expv[7] = 32'h00030003;
      expv[8] = 32'h00030003;
      expv[9] = 32'h00000001;
      expv[10] = 32'h00000001;
      expv[11] = 32'h00000003;
      expv[12] = 32'h00180003;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00060000;
      expv[15] = 32'hc0060000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h03000000;
      expv[18] = 32'h00000001;
      expv[19] = 32'h000c0001;
      expv[20] = 32'h00000001;
      expv[21] = 32'h00000001;
      expv[22] = 32'h00400001;
      expv[23] = 32'h00000001;
      expv[24] = 32'h00000001;
      expv[25] = 32'h00000001;
      expv[26] = 32'h00000001;
      expv[27] = 32'h00040001;
      expv[28] = 32'h00000002;
      expv[29] = 32'h00000003;
      expv[30] = 32'h00000003;
      expv[31] = 32'h00000001;
      expv[32] = 32'h08000001;
      expv[33] = 32'h00000c01;
      expv[34] = 32'h00400c01;
      expv[35] = 32'h00100c01;
      expv[36] = 32'h00000001;
      expv[37] = 32'h00000401;
      expv[38] = 32'h00000401;
      expv[39] = 32'h00000401;
      expv[40] = 32'h00000001;
      expv[41] = 32'h00000002;
      expv[42] = 32'h00000602;
      expv[43] = 32'h00000002;
      expv[44] = 32'h00080002;
      expv[45] = 32'h00000602;
      expv[46] = 32'h00000001;
      expv[47] = 32'h00000001;
      expv[48] = 32'h00000601;
      expv[49] = 32'h00000002;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000003;
      expv[52] = 32'h00000001;
      expv[53] = 32'h00000003;
      expv[54] = 32'h00000003;
      expv[55] = 32'h00000003;
      expv[56] = 32'h00040003;
      expv[57] = 32'h04040003;
      expv[58] = 32'h00440003;
      expv[59] = 32'h00000001;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00800000;
      expv[63] = 32'h00000000;
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
