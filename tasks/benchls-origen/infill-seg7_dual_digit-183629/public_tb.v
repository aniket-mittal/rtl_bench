// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183629 dut (
    .CLK(clk),
    .Ten_Data(in_vec[7:4]),
    .One_Data(in_vec[3:0]),
    .Ten_SMG_Data(out_vec[15:8]),
    .One_SMG_Data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'he1;
    stim[1] = 8'he1;
    stim[2] = 8'hae;
    stim[3] = 8'h09;
    stim[4] = 8'h40;
    stim[5] = 8'h24;
    stim[6] = 8'h28;
    stim[7] = 8'hb2;
    stim[8] = 8'h1b;
    stim[9] = 8'h5e;
    stim[10] = 8'hef;
    stim[11] = 8'h5b;
    stim[12] = 8'h31;
    stim[13] = 8'h07;
    stim[14] = 8'h4e;
    stim[15] = 8'h87;
    stim[16] = 8'h13;
    stim[17] = 8'hc6;
    stim[18] = 8'hce;
    stim[19] = 8'h13;
    stim[20] = 8'h8d;
    stim[21] = 8'hff;
    stim[22] = 8'h5c;
    stim[23] = 8'h25;
    stim[24] = 8'h08;
    stim[25] = 8'ha8;
    stim[26] = 8'h80;
    stim[27] = 8'h55;
    stim[28] = 8'h47;
    stim[29] = 8'ha3;
    stim[30] = 8'h95;
    stim[31] = 8'ha4;
    stim[32] = 8'h61;
    stim[33] = 8'ha8;
    stim[34] = 8'h27;
    stim[35] = 8'h3e;
    stim[36] = 8'h2a;
    stim[37] = 8'h6b;
    stim[38] = 8'h1d;
    stim[39] = 8'h50;
    stim[40] = 8'h05;
    stim[41] = 8'h46;
    stim[42] = 8'h46;
    stim[43] = 8'ha7;
    stim[44] = 8'h3b;
    stim[45] = 8'h6d;
    stim[46] = 8'hd2;
    stim[47] = 8'h4f;
    stim[48] = 8'h6c;
    stim[49] = 8'hc3;
    stim[50] = 8'hb7;
    stim[51] = 8'h92;
    stim[52] = 8'h97;
    stim[53] = 8'h6f;
    stim[54] = 8'h30;
    stim[55] = 8'h50;
    stim[56] = 8'h3b;
    stim[57] = 8'h86;
    stim[58] = 8'hed;
    stim[59] = 8'h32;
    stim[60] = 8'h17;
    stim[61] = 8'h90;
    stim[62] = 8'haf;
    stim[63] = 8'h4d;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hfff9;
      expv[2] = 16'hfff9;
      expv[3] = 16'hffff;
      expv[4] = 16'hc090;
      expv[5] = 16'h99c0;
      expv[6] = 16'ha499;
      expv[7] = 16'ha480;
      expv[8] = 16'hffa4;
      expv[9] = 16'hf9ff;
      expv[10] = 16'h92ff;
      expv[11] = 16'hffff;
      expv[12] = 16'h92ff;
      expv[13] = 16'hb0f9;
      expv[14] = 16'hc0f8;
      expv[15] = 16'h99ff;
      expv[16] = 16'h80f8;
      expv[17] = 16'hf9b0;
      expv[18] = 16'hff82;
      expv[19] = 16'hffff;
      expv[20] = 16'hf9b0;
      expv[21] = 16'h80ff;
      expv[22] = 16'hffff;
      expv[23] = 16'h92ff;
      expv[24] = 16'ha492;
      expv[25] = 16'hc080;
      expv[26] = 16'hff80;
      expv[27] = 16'h80c0;
      expv[28] = 16'h9292;
      expv[29] = 16'h99f8;
      expv[30] = 16'hffb0;
      expv[31] = 16'h9092;
      expv[32] = 16'hff99;
      expv[33] = 16'h82f9;
      expv[34] = 16'hff80;
      expv[35] = 16'ha4f8;
      expv[36] = 16'hb0ff;
      expv[37] = 16'ha4ff;
      expv[38] = 16'h82ff;
      expv[39] = 16'hf9ff;
      expv[40] = 16'h92c0;
      expv[41] = 16'hc092;
      expv[42] = 16'h9982;
      expv[43] = 16'h9982;
      expv[44] = 16'hfff8;
      expv[45] = 16'hb0ff;
      expv[46] = 16'h82ff;
      expv[47] = 16'hffa4;
      expv[48] = 16'h99ff;
      expv[49] = 16'h82ff;
      expv[50] = 16'hffb0;
      expv[51] = 16'hfff8;
      expv[52] = 16'h90a4;
      expv[53] = 16'h90f8;
      expv[54] = 16'h82ff;
      expv[55] = 16'hb0c0;
      expv[56] = 16'h92c0;
      expv[57] = 16'hb0ff;
      expv[58] = 16'h8082;
      expv[59] = 16'hffff;
      expv[60] = 16'hb0a4;
      expv[61] = 16'hf9f8;
      expv[62] = 16'h90c0;
      expv[63] = 16'hffff;
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
