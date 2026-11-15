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

  origen_091453 dut (
    .clk(clk),
    .test_logic_reset(in_vec[7:7]),
    .update_dr_clk(in_vec[6:6]),
    .shiftcapture_dr_clk(in_vec[5:5]),
    .shift_dr(in_vec[4:4]),
    .capture_dr(in_vec[3:3]),
    .tdi(in_vec[2:2]),
    .select(in_vec[1:1]),
    .syn_tdo_i(in_vec[0:0]),
    .syn_clk(out_vec[7:7]),
    .syn_reset(out_vec[6:6]),
    .syn_shift_dr(out_vec[5:5]),
    .syn_capture_dr(out_vec[4:4]),
    .syn_update_dr(out_vec[3:3]),
    .syn_tdi(out_vec[2:2]),
    .syn_select(out_vec[1:1]),
    .tdo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb4;
    stim[1] = 8'hd0;
    stim[2] = 8'h54;
    stim[3] = 8'h12;
    stim[4] = 8'h75;
    stim[5] = 8'h29;
    stim[6] = 8'h19;
    stim[7] = 8'h74;
    stim[8] = 8'h3e;
    stim[9] = 8'h2b;
    stim[10] = 8'h1d;
    stim[11] = 8'h74;
    stim[12] = 8'h5f;
    stim[13] = 8'h53;
    stim[14] = 8'h21;
    stim[15] = 8'h23;
    stim[16] = 8'h0a;
    stim[17] = 8'h16;
    stim[18] = 8'h55;
    stim[19] = 8'h53;
    stim[20] = 8'h45;
    stim[21] = 8'h2c;
    stim[22] = 8'h4f;
    stim[23] = 8'h05;
    stim[24] = 8'h30;
    stim[25] = 8'h43;
    stim[26] = 8'h77;
    stim[27] = 8'h14;
    stim[28] = 8'h68;
    stim[29] = 8'h4e;
    stim[30] = 8'h41;
    stim[31] = 8'h7a;
    stim[32] = 8'h0b;
    stim[33] = 8'h3e;
    stim[34] = 8'h76;
    stim[35] = 8'h15;
    stim[36] = 8'h6e;
    stim[37] = 8'h6e;
    stim[38] = 8'h61;
    stim[39] = 8'h2d;
    stim[40] = 8'h1a;
    stim[41] = 8'h1b;
    stim[42] = 8'h68;
    stim[43] = 8'h28;
    stim[44] = 8'h01;
    stim[45] = 8'h02;
    stim[46] = 8'h41;
    stim[47] = 8'h6f;
    stim[48] = 8'h13;
    stim[49] = 8'h02;
    stim[50] = 8'h08;
    stim[51] = 8'h57;
    stim[52] = 8'h56;
    stim[53] = 8'h75;
    stim[54] = 8'h2b;
    stim[55] = 8'h79;
    stim[56] = 8'h6f;
    stim[57] = 8'h2b;
    stim[58] = 8'h45;
    stim[59] = 8'h5b;
    stim[60] = 8'h3d;
    stim[61] = 8'h22;
    stim[62] = 8'h35;
    stim[63] = 8'h4b;
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
      expv[1] = 8'h40;
      expv[2] = 8'h40;
      expv[3] = 8'h40;
      expv[4] = 8'h41;
      expv[5] = 8'h01;
      expv[6] = 8'h01;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h0b;
      expv[10] = 8'h03;
      expv[11] = 8'h02;
      expv[12] = 8'h03;
      expv[13] = 8'h3b;
      expv[14] = 8'h33;
      expv[15] = 8'h33;
      expv[16] = 8'h32;
      expv[17] = 8'h32;
      expv[18] = 8'h37;
      expv[19] = 8'h37;
      expv[20] = 8'h3b;
      expv[21] = 8'h36;
      expv[22] = 8'h37;
      expv[23] = 8'h17;
      expv[24] = 8'h1c;
      expv[25] = 8'h11;
      expv[26] = 8'h13;
      expv[27] = 8'h1e;
      expv[28] = 8'h04;
      expv[29] = 8'h04;
      expv[30] = 8'h2f;
      expv[31] = 8'h22;
      expv[32] = 8'h23;
      expv[33] = 8'h12;
      expv[34] = 8'h16;
      expv[35] = 8'h17;
      expv[36] = 8'h1c;
      expv[37] = 8'h14;
      expv[38] = 8'h1f;
      expv[39] = 8'h13;
      expv[40] = 8'h16;
      expv[41] = 8'h13;
      expv[42] = 8'h12;
      expv[43] = 8'h12;
      expv[44] = 8'h29;
      expv[45] = 8'h20;
      expv[46] = 8'h21;
      expv[47] = 8'h21;
      expv[48] = 8'h2f;
      expv[49] = 8'h02;
      expv[50] = 8'h02;
      expv[51] = 8'h03;
      expv[52] = 8'h02;
      expv[53] = 8'h0b;
      expv[54] = 8'h03;
      expv[55] = 8'h03;
      expv[56] = 8'h03;
      expv[57] = 8'h0b;
      expv[58] = 8'h03;
      expv[59] = 8'h03;
      expv[60] = 8'h0b;
      expv[61] = 8'h02;
      expv[62] = 8'h23;
      expv[63] = 8'h27;
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
