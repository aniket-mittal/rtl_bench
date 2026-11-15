// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04608 dut (
    .spc6_pcx_req_bufpt_pq_l(in_vec[16:12]),
    .spc6_pcx_atom_bufpt_pq_l(in_vec[11:11]),
    .spc7_pcx_req_bufpt_pq_l(in_vec[10:6]),
    .spc7_pcx_atom_bufpt_pq_l(in_vec[5:5]),
    .pcx_spc7_grant_bufp3_pa_l(in_vec[4:0]),
    .pcx_spc7_grant_bufp4_pa(out_vec[16:12]),
    .spc6_pcx_req_bufp4_pq(out_vec[11:7]),
    .spc6_pcx_atom_bufp4_pq(out_vec[6:6]),
    .spc7_pcx_req_bufp4_pq(out_vec[5:1]),
    .spc7_pcx_atom_bufp4_pq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h08221;
    stim[1] = 17'h04e46;
    stim[2] = 17'h17136;
    stim[3] = 17'h0fffc;
    stim[4] = 17'h16bc5;
    stim[5] = 17'h198fc;
    stim[6] = 17'h172dd;
    stim[7] = 17'h0e138;
    stim[8] = 17'h0f091;
    stim[9] = 17'h19c80;
    stim[10] = 17'h10be0;
    stim[11] = 17'h08c0b;
    stim[12] = 17'h09a75;
    stim[13] = 17'h0b520;
    stim[14] = 17'h055d8;
    stim[15] = 17'h140e5;
    stim[16] = 17'h167e3;
    stim[17] = 17'h06753;
    stim[18] = 17'h06d8c;
    stim[19] = 17'h18dc1;
    stim[20] = 17'h1ee95;
    stim[21] = 17'h14e4e;
    stim[22] = 17'h1b25a;
    stim[23] = 17'h0de23;
    stim[24] = 17'h01640;
    stim[25] = 17'h0fba5;
    stim[26] = 17'h08cc4;
    stim[27] = 17'h0bb7f;
    stim[28] = 17'h12c20;
    stim[29] = 17'h06b5a;
    stim[30] = 17'h0e1f3;
    stim[31] = 17'h07eb9;
    stim[32] = 17'h086bc;
    stim[33] = 17'h14242;
    stim[34] = 17'h18c23;
    stim[35] = 17'h09f50;
    stim[36] = 17'h04928;
    stim[37] = 17'h04bee;
    stim[38] = 17'h1248f;
    stim[39] = 17'h05d5f;
    stim[40] = 17'h0dc21;
    stim[41] = 17'h0138a;
    stim[42] = 17'h0a44b;
    stim[43] = 17'h15c78;
    stim[44] = 17'h1091b;
    stim[45] = 17'h0535f;
    stim[46] = 17'h1e36c;
    stim[47] = 17'h097ee;
    stim[48] = 17'h1087b;
    stim[49] = 17'h084ff;
    stim[50] = 17'h1f8b0;
    stim[51] = 17'h0a8b1;
    stim[52] = 17'h1677b;
    stim[53] = 17'h15e83;
    stim[54] = 17'h1e437;
    stim[55] = 17'h17381;
    stim[56] = 17'h0bfeb;
    stim[57] = 17'h068c3;
    stim[58] = 17'h0a676;
    stim[59] = 17'h0beef;
    stim[60] = 17'h02269;
    stim[61] = 17'h1c79b;
    stim[62] = 17'h02003;
    stim[63] = 17'h1f930;
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
      expv[0] = 17'h1ebee;
      expv[1] = 17'h19d8d;
      expv[2] = 17'h09476;
      expv[3] = 17'h03800;
      expv[4] = 17'h1a4a1;
      expv[5] = 17'h03338;
      expv[6] = 17'h02469;
      expv[7] = 17'h078f6;
      expv[8] = 17'h0e87b;
      expv[9] = 17'h1f31b;
      expv[10] = 17'h1f7a0;
      expv[11] = 17'h14b9f;
      expv[12] = 17'h0ab2c;
      expv[13] = 17'h1fa56;
      expv[14] = 17'h07d51;
      expv[15] = 17'h1a5f8;
      expv[16] = 17'h1c4c0;
      expv[17] = 17'h0ccc5;
      expv[18] = 17'h13c93;
      expv[19] = 17'h1e391;
      expv[20] = 17'h0a08b;
      expv[21] = 17'h1158d;
      expv[22] = 17'h0526d;
      expv[23] = 17'h1c90e;
      expv[24] = 17'h1ff4d;
      expv[25] = 17'h1a822;
      expv[26] = 17'h1bb99;
      expv[27] = 17'h00a24;
      expv[28] = 17'h1f69e;
      expv[29] = 17'h05ca5;
      expv[30] = 17'h0c8f0;
      expv[31] = 17'h06c0a;
      expv[32] = 17'h03bca;
      expv[33] = 17'h1d5ed;
      expv[34] = 17'h1c39e;
      expv[35] = 17'h0fb05;
      expv[36] = 17'h17db6;
      expv[37] = 17'h11da0;
      expv[38] = 17'h106db;
      expv[39] = 17'h00d15;
      expv[40] = 17'h1e91e;
      expv[41] = 17'h15f63;
      expv[42] = 17'h14add;
      expv[43] = 17'h0751c;
      expv[44] = 17'h047b7;
      expv[45] = 17'h00d65;
      expv[46] = 17'h130e4;
      expv[47] = 17'h11b40;
      expv[48] = 17'h047bc;
      expv[49] = 17'h00bd8;
      expv[50] = 17'h0f03a;
      expv[51] = 17'h0eaba;
      expv[52] = 17'h044c4;
      expv[53] = 17'h1c50b;
      expv[54] = 17'h080de;
      expv[55] = 17'h1e463;
      expv[56] = 17'h14a00;
      expv[57] = 17'h1ccb9;
      expv[58] = 17'h09acc;
      expv[59] = 17'h10a08;
      expv[60] = 17'h16eec;
      expv[61] = 17'h041c3;
      expv[62] = 17'h1ceff;
      expv[63] = 17'h0f036;
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
