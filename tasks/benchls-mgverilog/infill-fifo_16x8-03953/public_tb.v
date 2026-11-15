// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03953 dut (
    .sys_clk_i(clk),
    .d_i(in_vec[11:4]),
    .we_i(in_vec[3:3]),
    .wp_inc_i(in_vec[2:2]),
    .rp_inc_i(in_vec[1:1]),
    .sys_reset_i(in_vec[0:0]),
    .q_o(out_vec[9:2]),
    .full_o(out_vec[1:1]),
    .data_available_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h135;
    stim[1] = 12'h19b;
    stim[2] = 12'h01e;
    stim[3] = 12'h354;
    stim[4] = 12'h950;
    stim[5] = 12'hac0;
    stim[6] = 12'he66;
    stim[7] = 12'h70c;
    stim[8] = 12'h7ac;
    stim[9] = 12'ha18;
    stim[10] = 12'h54c;
    stim[11] = 12'h8e0;
    stim[12] = 12'h183;
    stim[13] = 12'h3f4;
    stim[14] = 12'h870;
    stim[15] = 12'hb2c;
    stim[16] = 12'h6e6;
    stim[17] = 12'ha24;
    stim[18] = 12'h9da;
    stim[19] = 12'ha98;
    stim[20] = 12'h000;
    stim[21] = 12'h910;
    stim[22] = 12'hb10;
    stim[23] = 12'h0cc;
    stim[24] = 12'hb14;
    stim[25] = 12'h78c;
    stim[26] = 12'h0bc;
    stim[27] = 12'h214;
    stim[28] = 12'he4c;
    stim[29] = 12'h7e0;
    stim[30] = 12'h43e;
    stim[31] = 12'hebc;
    stim[32] = 12'h552;
    stim[33] = 12'hb70;
    stim[34] = 12'h8e0;
    stim[35] = 12'h24a;
    stim[36] = 12'h838;
    stim[37] = 12'hcb6;
    stim[38] = 12'h162;
    stim[39] = 12'h82e;
    stim[40] = 12'h72e;
    stim[41] = 12'h564;
    stim[42] = 12'h05e;
    stim[43] = 12'ha24;
    stim[44] = 12'h33a;
    stim[45] = 12'h6ea;
    stim[46] = 12'h11e;
    stim[47] = 12'h4c4;
    stim[48] = 12'h3a4;
    stim[49] = 12'h8a6;
    stim[50] = 12'h0d4;
    stim[51] = 12'h9a2;
    stim[52] = 12'h406;
    stim[53] = 12'h1be;
    stim[54] = 12'h444;
    stim[55] = 12'h87a;
    stim[56] = 12'h836;
    stim[57] = 12'h592;
    stim[58] = 12'hae6;
    stim[59] = 12'h6fa;
    stim[60] = 12'h0b0;
    stim[61] = 12'h466;
    stim[62] = 12'hc9c;
    stim[63] = 12'hf3c;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h005;
      expv[4] = 10'h005;
      expv[5] = 10'h005;
      expv[6] = 10'h005;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'h004;
      expv[14] = 10'h005;
      expv[15] = 10'h005;
      expv[16] = 10'h005;
      expv[17] = 10'h2c9;
      expv[18] = 10'h2c9;
      expv[19] = 10'hxxx;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'hxxx;
      expv[30] = 10'hxxx;
      expv[31] = 10'h1c1;
      expv[32] = 10'h1c1;
      expv[33] = 10'h031;
      expv[34] = 10'h031;
      expv[35] = 10'h031;
      expv[36] = 10'h151;
      expv[37] = 10'h151;
      expv[38] = 10'h1e1;
      expv[39] = 10'h02d;
      expv[40] = 10'hxxx;
      expv[41] = 10'h391;
      expv[42] = 10'h391;
      expv[43] = 10'h10d;
      expv[44] = 10'h10d;
      expv[45] = 10'h3ad;
      expv[46] = 10'h20d;
      expv[47] = 10'h209;
      expv[48] = 10'h209;
      expv[49] = 10'h209;
      expv[50] = 10'h1c9;
      expv[51] = 10'h1c9;
      expv[52] = 10'hxxx;
      expv[53] = 10'h015;
      expv[54] = 10'h2c9;
      expv[55] = 10'h2c9;
      expv[56] = 10'h045;
      expv[57] = 10'h1c1;
      expv[58] = 10'h031;
      expv[59] = 10'h151;
      expv[60] = 10'h1e1;
      expv[61] = 10'h1e1;
      expv[62] = 10'h02d;
      expv[63] = 10'h02d;
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
