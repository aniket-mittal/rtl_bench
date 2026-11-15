// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_nstate dut (
    .state(in_vec[23:21]),
    .prefix(in_vec[20:20]),
    .need_modrm(in_vec[19:19]),
    .need_off(in_vec[18:18]),
    .need_imm(in_vec[17:17]),
    .end_seq(in_vec[16:16]),
    .ftype(in_vec[15:10]),
    .of(in_vec[9:9]),
    .next_in_opco(in_vec[8:8]),
    .next_in_exec(in_vec[7:7]),
    .block(in_vec[6:6]),
    .div_exc(in_vec[5:5]),
    .tflm(in_vec[4:4]),
    .intr(in_vec[3:3]),
    .iflm(in_vec[2:2]),
    .nmir(in_vec[1:1]),
    .iflss(in_vec[0:0]),
    .next_state(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hff12b4;
    stim[1] = 24'h7853cb;
    stim[2] = 24'h716269;
    stim[3] = 24'h9b9d76;
    stim[4] = 24'ha7a640;
    stim[5] = 24'h99b705;
    stim[6] = 24'h929d4e;
    stim[7] = 24'h11f12c;
    stim[8] = 24'h2acfa6;
    stim[9] = 24'h0067bc;
    stim[10] = 24'h856691;
    stim[11] = 24'hed3bbb;
    stim[12] = 24'h03f422;
    stim[13] = 24'h89a78c;
    stim[14] = 24'h8117bc;
    stim[15] = 24'h6436fe;
    stim[16] = 24'h5d79ab;
    stim[17] = 24'hca524c;
    stim[18] = 24'hdb4f4a;
    stim[19] = 24'hdd2fa2;
    stim[20] = 24'hea0230;
    stim[21] = 24'hd977f8;
    stim[22] = 24'h49b5b1;
    stim[23] = 24'h9ddd0f;
    stim[24] = 24'h5d4a38;
    stim[25] = 24'ha3f587;
    stim[26] = 24'h0dbc19;
    stim[27] = 24'h3029fe;
    stim[28] = 24'h462e6a;
    stim[29] = 24'h22c31f;
    stim[30] = 24'h46f1ca;
    stim[31] = 24'hef4b2f;
    stim[32] = 24'h40a211;
    stim[33] = 24'h4b5dd0;
    stim[34] = 24'h0c10b5;
    stim[35] = 24'hc253fa;
    stim[36] = 24'heaa4c6;
    stim[37] = 24'h9d5bbc;
    stim[38] = 24'h8ba0cc;
    stim[39] = 24'h268d83;
    stim[40] = 24'hc475be;
    stim[41] = 24'h0de71f;
    stim[42] = 24'hd4c25c;
    stim[43] = 24'h331eac;
    stim[44] = 24'h75d327;
    stim[45] = 24'hb27dc6;
    stim[46] = 24'h5c47b1;
    stim[47] = 24'h8f1327;
    stim[48] = 24'h7e24fa;
    stim[49] = 24'ha06cff;
    stim[50] = 24'h1fdeb3;
    stim[51] = 24'h4a48b9;
    stim[52] = 24'hb0d339;
    stim[53] = 24'hdec7f8;
    stim[54] = 24'ha23570;
    stim[55] = 24'h25f52c;
    stim[56] = 24'h5eb8ad;
    stim[57] = 24'h136f14;
    stim[58] = 24'h21dcc1;
    stim[59] = 24'h5d551d;
    stim[60] = 24'ha14e0f;
    stim[61] = 24'h0b576d;
    stim[62] = 24'h3747a9;
    stim[63] = 24'ha433eb;
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
      expv[0] = 3'h4;
      expv[1] = 3'h3;
      expv[2] = 3'h3;
      expv[3] = 3'h4;
      expv[4] = 3'h5;
      expv[5] = 3'h0;
      expv[6] = 3'h4;
      expv[7] = 3'h0;
      expv[8] = 3'h3;
      expv[9] = 3'h0;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h3;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h3;
      expv[16] = 3'h4;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h6;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h1;
      expv[27] = 3'h1;
      expv[28] = 3'h2;
      expv[29] = 3'h3;
      expv[30] = 3'h2;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h2;
      expv[34] = 3'h1;
      expv[35] = 3'h6;
      expv[36] = 3'h7;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h2;
      expv[40] = 3'h4;
      expv[41] = 3'h0;
      expv[42] = 3'h6;
      expv[43] = 3'h3;
      expv[44] = 3'h4;
      expv[45] = 3'h5;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h3;
      expv[49] = 3'h5;
      expv[50] = 3'h0;
      expv[51] = 3'h3;
      expv[52] = 3'h4;
      expv[53] = 3'h6;
      expv[54] = 3'h5;
      expv[55] = 3'h2;
      expv[56] = 3'h3;
      expv[57] = 3'h0;
      expv[58] = 3'h1;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h0;
      expv[62] = 3'h2;
      expv[63] = 3'h5;
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
