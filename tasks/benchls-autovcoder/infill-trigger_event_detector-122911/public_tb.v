// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_122911 dut (
    .i_sys_clk(clk),
    .i_data(in_vec[22:15]),
    .i_channel_select(in_vec[14:12]),
    .i_trigger_type(in_vec[11:11]),
    .i_enable(in_vec[10:10]),
    .i_sample_clk_posedge(in_vec[9:9]),
    .i_trigger_delay_en(in_vec[8:8]),
    .i_trigger_delay(in_vec[7:0]),
    .o_triggered_state(out_vec[1:1]),
    .o_event_pulse(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h0cc128;
    stim[1] = 23'h429252;
    stim[2] = 23'h2a6d3e;
    stim[3] = 23'h2b92b7;
    stim[4] = 23'h56cde3;
    stim[5] = 23'h33bbcc;
    stim[6] = 23'h74eeff;
    stim[7] = 23'h64dd70;
    stim[8] = 23'h0c521e;
    stim[9] = 23'h7534f9;
    stim[10] = 23'h7a549d;
    stim[11] = 23'h327663;
    stim[12] = 23'h2a2dc6;
    stim[13] = 23'h5a1f25;
    stim[14] = 23'h727e26;
    stim[15] = 23'h482097;
    stim[16] = 23'h25337d;
    stim[17] = 23'h183a8f;
    stim[18] = 23'h427a86;
    stim[19] = 23'h47ddba;
    stim[20] = 23'h554dfe;
    stim[21] = 23'h69cfb2;
    stim[22] = 23'h294f27;
    stim[23] = 23'h06eabd;
    stim[24] = 23'h23d43c;
    stim[25] = 23'h00151f;
    stim[26] = 23'h24137e;
    stim[27] = 23'h3a4eba;
    stim[28] = 23'h3a7bc6;
    stim[29] = 23'h24af0d;
    stim[30] = 23'h31dae6;
    stim[31] = 23'h6923d7;
    stim[32] = 23'h6d9dca;
    stim[33] = 23'h137da2;
    stim[34] = 23'h3315f9;
    stim[35] = 23'h00ad80;
    stim[36] = 23'h70e798;
    stim[37] = 23'h5bb5ea;
    stim[38] = 23'h5fc1a6;
    stim[39] = 23'h7bf8c0;
    stim[40] = 23'h159d0a;
    stim[41] = 23'h24d9ba;
    stim[42] = 23'h205b84;
    stim[43] = 23'h7c2bf8;
    stim[44] = 23'h4dd3f2;
    stim[45] = 23'h0c1ae6;
    stim[46] = 23'h034631;
    stim[47] = 23'h497472;
    stim[48] = 23'h17cac0;
    stim[49] = 23'h3aca7d;
    stim[50] = 23'h096561;
    stim[51] = 23'h5c219e;
    stim[52] = 23'h76ea48;
    stim[53] = 23'h5c3640;
    stim[54] = 23'h5a15b2;
    stim[55] = 23'h0daac3;
    stim[56] = 23'h782e43;
    stim[57] = 23'h735933;
    stim[58] = 23'h4f8fcc;
    stim[59] = 23'h76180e;
    stim[60] = 23'h12d024;
    stim[61] = 23'h66f806;
    stim[62] = 23'h2a7adc;
    stim[63] = 23'h509102;
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
      expv[0] = 2'hx;
      expv[1] = 2'h1;
      expv[2] = 2'h0;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h0;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h1;
      expv[12] = 2'h0;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h3;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h2;
      expv[48] = 2'h3;
      expv[49] = 2'h1;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h0;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h0;
      expv[58] = 2'h1;
      expv[59] = 2'h2;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h1;
      expv[63] = 2'h0;
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
