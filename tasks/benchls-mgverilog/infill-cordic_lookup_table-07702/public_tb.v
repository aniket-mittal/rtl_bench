// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07702 dut (
    .in_data(in_vec[6:0]),
    .out_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h53;
    stim[1] = 7'h69;
    stim[2] = 7'h47;
    stim[3] = 7'h3d;
    stim[4] = 7'h71;
    stim[5] = 7'h46;
    stim[6] = 7'h63;
    stim[7] = 7'h07;
    stim[8] = 7'h6b;
    stim[9] = 7'h77;
    stim[10] = 7'h47;
    stim[11] = 7'h1c;
    stim[12] = 7'h3b;
    stim[13] = 7'h28;
    stim[14] = 7'h30;
    stim[15] = 7'h36;
    stim[16] = 7'h40;
    stim[17] = 7'h6a;
    stim[18] = 7'h27;
    stim[19] = 7'h7b;
    stim[20] = 7'h7e;
    stim[21] = 7'h18;
    stim[22] = 7'h3e;
    stim[23] = 7'h7a;
    stim[24] = 7'h00;
    stim[25] = 7'h6b;
    stim[26] = 7'h7f;
    stim[27] = 7'h21;
    stim[28] = 7'h10;
    stim[29] = 7'h2d;
    stim[30] = 7'h66;
    stim[31] = 7'h0e;
    stim[32] = 7'h1f;
    stim[33] = 7'h72;
    stim[34] = 7'h74;
    stim[35] = 7'h68;
    stim[36] = 7'h4f;
    stim[37] = 7'h2a;
    stim[38] = 7'h40;
    stim[39] = 7'h7c;
    stim[40] = 7'h2d;
    stim[41] = 7'h45;
    stim[42] = 7'h5f;
    stim[43] = 7'h52;
    stim[44] = 7'h60;
    stim[45] = 7'h7a;
    stim[46] = 7'h0d;
    stim[47] = 7'h19;
    stim[48] = 7'h28;
    stim[49] = 7'h5f;
    stim[50] = 7'h42;
    stim[51] = 7'h22;
    stim[52] = 7'h75;
    stim[53] = 7'h20;
    stim[54] = 7'h7b;
    stim[55] = 7'h4d;
    stim[56] = 7'h4c;
    stim[57] = 7'h60;
    stim[58] = 7'h29;
    stim[59] = 7'h56;
    stim[60] = 7'h58;
    stim[61] = 7'h4b;
    stim[62] = 7'h54;
    stim[63] = 7'h65;
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
      expv[0] = 32'h0000004a;
      expv[1] = 32'h00000027;
      expv[2] = 32'h00000074;
      expv[3] = 32'h000000f6;
      expv[4] = 32'h0000001a;
      expv[5] = 32'h00000081;
      expv[6] = 32'h00000030;
      expv[7] = 32'h00001380;
      expv[8] = 32'h00000023;
      expv[9] = 32'h00000010;
      expv[10] = 32'h00000074;
      expv[11] = 32'h00000596;
      expv[12] = 32'h00000110;
      expv[13] = 32'h000002d8;
      expv[14] = 32'h000001d8;
      expv[15] = 32'h00000151;
      expv[16] = 32'h000000cf;
      expv[17] = 32'h00000025;
      expv[18] = 32'h000002f8;
      expv[19] = 32'h0000000a;
      expv[20] = 32'h00000005;
      expv[21] = 32'h00000706;
      expv[22] = 32'h000000e9;
      expv[23] = 32'h0000000b;
      expv[24] = 32'h00001d74;
      expv[25] = 32'h00000023;
      expv[26] = 32'h00000003;
      expv[27] = 32'h0000044e;
      expv[28] = 32'h00000b95;
      expv[29] = 32'h00000238;
      expv[30] = 32'h0000002b;
      expv[31] = 32'h00000d21;
      expv[32] = 32'h00000482;
      expv[33] = 32'h00000018;
      expv[34] = 32'h00000015;
      expv[35] = 32'h00000028;
      expv[36] = 32'h00000050;
      expv[37] = 32'h00000298;
      expv[38] = 32'h000000cf;
      expv[39] = 32'h00000008;
      expv[40] = 32'h00000238;
      expv[41] = 32'h0000008e;
      expv[42] = 32'h00000037;
      expv[43] = 32'h0000004b;
      expv[44] = 32'h00000035;
      expv[45] = 32'h0000000b;
      expv[46] = 32'h00000e0b;
      expv[47] = 32'h000006aa;
      expv[48] = 32'h000002d8;
      expv[49] = 32'h00000037;
      expv[50] = 32'h000000b5;
      expv[51] = 32'h00000415;
      expv[52] = 32'h00000013;
      expv[53] = 32'h00000487;
      expv[54] = 32'h0000000a;
      expv[55] = 32'h00000053;
      expv[56] = 32'h00000055;
      expv[57] = 32'h00000035;
      expv[58] = 32'h000002b8;
      expv[59] = 32'h00000045;
      expv[60] = 32'h00000042;
      expv[61] = 32'h00000056;
      expv[62] = 32'h00000048;
      expv[63] = 32'h0000002d;
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
