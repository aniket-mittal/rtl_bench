// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087508 dut (
    .a_in(in_vec[43:28]),
    .b_in(in_vec[27:12]),
    .op_in(in_vec[11:4]),
    .z_flag_in(in_vec[3:3]),
    .s_flag_in(in_vec[2:2]),
    .c_flag_in(in_vec[1:1]),
    .ovr_flag_in(in_vec[0:0]),
    .c_out(out_vec[20:5]),
    .z_flag_out(out_vec[4:4]),
    .s_flag_out(out_vec[3:3]),
    .c_flag_out(out_vec[2:2]),
    .ovr_flag_out(out_vec[1:1]),
    .op_active(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'hc98d1be10b6;
    stim[1] = 44'hde53ebddc73;
    stim[2] = 44'hb5fccfea845;
    stim[3] = 44'h24bad9b5068;
    stim[4] = 44'hb9aacf60824;
    stim[5] = 44'h84c6a92afb4;
    stim[6] = 44'h8bdafa6c98a;
    stim[7] = 44'hbb00e4b3aab;
    stim[8] = 44'hd3976a2e1c3;
    stim[9] = 44'h75d201dc7b5;
    stim[10] = 44'h4990f047121;
    stim[11] = 44'ha852f096168;
    stim[12] = 44'hdea9f486e98;
    stim[13] = 44'h90a4b9a4d8c;
    stim[14] = 44'hd92cf405c92;
    stim[15] = 44'hcde6064a2b3;
    stim[16] = 44'hc02f0a0c56c;
    stim[17] = 44'h1c4699aa9e6;
    stim[18] = 44'h63410faa9ad;
    stim[19] = 44'hc5c331704a6;
    stim[20] = 44'h99bf32a5535;
    stim[21] = 44'h2ea40b11dab;
    stim[22] = 44'hb18efe6985e;
    stim[23] = 44'hf21533f2dcc;
    stim[24] = 44'h781cb4a8f05;
    stim[25] = 44'h70fcc9c5216;
    stim[26] = 44'h306b5b6859b;
    stim[27] = 44'h472a39207fa;
    stim[28] = 44'hfb984953a4a;
    stim[29] = 44'h4adecd57ed5;
    stim[30] = 44'h07ce8447c25;
    stim[31] = 44'hf664b4037b7;
    stim[32] = 44'h0daae0685b4;
    stim[33] = 44'h68c550b8ad5;
    stim[34] = 44'h40eeda02cf2;
    stim[35] = 44'ha0384a25131;
    stim[36] = 44'h1e200c70782;
    stim[37] = 44'had10fb89dce;
    stim[38] = 44'ha6e3b6a5754;
    stim[39] = 44'h011145c31ae;
    stim[40] = 44'ha126120442f;
    stim[41] = 44'hece4dcc1115;
    stim[42] = 44'h0390370d75a;
    stim[43] = 44'he26dc4d9a0b;
    stim[44] = 44'h962c3865248;
    stim[45] = 44'h9f5d3571be5;
    stim[46] = 44'h2e7a0065d7b;
    stim[47] = 44'h8622f01a3aa;
    stim[48] = 44'hdd5e312890e;
    stim[49] = 44'h701606df187;
    stim[50] = 44'hc0fa1d013ec;
    stim[51] = 44'h0e507dd0152;
    stim[52] = 44'h1883b357edf;
    stim[53] = 44'h23c63755627;
    stim[54] = 44'hc333e0ca28e;
    stim[55] = 44'h5f0053da232;
    stim[56] = 44'h84da6317caa;
    stim[57] = 44'hcebc2bfdcd0;
    stim[58] = 44'h435ea8d5c5f;
    stim[59] = 44'hdbc2f3560a2;
    stim[60] = 44'h9ef7a56abf4;
    stim[61] = 44'h9ea21212124;
    stim[62] = 44'hb2cfd704cb4;
    stim[63] = 44'h3b6712e61cf;
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
      expv[0] = 21'h000014;
      expv[1] = 21'h000016;
      expv[2] = 21'h000012;
      expv[3] = 21'h000010;
      expv[4] = 21'h000010;
      expv[5] = 21'h000010;
      expv[6] = 21'h000014;
      expv[7] = 21'h000016;
      expv[8] = 21'h000016;
      expv[9] = 21'h000012;
      expv[10] = 21'h000012;
      expv[11] = 21'h000010;
      expv[12] = 21'h000010;
      expv[13] = 21'h000010;
      expv[14] = 21'h000014;
      expv[15] = 21'h000016;
      expv[16] = 21'h000010;
      expv[17] = 21'h000014;
      expv[18] = 21'h000012;
      expv[19] = 21'h18906d;
      expv[20] = 21'h000012;
      expv[21] = 21'h000016;
      expv[22] = 21'h000014;
      expv[23] = 21'h000010;
      expv[24] = 21'h000012;
      expv[25] = 21'h000014;
      expv[26] = 21'h000016;
      expv[27] = 21'h000014;
      expv[28] = 21'h000014;
      expv[29] = 21'h000012;
      expv[30] = 21'h000012;
      expv[31] = 21'h000016;
      expv[32] = 21'h000010;
      expv[33] = 21'h000012;
      expv[34] = 21'h000014;
      expv[35] = 21'h000012;
      expv[36] = 21'h000014;
      expv[37] = 21'h000014;
      expv[38] = 21'h000010;
      expv[39] = 21'h000014;
      expv[40] = 21'h16644f;
      expv[41] = 21'h000012;
      expv[42] = 21'h000014;
      expv[43] = 21'h000016;
      expv[44] = 21'h000010;
      expv[45] = 21'h000012;
      expv[46] = 21'h000016;
      expv[47] = 21'h000014;
      expv[48] = 21'h000014;
      expv[49] = 21'h000016;
      expv[50] = 21'h000010;
      expv[51] = 21'h000014;
      expv[52] = 21'h000016;
      expv[53] = 21'h000016;
      expv[54] = 21'h000014;
      expv[55] = 21'h000014;
      expv[56] = 21'h000014;
      expv[57] = 21'h000010;
      expv[58] = 21'h000016;
      expv[59] = 21'h000014;
      expv[60] = 21'h000010;
      expv[61] = 21'h000010;
      expv[62] = 21'h000010;
      expv[63] = 21'h000016;
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
