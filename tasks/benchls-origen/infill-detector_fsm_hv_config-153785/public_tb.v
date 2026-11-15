// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153785 dut (
    .clk(clk),
    .rst_n(in_vec[8:8]),
    .acquisition(in_vec[7:7]),
    .hv_config_en(in_vec[6:6]),
    .hv_config_rep_receive(in_vec[5:5]),
    .hv_config_done(in_vec[4:4]),
    .chipsat(in_vec[3:3]),
    .sc_req(in_vec[2:2]),
    .sc_done(in_vec[1:1]),
    .end_readout(in_vec[0:0]),
    .idle(out_vec[6:6]),
    .acq(out_vec[5:5]),
    .conv(out_vec[4:4]),
    .read(out_vec[3:3]),
    .sc(out_vec[2:2]),
    .hv_wr(out_vec[1:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h055;
    stim[1] = 9'h0b1;
    stim[2] = 9'h142;
    stim[3] = 9'h1a8;
    stim[4] = 9'h1ea;
    stim[5] = 9'h14e;
    stim[6] = 9'h13c;
    stim[7] = 9'h13d;
    stim[8] = 9'h13b;
    stim[9] = 9'h1fe;
    stim[10] = 9'h1e2;
    stim[11] = 9'h112;
    stim[12] = 9'h11f;
    stim[13] = 9'h1ea;
    stim[14] = 9'h198;
    stim[15] = 9'h130;
    stim[16] = 9'h179;
    stim[17] = 9'h1f4;
    stim[18] = 9'h1b8;
    stim[19] = 9'h1ad;
    stim[20] = 9'h146;
    stim[21] = 9'h18c;
    stim[22] = 9'h159;
    stim[23] = 9'h11b;
    stim[24] = 9'h1ed;
    stim[25] = 9'h147;
    stim[26] = 9'h1ed;
    stim[27] = 9'h15d;
    stim[28] = 9'h153;
    stim[29] = 9'h184;
    stim[30] = 9'h128;
    stim[31] = 9'h1de;
    stim[32] = 9'h166;
    stim[33] = 9'h1a0;
    stim[34] = 9'h10e;
    stim[35] = 9'h16a;
    stim[36] = 9'h164;
    stim[37] = 9'h14c;
    stim[38] = 9'h107;
    stim[39] = 9'h176;
    stim[40] = 9'h10c;
    stim[41] = 9'h19a;
    stim[42] = 9'h1ac;
    stim[43] = 9'h193;
    stim[44] = 9'h1f5;
    stim[45] = 9'h17a;
    stim[46] = 9'h13f;
    stim[47] = 9'h1b8;
    stim[48] = 9'h117;
    stim[49] = 9'h197;
    stim[50] = 9'h18d;
    stim[51] = 9'h150;
    stim[52] = 9'h1ee;
    stim[53] = 9'h16f;
    stim[54] = 9'h1d7;
    stim[55] = 9'h196;
    stim[56] = 9'h17b;
    stim[57] = 9'h165;
    stim[58] = 9'h177;
    stim[59] = 9'h15e;
    stim[60] = 9'h168;
    stim[61] = 9'h171;
    stim[62] = 9'h179;
    stim[63] = 9'h1b3;
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
      expv[0] = 7'h40;
      expv[1] = 7'h40;
      expv[2] = 7'h40;
      expv[3] = 7'h02;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h40;
      expv[8] = 7'h04;
      expv[9] = 7'h40;
      expv[10] = 7'h20;
      expv[11] = 7'h20;
      expv[12] = 7'h20;
      expv[13] = 7'h10;
      expv[14] = 7'h10;
      expv[15] = 7'h10;
      expv[16] = 7'h08;
      expv[17] = 7'h40;
      expv[18] = 7'h20;
      expv[19] = 7'h20;
      expv[20] = 7'h20;
      expv[21] = 7'h20;
      expv[22] = 7'h20;
      expv[23] = 7'h10;
      expv[24] = 7'h10;
      expv[25] = 7'h10;
      expv[26] = 7'h08;
      expv[27] = 7'h40;
      expv[28] = 7'h04;
      expv[29] = 7'h40;
      expv[30] = 7'h20;
      expv[31] = 7'h10;
      expv[32] = 7'h10;
      expv[33] = 7'h08;
      expv[34] = 7'h08;
      expv[35] = 7'h08;
      expv[36] = 7'h08;
      expv[37] = 7'h08;
      expv[38] = 7'h08;
      expv[39] = 7'h40;
      expv[40] = 7'h04;
      expv[41] = 7'h04;
      expv[42] = 7'h40;
      expv[43] = 7'h20;
      expv[44] = 7'h20;
      expv[45] = 7'h20;
      expv[46] = 7'h10;
      expv[47] = 7'h10;
      expv[48] = 7'h10;
      expv[49] = 7'h08;
      expv[50] = 7'h40;
      expv[51] = 7'h20;
      expv[52] = 7'h20;
      expv[53] = 7'h20;
      expv[54] = 7'h10;
      expv[55] = 7'h08;
      expv[56] = 7'h08;
      expv[57] = 7'h40;
      expv[58] = 7'h04;
      expv[59] = 7'h40;
      expv[60] = 7'h04;
      expv[61] = 7'h04;
      expv[62] = 7'h04;
      expv[63] = 7'h04;
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
