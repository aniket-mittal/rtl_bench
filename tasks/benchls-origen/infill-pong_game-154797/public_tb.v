// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_154797 dut (
    .CLK(clk),
    .RST_IN(in_vec[30:30]),
    .X(in_vec[29:19]),
    .Y(in_vec[18:8]),
    .BUTTONS(in_vec[7:0]),
    .R(out_vec[56:49]),
    .G(out_vec[48:41]),
    .B(out_vec[40:33]),
    .DEN(out_vec[32:32]),
    .SEG_HEX_ALL(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h2b489e21;
    stim[1] = 31'h38239fb0;
    stim[2] = 31'h4ba05ec6;
    stim[3] = 31'h576d1c4d;
    stim[4] = 31'h7fd02b44;
    stim[5] = 31'h7fe409f0;
    stim[6] = 31'h706acdbc;
    stim[7] = 31'h557c8343;
    stim[8] = 31'h4604b78f;
    stim[9] = 31'h4a9f86d0;
    stim[10] = 31'h4e4e9731;
    stim[11] = 31'h6e28742b;
    stim[12] = 31'h4c5abd5a;
    stim[13] = 31'h71e2f9fd;
    stim[14] = 31'h4abfc9df;
    stim[15] = 31'h79643749;
    stim[16] = 31'h6459f3de;
    stim[17] = 31'h48ffd51d;
    stim[18] = 31'h6b3af928;
    stim[19] = 31'h61b92a0e;
    stim[20] = 31'h57fa185e;
    stim[21] = 31'h69d74156;
    stim[22] = 31'h4a16f2d1;
    stim[23] = 31'h67a80075;
    stim[24] = 31'h44ed5ce4;
    stim[25] = 31'h6c277f29;
    stim[26] = 31'h7c8b3569;
    stim[27] = 31'h4ae5e57d;
    stim[28] = 31'h4dcf92c5;
    stim[29] = 31'h6257dc12;
    stim[30] = 31'h41c9cd3c;
    stim[31] = 31'h5aedae4e;
    stim[32] = 31'h7ada56ca;
    stim[33] = 31'h6383cf1b;
    stim[34] = 31'h597854fe;
    stim[35] = 31'h7308c3d7;
    stim[36] = 31'h3ac143e0;
    stim[37] = 31'h4fcb71af;
    stim[38] = 31'h73d7c7b9;
    stim[39] = 31'h4a1f6f17;
    stim[40] = 31'h1744f57e;
    stim[41] = 31'h599b8e3a;
    stim[42] = 31'h70e5ce00;
    stim[43] = 31'h7b757c94;
    stim[44] = 31'h7d0ad65c;
    stim[45] = 31'h7d40873b;
    stim[46] = 31'h5dbb646e;
    stim[47] = 31'h567d0d45;
    stim[48] = 31'h73aa053d;
    stim[49] = 31'h50e77deb;
    stim[50] = 31'h63709716;
    stim[51] = 31'h6a8d733b;
    stim[52] = 31'h77fcde56;
    stim[53] = 31'h519ca825;
    stim[54] = 31'h7da82c7b;
    stim[55] = 31'h724291be;
    stim[56] = 31'h710cac8d;
    stim[57] = 31'h7f004a19;
    stim[58] = 31'h67b49440;
    stim[59] = 31'h7f6f6edc;
    stim[60] = 31'h691cca22;
    stim[61] = 31'h258aca9b;
    stim[62] = 31'h483a0168;
    stim[63] = 31'h4dd457cb;
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
      expv[0] = 57'h000000100000000;
      expv[1] = 57'h000000100000000;
      expv[2] = 57'h000000100000000;
      expv[3] = 57'h000000100000000;
      expv[4] = 57'h000000100000000;
      expv[5] = 57'h000000100000000;
      expv[6] = 57'h000000100000000;
      expv[7] = 57'h000000100000000;
      expv[8] = 57'h000000100000000;
      expv[9] = 57'h000000100000000;
      expv[10] = 57'h000000100000000;
      expv[11] = 57'h000000100000000;
      expv[12] = 57'h000000100000000;
      expv[13] = 57'h000000100000000;
      expv[14] = 57'h000000100000000;
      expv[15] = 57'h000000100000000;
      expv[16] = 57'h000000100000000;
      expv[17] = 57'h000000100000000;
      expv[18] = 57'h000000100000000;
      expv[19] = 57'h001fe0100000000;
      expv[20] = 57'h000000100000000;
      expv[21] = 57'h000000100000000;
      expv[22] = 57'h000000100000000;
      expv[23] = 57'h000000100000000;
      expv[24] = 57'h000000100000000;
      expv[25] = 57'h000000100000000;
      expv[26] = 57'h000000100000000;
      expv[27] = 57'h000000100000000;
      expv[28] = 57'h000000100000000;
      expv[29] = 57'h000000100000000;
      expv[30] = 57'h000000100000000;
      expv[31] = 57'h000000100000000;
      expv[32] = 57'h000000100000000;
      expv[33] = 57'h000000100000000;
      expv[34] = 57'h000000100000000;
      expv[35] = 57'h000000100000000;
      expv[36] = 57'h001fe0100000000;
      expv[37] = 57'h000000100000000;
      expv[38] = 57'h000000100000000;
      expv[39] = 57'h000000100000000;
      expv[40] = 57'h000000100000000;
      expv[41] = 57'h000000100000000;
      expv[42] = 57'h000000100000000;
      expv[43] = 57'h000000100000000;
      expv[44] = 57'h000000100000000;
      expv[45] = 57'h000000100000000;
      expv[46] = 57'h000000100000000;
      expv[47] = 57'h000000100000000;
      expv[48] = 57'h000000100000000;
      expv[49] = 57'h000000100000000;
      expv[50] = 57'h000000100000000;
      expv[51] = 57'h000000100000000;
      expv[52] = 57'h000000100000000;
      expv[53] = 57'h000000100000000;
      expv[54] = 57'h000000100000000;
      expv[55] = 57'h000000100000000;
      expv[56] = 57'h000000100000000;
      expv[57] = 57'h000000100000000;
      expv[58] = 57'h000000100000000;
      expv[59] = 57'h000000100000000;
      expv[60] = 57'h000000100000000;
      expv[61] = 57'h000000100000000;
      expv[62] = 57'h000000100000000;
      expv[63] = 57'h000000100000000;
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
