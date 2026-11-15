// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023843 dut (
    .clk(clk),
    .rst_n(in_vec[20:20]),
    .tx_data(in_vec[19:4]),
    .wrt(in_vec[3:3]),
    .SCLK(in_vec[2:2]),
    .SS_n(in_vec[1:1]),
    .MOSI(in_vec[0:0]),
    .MISO(out_vec[18:18]),
    .cmd_rcvd(out_vec[17:2]),
    .cmd_rdy(out_vec[1:1]),
    .rsp_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0dda0d;
    stim[1] = 21'h0604c1;
    stim[2] = 21'h187d30;
    stim[3] = 21'h139e50;
    stim[4] = 21'h1e27bd;
    stim[5] = 21'h195fce;
    stim[6] = 21'h1a3b73;
    stim[7] = 21'h13a17d;
    stim[8] = 21'h17db56;
    stim[9] = 21'h180456;
    stim[10] = 21'h155cc3;
    stim[11] = 21'h15fc50;
    stim[12] = 21'h1d36f3;
    stim[13] = 21'h1e14b1;
    stim[14] = 21'h1c214f;
    stim[15] = 21'h19bb82;
    stim[16] = 21'h1054dd;
    stim[17] = 21'h158118;
    stim[18] = 21'h1d1ae5;
    stim[19] = 21'h1de75f;
    stim[20] = 21'h1793a0;
    stim[21] = 21'h16f991;
    stim[22] = 21'h144f47;
    stim[23] = 21'h164a8c;
    stim[24] = 21'h1a5b00;
    stim[25] = 21'h187aee;
    stim[26] = 21'h1d223b;
    stim[27] = 21'h11ddb1;
    stim[28] = 21'h15ba0d;
    stim[29] = 21'h1a78d5;
    stim[30] = 21'h118f6b;
    stim[31] = 21'h1f719e;
    stim[32] = 21'h1234a7;
    stim[33] = 21'h199242;
    stim[34] = 21'h1bec1c;
    stim[35] = 21'h1d15fe;
    stim[36] = 21'h1bda57;
    stim[37] = 21'h120cbf;
    stim[38] = 21'h18953a;
    stim[39] = 21'h124dc7;
    stim[40] = 21'h1483db;
    stim[41] = 21'h104f7a;
    stim[42] = 21'h1e98ac;
    stim[43] = 21'h039ada;
    stim[44] = 21'h19e51c;
    stim[45] = 21'h15a8d2;
    stim[46] = 21'h1bb545;
    stim[47] = 21'h1d52d1;
    stim[48] = 21'h029948;
    stim[49] = 21'h1f4885;
    stim[50] = 21'h12d270;
    stim[51] = 21'h1d0c1f;
    stim[52] = 21'h1c0a8c;
    stim[53] = 21'h1e4efa;
    stim[54] = 21'h197616;
    stim[55] = 21'h1dc82f;
    stim[56] = 21'h1264d4;
    stim[57] = 21'h1b05b4;
    stim[58] = 21'h136bd8;
    stim[59] = 21'h173e28;
    stim[60] = 21'h1d547d;
    stim[61] = 21'h14a208;
    stim[62] = 21'h1cb485;
    stim[63] = 21'h13b0c2;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h00000;
      expv[4] = 19'h00000;
      expv[5] = 19'h00001;
      expv[6] = 19'h00001;
      expv[7] = 19'h00001;
      expv[8] = 19'h00003;
      expv[9] = 19'h00001;
      expv[10] = 19'h00000;
      expv[11] = 19'h0e85e;
      expv[12] = 19'h0e85c;
      expv[13] = 19'h0e85c;
      expv[14] = 19'h0e85c;
      expv[15] = 19'h0e85f;
      expv[16] = 19'h4e85c;
      expv[17] = 19'h70853;
      expv[18] = 19'h70851;
      expv[19] = 19'h30850;
      expv[20] = 19'h70851;
      expv[21] = 19'h70851;
      expv[22] = 19'h6c08b;
      expv[23] = 19'h6c088;
      expv[24] = 19'h6c089;
      expv[25] = 19'h779d7;
      expv[26] = 19'h379d5;
      expv[27] = 19'h779d5;
      expv[28] = 19'h72543;
      expv[29] = 19'h72541;
      expv[30] = 19'h32540;
      expv[31] = 19'h32541;
      expv[32] = 19'h32541;
      expv[33] = 19'h16e83;
      expv[34] = 19'h16e81;
      expv[35] = 19'h16e81;
      expv[36] = 19'h16e81;
      expv[37] = 19'h56e80;
      expv[38] = 19'h7457f;
      expv[39] = 19'h7457d;
      expv[40] = 19'h7457d;
      expv[41] = 19'h7457d;
      expv[42] = 19'h7457d;
      expv[43] = 19'h00000;
      expv[44] = 19'h00000;
      expv[45] = 19'h00001;
      expv[46] = 19'h00001;
      expv[47] = 19'h40000;
      expv[48] = 19'h00000;
      expv[49] = 19'h00000;
      expv[50] = 19'h00000;
      expv[51] = 19'h00000;
      expv[52] = 19'h00001;
      expv[53] = 19'h00001;
      expv[54] = 19'h00003;
      expv[55] = 19'h40000;
      expv[56] = 19'h793bf;
      expv[57] = 19'h793bd;
      expv[58] = 19'h793bd;
      expv[59] = 19'h793bd;
      expv[60] = 19'h793bd;
      expv[61] = 19'h793bd;
      expv[62] = 19'h793bd;
      expv[63] = 19'h793bd;
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
