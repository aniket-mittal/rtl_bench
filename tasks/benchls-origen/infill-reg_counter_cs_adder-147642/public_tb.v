// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147642 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .reg_in(in_vec[8:1]),
    .select(in_vec[0:0]),
    .final_out(out_vec[12:1]),
    .carry_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h283;
    stim[1] = 10'h2c8;
    stim[2] = 10'h04f;
    stim[3] = 10'h09e;
    stim[4] = 10'h1b1;
    stim[5] = 10'h12a;
    stim[6] = 10'h0c0;
    stim[7] = 10'h023;
    stim[8] = 10'h1ca;
    stim[9] = 10'h1b6;
    stim[10] = 10'h020;
    stim[11] = 10'h0a7;
    stim[12] = 10'h13a;
    stim[13] = 10'h063;
    stim[14] = 10'h04f;
    stim[15] = 10'h1bc;
    stim[16] = 10'h0f3;
    stim[17] = 10'h01f;
    stim[18] = 10'h13e;
    stim[19] = 10'h173;
    stim[20] = 10'h013;
    stim[21] = 10'h0a5;
    stim[22] = 10'h145;
    stim[23] = 10'h0f7;
    stim[24] = 10'h19d;
    stim[25] = 10'h00b;
    stim[26] = 10'h1b3;
    stim[27] = 10'h169;
    stim[28] = 10'h204;
    stim[29] = 10'h079;
    stim[30] = 10'h29f;
    stim[31] = 10'h183;
    stim[32] = 10'h1a2;
    stim[33] = 10'h154;
    stim[34] = 10'h08b;
    stim[35] = 10'h0b3;
    stim[36] = 10'h0ad;
    stim[37] = 10'h176;
    stim[38] = 10'h17d;
    stim[39] = 10'h19d;
    stim[40] = 10'h119;
    stim[41] = 10'h08e;
    stim[42] = 10'h169;
    stim[43] = 10'h11b;
    stim[44] = 10'h0b3;
    stim[45] = 10'h107;
    stim[46] = 10'h139;
    stim[47] = 10'h15e;
    stim[48] = 10'h154;
    stim[49] = 10'h114;
    stim[50] = 10'h060;
    stim[51] = 10'h360;
    stim[52] = 10'h0c3;
    stim[53] = 10'h363;
    stim[54] = 10'h121;
    stim[55] = 10'h088;
    stim[56] = 10'h08e;
    stim[57] = 10'h109;
    stim[58] = 10'h095;
    stim[59] = 10'h10e;
    stim[60] = 10'h122;
    stim[61] = 10'h1fe;
    stim[62] = 10'h122;
    stim[63] = 10'h390;
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
      expv[0] = 13'h0068;
      expv[1] = 13'h0000;
      expv[2] = 13'h0068;
      expv[3] = 13'h0002;
      expv[4] = 13'h009e;
      expv[5] = 13'h0006;
      expv[6] = 13'h0008;
      expv[7] = 13'h00c0;
      expv[8] = 13'h000c;
      expv[9] = 13'h000e;
      expv[10] = 13'h0010;
      expv[11] = 13'h0020;
      expv[12] = 13'h0014;
      expv[13] = 13'h013a;
      expv[14] = 13'h0062;
      expv[15] = 13'h001a;
      expv[16] = 13'h01bc;
      expv[17] = 13'h00f2;
      expv[18] = 13'h0000;
      expv[19] = 13'h013e;
      expv[20] = 13'h0172;
      expv[21] = 13'h0012;
      expv[22] = 13'h00a4;
      expv[23] = 13'h0144;
      expv[24] = 13'h00f6;
      expv[25] = 13'h019c;
      expv[26] = 13'h000a;
      expv[27] = 13'h01b2;
      expv[28] = 13'h0000;
      expv[29] = 13'h0068;
      expv[30] = 13'h0068;
      expv[31] = 13'h0068;
      expv[32] = 13'h0002;
      expv[33] = 13'h0004;
      expv[34] = 13'h0154;
      expv[35] = 13'h008a;
      expv[36] = 13'h00b2;
      expv[37] = 13'h000c;
      expv[38] = 13'h0176;
      expv[39] = 13'h017c;
      expv[40] = 13'h019c;
      expv[41] = 13'h0014;
      expv[42] = 13'h008e;
      expv[43] = 13'h0168;
      expv[44] = 13'h011a;
      expv[45] = 13'h00b2;
      expv[46] = 13'h0106;
      expv[47] = 13'h0000;
      expv[48] = 13'h0002;
      expv[49] = 13'h0004;
      expv[50] = 13'h0006;
      expv[51] = 13'h0000;
      expv[52] = 13'h0068;
      expv[53] = 13'h0068;
      expv[54] = 13'h0068;
      expv[55] = 13'h0002;
      expv[56] = 13'h0004;
      expv[57] = 13'h008e;
      expv[58] = 13'h0108;
      expv[59] = 13'h000a;
      expv[60] = 13'h000c;
      expv[61] = 13'h000e;
      expv[62] = 13'h0011;
      expv[63] = 13'h0000;
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
