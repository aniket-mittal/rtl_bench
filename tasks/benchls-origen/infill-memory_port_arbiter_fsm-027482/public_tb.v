// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027482 dut (
    .ui_clk(clk),
    .rst_n(in_vec[6:6]),
    .c3_p2_cmd_empty(in_vec[5:5]),
    .c3_p3_cmd_empty(in_vec[4:4]),
    .c3_p4_cmd_empty(in_vec[3:3]),
    .a7_wr_end(in_vec[2:2]),
    .a7_rd1_end(in_vec[1:1]),
    .a7_rd2_end(in_vec[0:0]),
    .a7_wr_start(out_vec[7:7]),
    .a7_rd1_start(out_vec[6:6]),
    .a7_rd2_start(out_vec[5:5]),
    .state(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h16;
    stim[1] = 7'h3c;
    stim[2] = 7'h53;
    stim[3] = 7'h4e;
    stim[4] = 7'h60;
    stim[5] = 7'h50;
    stim[6] = 7'h69;
    stim[7] = 7'h7b;
    stim[8] = 7'h50;
    stim[9] = 7'h5b;
    stim[10] = 7'h5b;
    stim[11] = 7'h60;
    stim[12] = 7'h77;
    stim[13] = 7'h4f;
    stim[14] = 7'h6d;
    stim[15] = 7'h62;
    stim[16] = 7'h63;
    stim[17] = 7'h6b;
    stim[18] = 7'h7b;
    stim[19] = 7'h62;
    stim[20] = 7'h68;
    stim[21] = 7'h47;
    stim[22] = 7'h6e;
    stim[23] = 7'h40;
    stim[24] = 7'h1f;
    stim[25] = 7'h47;
    stim[26] = 7'h5d;
    stim[27] = 7'h62;
    stim[28] = 7'h78;
    stim[29] = 7'h58;
    stim[30] = 7'h4a;
    stim[31] = 7'h55;
    stim[32] = 7'h52;
    stim[33] = 7'h58;
    stim[34] = 7'h67;
    stim[35] = 7'h54;
    stim[36] = 7'h79;
    stim[37] = 7'h78;
    stim[38] = 7'h4a;
    stim[39] = 7'h57;
    stim[40] = 7'h56;
    stim[41] = 7'h68;
    stim[42] = 7'h78;
    stim[43] = 7'h5b;
    stim[44] = 7'h65;
    stim[45] = 7'h65;
    stim[46] = 7'h75;
    stim[47] = 7'h48;
    stim[48] = 7'h40;
    stim[49] = 7'h5a;
    stim[50] = 7'h74;
    stim[51] = 7'h5d;
    stim[52] = 7'h5f;
    stim[53] = 7'h65;
    stim[54] = 7'h6d;
    stim[55] = 7'h6f;
    stim[56] = 7'h59;
    stim[57] = 7'h6e;
    stim[58] = 7'h4b;
    stim[59] = 7'h47;
    stim[60] = 7'h4a;
    stim[61] = 7'h35;
    stim[62] = 7'h72;
    stim[63] = 7'h4e;
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
      expv[0] = 8'h01;
      expv[1] = 8'h01;
      expv[2] = 8'h01;
      expv[3] = 8'h02;
      expv[4] = 8'h48;
      expv[5] = 8'h48;
      expv[6] = 8'h08;
      expv[7] = 8'h08;
      expv[8] = 8'h02;
      expv[9] = 8'h84;
      expv[10] = 8'h84;
      expv[11] = 8'h04;
      expv[12] = 8'h04;
      expv[13] = 8'h02;
      expv[14] = 8'h02;
      expv[15] = 8'h02;
      expv[16] = 8'h48;
      expv[17] = 8'h02;
      expv[18] = 8'h02;
      expv[19] = 8'h02;
      expv[20] = 8'h30;
      expv[21] = 8'h30;
      expv[22] = 8'h02;
      expv[23] = 8'h02;
      expv[24] = 8'h01;
      expv[25] = 8'h01;
      expv[26] = 8'h02;
      expv[27] = 8'h02;
      expv[28] = 8'h30;
      expv[29] = 8'h30;
      expv[30] = 8'h10;
      expv[31] = 8'h10;
      expv[32] = 8'h02;
      expv[33] = 8'h02;
      expv[34] = 8'h02;
      expv[35] = 8'h02;
      expv[36] = 8'h02;
      expv[37] = 8'h02;
      expv[38] = 8'h02;
      expv[39] = 8'h48;
      expv[40] = 8'h02;
      expv[41] = 8'h84;
      expv[42] = 8'h84;
      expv[43] = 8'h04;
      expv[44] = 8'h04;
      expv[45] = 8'h02;
      expv[46] = 8'h30;
      expv[47] = 8'h02;
      expv[48] = 8'h48;
      expv[49] = 8'h48;
      expv[50] = 8'h02;
      expv[51] = 8'h02;
      expv[52] = 8'h02;
      expv[53] = 8'h84;
      expv[54] = 8'h02;
      expv[55] = 8'h02;
      expv[56] = 8'h02;
      expv[57] = 8'h02;
      expv[58] = 8'h02;
      expv[59] = 8'h84;
      expv[60] = 8'h02;
      expv[61] = 8'h01;
      expv[62] = 8'h01;
      expv[63] = 8'h02;
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
