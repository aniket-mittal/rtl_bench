// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04752 dut (
    .t_crt_clk(clk),
    .h_reset_n(in_vec[7:7]),
    .c_shift_ld(in_vec[6:6]),
    .m_att_data_b32(in_vec[5:5]),
    .c_cr0b_b6(in_vec[4:4]),
    .c_cr0b_b5(in_vec[3:3]),
    .c_cr0a_b5(in_vec[2:2]),
    .c_t_vsync(in_vec[1:1]),
    .ar12_b4(in_vec[0:0]),
    .cursor_blink_rate(out_vec[2:2]),
    .finalcursor(out_vec[1:1]),
    .char_blink_rate(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h66;
    stim[1] = 8'h5a;
    stim[2] = 8'hd6;
    stim[3] = 8'hff;
    stim[4] = 8'hef;
    stim[5] = 8'h93;
    stim[6] = 8'hbf;
    stim[7] = 8'hd0;
    stim[8] = 8'hdd;
    stim[9] = 8'hd7;
    stim[10] = 8'he0;
    stim[11] = 8'h86;
    stim[12] = 8'he4;
    stim[13] = 8'hfe;
    stim[14] = 8'h90;
    stim[15] = 8'hc6;
    stim[16] = 8'hcd;
    stim[17] = 8'hd6;
    stim[18] = 8'hd3;
    stim[19] = 8'hb3;
    stim[20] = 8'hdc;
    stim[21] = 8'hdb;
    stim[22] = 8'hff;
    stim[23] = 8'hf9;
    stim[24] = 8'h93;
    stim[25] = 8'h97;
    stim[26] = 8'h96;
    stim[27] = 8'ha7;
    stim[28] = 8'h99;
    stim[29] = 8'h8c;
    stim[30] = 8'h78;
    stim[31] = 8'hc4;
    stim[32] = 8'hf1;
    stim[33] = 8'hac;
    stim[34] = 8'hf7;
    stim[35] = 8'hee;
    stim[36] = 8'hc7;
    stim[37] = 8'hcd;
    stim[38] = 8'hda;
    stim[39] = 8'h8e;
    stim[40] = 8'hba;
    stim[41] = 8'ha1;
    stim[42] = 8'hdc;
    stim[43] = 8'hc4;
    stim[44] = 8'h84;
    stim[45] = 8'h92;
    stim[46] = 8'hc9;
    stim[47] = 8'h86;
    stim[48] = 8'ha7;
    stim[49] = 8'hd6;
    stim[50] = 8'hb2;
    stim[51] = 8'hd3;
    stim[52] = 8'ha2;
    stim[53] = 8'hc8;
    stim[54] = 8'hab;
    stim[55] = 8'h83;
    stim[56] = 8'h8c;
    stim[57] = 8'hb3;
    stim[58] = 8'hd5;
    stim[59] = 8'hdf;
    stim[60] = 8'hbc;
    stim[61] = 8'ha8;
    stim[62] = 8'h9c;
    stim[63] = 8'ha6;
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
      expv[0] = 3'h4;
      expv[1] = 3'h4;
      expv[2] = 3'h4;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h6;
      expv[6] = 3'h4;
      expv[7] = 3'h6;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h6;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h6;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h6;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h6;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h6;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h6;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
