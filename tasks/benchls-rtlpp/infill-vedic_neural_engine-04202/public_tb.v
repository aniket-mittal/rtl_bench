// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04202 dut (
    .clock(clk),
    .Dn(in_vec[30:23]),
    .Xn(in_vec[22:15]),
    .Wn(in_vec[14:7]),
    .memory_Dn_active(in_vec[6:6]),
    .memory_Xn_active(in_vec[5:5]),
    .memory_bobot_active(in_vec[4:4]),
    .y_active(in_vec[3:3]),
    .e_active(in_vec[2:2]),
    .w_active(in_vec[1:1]),
    .sys_reset_active(in_vec[0:0]),
    .z(out_vec[13:6]),
    .done_read_Dn(out_vec[5:5]),
    .done_read_Xn(out_vec[4:4]),
    .done_yn(out_vec[3:3]),
    .done_en(out_vec[2:2]),
    .done_write_wn(out_vec[1:1]),
    .done_wn1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h05f54b33;
    stim[1] = 31'h033ceae9;
    stim[2] = 31'h757c2b02;
    stim[3] = 31'h0a2a91b2;
    stim[4] = 31'h0a9f7506;
    stim[5] = 31'h1a01a67c;
    stim[6] = 31'h70fae36c;
    stim[7] = 31'h7b6405c0;
    stim[8] = 31'h33f02928;
    stim[9] = 31'h5ae01826;
    stim[10] = 31'h04a59efe;
    stim[11] = 31'h6b222690;
    stim[12] = 31'h1612c36a;
    stim[13] = 31'h307027da;
    stim[14] = 31'h4dc175c2;
    stim[15] = 31'h7b308108;
    stim[16] = 31'h244541e6;
    stim[17] = 31'h04732bec;
    stim[18] = 31'h0e03e946;
    stim[19] = 31'h4fa10bb4;
    stim[20] = 31'h6c61752c;
    stim[21] = 31'h5d3eca02;
    stim[22] = 31'h684db246;
    stim[23] = 31'h414ff99a;
    stim[24] = 31'h05c155d2;
    stim[25] = 31'h4ef7f13f;
    stim[26] = 31'h39e04134;
    stim[27] = 31'h6474cc7e;
    stim[28] = 31'h356daece;
    stim[29] = 31'h7ac698c6;
    stim[30] = 31'h4bae8736;
    stim[31] = 31'h6acdff62;
    stim[32] = 31'h287c7354;
    stim[33] = 31'h589cc1a6;
    stim[34] = 31'h5b280130;
    stim[35] = 31'h0be5ce78;
    stim[36] = 31'h2313e01c;
    stim[37] = 31'h5f0dddca;
    stim[38] = 31'h390d3ada;
    stim[39] = 31'h7b584780;
    stim[40] = 31'h508bb896;
    stim[41] = 31'h5664bd04;
    stim[42] = 31'h01441032;
    stim[43] = 31'h49702cc4;
    stim[44] = 31'h721ebd96;
    stim[45] = 31'h17cd27a6;
    stim[46] = 31'h687ecad4;
    stim[47] = 31'h04233e52;
    stim[48] = 31'h54a1bbec;
    stim[49] = 31'h7eb4841c;
    stim[50] = 31'h1e36d5da;
    stim[51] = 31'h7adbb030;
    stim[52] = 31'h21e19c03;
    stim[53] = 31'h55cb117c;
    stim[54] = 31'h679ae914;
    stim[55] = 31'h58cad49c;
    stim[56] = 31'h09d696e2;
    stim[57] = 31'h3a5ae458;
    stim[58] = 31'h00ca5530;
    stim[59] = 31'h7cf3e3f6;
    stim[60] = 31'h7afe5e2d;
    stim[61] = 31'h0c08d1a2;
    stim[62] = 31'h58b0ce7a;
    stim[63] = 31'h1f08c5a6;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0001;
      expv[4] = 14'h0013;
      expv[5] = 14'hxxx7;
      expv[6] = 14'hxxxf;
      expv[7] = 14'hxxxf;
      expv[8] = 14'hxxxf;
      expv[9] = 14'hxxxf;
      expv[10] = 14'hxxxf;
      expv[11] = 14'hxxxf;
      expv[12] = 14'hxxxf;
      expv[13] = 14'hxxxf;
      expv[14] = 14'hxxxf;
      expv[15] = 14'hxxxf;
      expv[16] = 14'hxxxf;
      expv[17] = 14'hxxxf;
      expv[18] = 14'hxxxf;
      expv[19] = 14'hxxxf;
      expv[20] = 14'hxxxf;
      expv[21] = 14'hxxxf;
      expv[22] = 14'hxxxf;
      expv[23] = 14'hxxxf;
      expv[24] = 14'hxxxf;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'hxxx6;
      expv[28] = 14'hxxxf;
      expv[29] = 14'hxxxf;
      expv[30] = 14'hxxxf;
      expv[31] = 14'hxxxf;
      expv[32] = 14'hxxxf;
      expv[33] = 14'hxxxf;
      expv[34] = 14'hxxxf;
      expv[35] = 14'hxxxf;
      expv[36] = 14'hxxxf;
      expv[37] = 14'hxxxf;
      expv[38] = 14'hxxxf;
      expv[39] = 14'hxxxf;
      expv[40] = 14'hxxxf;
      expv[41] = 14'hxxxf;
      expv[42] = 14'hxxxf;
      expv[43] = 14'hxxxf;
      expv[44] = 14'hxxxf;
      expv[45] = 14'hxxxf;
      expv[46] = 14'hxxxf;
      expv[47] = 14'hxxxf;
      expv[48] = 14'hxxxf;
      expv[49] = 14'hxxxf;
      expv[50] = 14'hxxxf;
      expv[51] = 14'hxxxf;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'hxxxe;
      expv[55] = 14'hxxxe;
      expv[56] = 14'hxxxe;
      expv[57] = 14'hxxxf;
      expv[58] = 14'hxxxf;
      expv[59] = 14'hxxxf;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0011;
      expv[63] = 14'h003b;
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
